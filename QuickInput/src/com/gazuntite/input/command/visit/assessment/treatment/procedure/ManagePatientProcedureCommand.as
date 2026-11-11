package com.gazuntite.input.command.visit.assessment.treatment.procedure
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.common.dto.assessment.procedure.ProcedureDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.event.history.assessment.treatment.LoadProcedureByPatientIdPagedEvent;
	import com.gazuntite.input.delegate.visit.assessment.treatment.procedure.ManagePatientProcedureDelegate;
	import com.gazuntite.input.event.visit.assessment.treatment.procedure.LoadProcedureByVisitIDEvent;
	import com.gazuntite.input.event.visit.assessment.treatment.procedure.ManagePatientProcedureEvent;
	import com.gazuntite.input.event.visit.visit.GetVisitChargesEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class ManagePatientProcedureCommand implements Command , IResponder
	{
		[Bindable]
		private var model:QIModelLocator = QIModelLocator.getInstance();
		
		private var sectionName:String;
		
		public function ManagePatientProcedureCommand()
		{
		}
		
		public function execute(cgEvent:CairngormEvent):void
		{
			
			if (model.LoggedInUserId)
			{
				var LE:ManagePatientProcedureEvent = cgEvent as ManagePatientProcedureEvent;
				
				sectionName = LE.sectioName;
				
				var delegate:ManagePatientProcedureDelegate= new ManagePatientProcedureDelegate(this);
				var arrCol:ArrayCollection;
				
				switch (sectionName)
				{
					case QIConstants.INPUT_VIEW:
						
						arrCol = model.procedureDTOList;
						
						break;
					
					case QIConstants.HISTORY_VIEW:
						
						arrCol = model.procedureDTOHistoryList;
						
						break;
				}
				
				if (arrCol != null)
				{				
					var procedure:ProcedureDTO;
					var i:int;
					
					for (i = 0; i < arrCol.length; i++)
					{
						procedure = arrCol.getItemAt(i) as ProcedureDTO;
						
						if (procedure.VisitDate == null)
						{
							procedure.VisitDate = QIConstants.NULL_DATE;
						}
						
						procedure.ModifiedBy = model.LoggedInUserId;
						procedure.ModifiedAt = new Date();
					}
					
					var newList:ArrayCollection = new ArrayCollection();
					var actionDate:String = UtilityFunctions.FormatDate( new Date(), "MM-DD-YYYY");
					
					for (i = 0; i < arrCol.length; i++)
					{
						procedure = arrCol.getItemAt(i) as ProcedureDTO;
						
						if (procedure.IsDeleted == true || procedure.IsDirty == true)
						{
							newList.addItem(procedure);
						}
					}
					
					if (newList.length > 0)
						delegate.ManagePatientProcedure(newList, model.LoggedInUserId, model.VisitID, model.patientDTO.ID, 
									model.LoggedInUserSelectedBranchId, actionDate, model.LoggedInUserSessionID);
				}
			}
		}	
	
		public function result(rpcEvent:Object):void
		{
			if (model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				if (re.result.@Status == "true")
				{
					//[07/19/2013] Shahid Munir, to update visit charges in super bill
					var gvce:GetVisitChargesEvent = new GetVisitChargesEvent(model.VisitID); 
					CairngormEventDispatcher.getInstance().dispatchEvent(gvce);
					
					switch (sectionName)
					{
						case QIConstants.INPUT_VIEW:						
							
							var lpihEvent:LoadProcedureByVisitIDEvent = new LoadProcedureByVisitIDEvent(); 
							CairngormEventDispatcher.getInstance().dispatchEvent(lpihEvent);
							
							break;
						
						case QIConstants.HISTORY_VIEW:
							
							var lpppEvent:LoadProcedureByPatientIdPagedEvent = new LoadProcedureByPatientIdPagedEvent();
							CairngormEventDispatcher.getInstance().dispatchEvent(lpppEvent);
							
							break;
					}
				}
					
				else
				{
					UtilityFunctions.ShowMessage("ManagePatientProcedure \n\t No data returned from service.\nMesage: \n\t" + re.result.@Message + "\nDetails: \n\t" + re.result.@Details ,"Info");
				}
			}
		}
		
		public function fault(rpcEvent:Object):void
		{
			var errorStatus:String = "Fault occured in ManagePatientProcedure.";
			
			var userId:int = UtilityFunctions.IsNullOrEmpty(model.LoggedInUserId) ? -1 : model.LoggedInUserId;
			
			QSCombinedExceptionAlert.getInstance().Show(errorStatus, rpcEvent.toString(), userId);
		}
	}
}