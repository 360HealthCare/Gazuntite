package com.gazuntite.patient.visit.command.assessment.treatment.procedure
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.patient.visit.delegate.assessment.treatment.procedure.ManagePatientProcedureDelegate;
	import com.gazuntite.patient.visit.dto.ProcedureDTO;
	import com.gazuntite.patient.visit.event.assessment.treatment.procedure.LoadProcedureByVisitIDEvent;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.patient.visit.utils.Constants;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class ManagePatientProcedureCommand implements Command , IResponder
	{
		[Bindable]
		private var model:QIModelLocator = QIModelLocator.getInstance();
		
		public function ManagePatientProcedureCommand()
		{
		}
		
		public function execute( cgEvent:CairngormEvent ) : void {
			if(model.LoggedInUserId)
			{
				var delegate : ManagePatientProcedureDelegate= new ManagePatientProcedureDelegate( this );
				
				
				if(model.ProcedureDTOList!=null)
				{				
					
					var i:int;
					for(i=0;i<model.ProcedureDTOList.length;i++)
					{
						var procedure:ProcedureDTO = model.ProcedureDTOList.getItemAt(i) as ProcedureDTO;
						
						if(procedure.VisitDate == null)
						{
							procedure.VisitDate= Constants.NULL_DATE;
						}
						
						procedure.ModifiedBy = model.LoggedInUserId;
						procedure.ModifiedAt = new Date();
					}
					
					var newList:ArrayCollection = new ArrayCollection();
					var actionDate:String = UtilityFunctions.FormatDate( new Date(), "MM-DD-YYYY");
					
					for(i=0;i<model.ProcedureDTOList.length;i++)
					{
						var procedure:ProcedureDTO = model.ProcedureDTOList.getItemAt(i) as ProcedureDTO;
						
						if(procedure.IsDeleted == true || procedure.IsDirty == true)
						{
							newList.addItem(procedure);
						}
						
					}
					if(newList.length>0)
						delegate.ManagePatientProcedure(newList,model.LoggedInUserId, model.VisitID , model.patientID,model.LoggedInUserSelectedBranchId, actionDate, model.LoggedInUserSessionID);
				}
			}
		}	
	
		public function result(rpcEvent:Object):void
		{
			if(model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				if(re.result.@Status == "true")
				{
					//UtilityFunctions.ShowMessage( "ManagePatientProcedure Saved.", "Info" )
					var lpihEvent: LoadProcedureByVisitIDEvent = new LoadProcedureByVisitIDEvent(); 
					CairngormEventDispatcher.getInstance().dispatchEvent( lpihEvent );
				}
					
				else
				{
					UtilityFunctions.ShowMessage("ManagePatientProcedure \n\t No data returned from service.\nMesage: \n\t" + re.result.@Message + "\nDetails: \n\t" + re.result.@Details ,"Info");
				}
				
			}
		}
		
		
		
		public function fault( rpcEvent : Object ) : void 
		{
			var errorStatus:String = "Fault occured in ManagePatientProcedure.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
	}
}