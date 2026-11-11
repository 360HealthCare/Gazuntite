package com.gazuntite.patient.visit.command.assessment.plan.recomendation
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.patient.visit.delegate.assessment.plan.recomendation.ManagePatientRecommendationDelegate;
	import com.gazuntite.patient.visit.dto.PatientRecommendationDTO;
	import com.gazuntite.patient.visit.event.assessment.plan.recomendation.LoadPatientRecommendationByVisitIdEvents;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.patient.visit.utils.Constants;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class ManagePatientRecommendationCommand implements Command , IResponder
	{
		[Bindable]
		private var model:QIModelLocator = QIModelLocator.getInstance();
		
		public function ManagePatientRecommendationCommand()
		{
		}
		
		public function execute( cgEvent:CairngormEvent ) : void {
			if(model.LoggedInUserId)
			{
				var delegate : ManagePatientRecommendationDelegate= new ManagePatientRecommendationDelegate( this );
				
				
				if(model.laboutDTOList!=null)
				{				
					
					var i:int;
					for(i=0;i<model.RecommendationDTOList.length;i++)
					{
						var recomandationDTO:PatientRecommendationDTO =model.RecommendationDTOList.getItemAt(i) as PatientRecommendationDTO;
						
						if(recomandationDTO.VisitDate == null)
						{
							recomandationDTO.VisitDate= Constants.NULL_DATE;
						}
						
						recomandationDTO.ModifiedBy = model.LoggedInUserId;
						recomandationDTO.ModifiedAt = new Date();
					}
					
					var newList:ArrayCollection = new ArrayCollection();
					var actionDate:String = UtilityFunctions.FormatDate( new Date(), "MM-DD-YYYY");
					
					for(i=0;i<model.RecommendationDTOList.length;i++)
					{
						var recomandationDTO:PatientRecommendationDTO = model.RecommendationDTOList.getItemAt(i) as PatientRecommendationDTO;
						
						if(recomandationDTO.IsDeleted == true || recomandationDTO.IsDirty == true)
						{
							newList.addItem(recomandationDTO);
						}
						
					}
					if(newList.length>0)
						delegate.ManagePatientRecommendation(newList, model.LoggedInUserId, model.VisitID, model.patientID , model.LoggedInUserSelectedBranchId ,actionDate , model.LoggedInUserSessionID  );
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
					//UtilityFunctions.ShowMessage( "ManagePatientRecomendation Saved.", "Info" )
					var lpihEvent: LoadPatientRecommendationByVisitIdEvents = new LoadPatientRecommendationByVisitIdEvents(); 
					CairngormEventDispatcher.getInstance().dispatchEvent( lpihEvent );
				}
					
				else
				{
					UtilityFunctions.ShowMessage("ManagePatientRecomendation \n\t No data returned from service.\nMesage: \n\t" + re.result.@Message + "\nDetails: \n\t" + re.result.@Details ,"Info");
				}
				
			}
		}
		
		
		
		public function fault( rpcEvent : Object ) : void 
		{
			var errorStatus:String = "Fault occured in ManagePatientLabOut.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
	}
}