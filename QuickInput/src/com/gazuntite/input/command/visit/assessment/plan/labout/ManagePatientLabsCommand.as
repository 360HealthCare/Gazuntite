package com.gazuntite.input.command.visit.assessment.plan.labout
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.common.dto.assessment.labOut.LabDTO;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.input.event.history.assessment.plan.labOut.LoadLabsByPatientIdPagedEvent;
	import com.gazuntite.input.delegate.visit.assessment.plan.labout.ManagePatientLabsDelegate;
	import com.gazuntite.input.event.visit.assessment.plan.labout.LoadPatientLabsByVisitEvent;
	import com.gazuntite.input.event.visit.assessment.plan.labout.ManagePatientLabsEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class ManagePatientLabsCommand implements Command , IResponder
	{
		[Bindable]
		private var model:QIModelLocator = QIModelLocator.getInstance();
		private var sectionName:String;
		
		public function ManagePatientLabsCommand()
		{
		}
		
		public function execute(cgEvent:CairngormEvent):void
		{
			if (model.LoggedInUserId)
			{
				var delegate:ManagePatientLabsDelegate= new ManagePatientLabsDelegate(this);
				var LE:ManagePatientLabsEvent = cgEvent as ManagePatientLabsEvent;
				
				sectionName = LE.sectionName;
				var arrCol:ArrayCollection;
				
				switch (sectionName)
				{
					case QIConstants.INPUT_VIEW:
						
						arrCol = model.laboutDTOList;
						
						break;
					
					case QIConstants.HISTORY_VIEW:
						
						arrCol = model.labDTOHistoryList;
						
						break;
				}
				
				if (arrCol != null)
				{				
					var laboutDTO:LabDTO;
					
					var newList:ArrayCollection = new ArrayCollection();
					
					for (var i:int =0; i < arrCol.length;i++)
					{
						laboutDTO = arrCol.getItemAt(i) as LabDTO;
						
						if (laboutDTO.IsDeleted == true || laboutDTO.IsDirty == true)
						{
							if (laboutDTO.VisitDate == null)
							{
								laboutDTO.VisitDate= QIConstants.NULL_DATE;
							}
							
							laboutDTO.ModifiedBy = model.LoggedInUserId;
							laboutDTO.ModifiedAt = new Date();
							
							newList.addItem(laboutDTO);
						}
						
					}
					
					if (newList.length > 0)
						delegate.ManagelaboutDTO(newList, model.LoggedInUserSessionID);
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
					switch (sectionName)
					{
						case QIConstants.INPUT_VIEW:
							
							var lpihEvent: LoadPatientLabsByVisitEvent = new LoadPatientLabsByVisitEvent(); 
							CairngormEventDispatcher.getInstance().dispatchEvent(lpihEvent);
							
							break;
						
						case QIConstants.HISTORY_VIEW:
							
							var lplp:LoadLabsByPatientIdPagedEvent = new LoadLabsByPatientIdPagedEvent();
							CairngormEventDispatcher.getInstance().dispatchEvent(lplp);
							
							break;
					}
				}
					
				else
				{
					UtilityFunctions.ShowMessage("ManagePatientLabOut \n\t No data returned from service.\nMesage: \n\t" + re.result.@Message + "\nDetails: \n\t" + re.result.@Details ,"Info");
				}
			}
		}
		
		public function fault(rpcEvent:Object):void 
		{
			var errorStatus:String = "Fault occured in ManagePatientLabOut.";
			var userId:int = UtilityFunctions.IsNullOrEmpty(model.LoggedInUserId) ? -1 : model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show(errorStatus, rpcEvent.toString(), userId);
		}
	}
}