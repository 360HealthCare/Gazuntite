package com.gazuntite.patient.visit.command.assessment.plan.followup
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.patient.visit.delegate.assessment.plan.followup.ManagePatientFollowupMergedDelegate;
	import com.gazuntite.patient.visit.dto.PatientFollowupMergedDTO;
	import com.gazuntite.patient.visit.event.assessment.plan.followup.LoadFollowUpMergeByVisitIdEvent;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.patient.visit.utils.Constants;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class ManagePatientFollowupMergedCommand implements Command , IResponder
	{
		[Bindable]
		private var model:QIModelLocator = QIModelLocator.getInstance();
		
		public function ManagePatientFollowupMergedCommand()
		{
		}
		
		
		public function execute( cgEvent:CairngormEvent ) : void {
			if(model.LoggedInUserId)
			{
				var delegate : ManagePatientFollowupMergedDelegate= new ManagePatientFollowupMergedDelegate( this );
				
				
				if(model.laboutDTOList!=null)
				{				
					
					var i:int;
					for(i=0;i<model.PatientFollowupMerged.length;i++)
					{
						var followUp:PatientFollowupMergedDTO =model.PatientFollowupMerged.getItemAt(i) as PatientFollowupMergedDTO;
						
						if(followUp.VisitDate == null)
						{
							followUp.VisitDate= Constants.NULL_DATE;
						}
						
						followUp.ModifiedBy = model.LoggedInUserId;
						followUp.ModifiedAt = new Date();
					}
					
					var newList:ArrayCollection = new ArrayCollection();
					
					for(i=0;i<model.PatientFollowupMerged.length;i++)
					{
						var followUp:PatientFollowupMergedDTO = model.PatientFollowupMerged.getItemAt(i) as PatientFollowupMergedDTO;
						
						if(followUp.IsDeleted == true || followUp.IsDirty == true)
						{
							newList.addItem(followUp);
						}
						
					}
					if(newList.length>0)
						delegate.ManagefollowUp(newList, model.LoggedInUserSessionID);
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
					//UtilityFunctions.ShowMessage( "ManagePatientfollowup Saved.", "Info" )
					var lpihEvent: LoadFollowUpMergeByVisitIdEvent = new LoadFollowUpMergeByVisitIdEvent(); 
					CairngormEventDispatcher.getInstance().dispatchEvent( lpihEvent );
				}
					
				else
				{
					UtilityFunctions.ShowMessage("ManagePatientfollowup \n\t No data returned from service.\nMesage: \n\t" + re.result.@Message + "\nDetails: \n\t" + re.result.@Details ,"Info");
				}
				
			}
		}
		
		
		
		public function fault( rpcEvent : Object ) : void 
		{
			var errorStatus:String = "Fault occured in ManagePatientfollowup.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
	}
}