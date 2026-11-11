package com.gazuntite.patient.visit.command.assessment.diagnosis
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.patient.visit.delegate.assessment.diagnosis.ManagePatientDiagnosisDelegate;
	import com.gazuntite.patient.visit.dto.PatientDiagnosisDTO;
	import com.gazuntite.patient.visit.event.assessment.diagnosis.LoadPatientDiagnosisByVisitIdEvent;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.patient.visit.utils.Constants;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class ManagePatientDiagnosisCommand implements Command , IResponder
	{
		[Bindable]
		private var model:QIModelLocator = QIModelLocator.getInstance();
		
		public function ManagePatientDiagnosisCommand()
		{
		}
		
		public function execute( cgEvent:CairngormEvent ) : void {
			if(model.LoggedInUserId)
			{
				var delegate : ManagePatientDiagnosisDelegate= new ManagePatientDiagnosisDelegate( this );
				
				
				if(model.patientDiagnosisDTOListByPatientId!=null)
				{				
					
					var i:int;
					for(i=0;i<model.patientDiagnosisDTOListByPatientId.length;i++)
					{
						var inhouseDTO:PatientDiagnosisDTO = model.patientDiagnosisDTOListByPatientId.getItemAt(i) as PatientDiagnosisDTO;
						
						if(inhouseDTO.VisitDate == null)
						{
							inhouseDTO.VisitDate= Constants.NULL_DATE;
						}
						
						inhouseDTO.ModifiedBy = model.LoggedInUserId;
						inhouseDTO.ModifiedAt = new Date();
					}
					
					var newList:ArrayCollection = new ArrayCollection();
					var actionDate:String = UtilityFunctions.FormatDate( new Date(), "MM-DD-YYYY");
					
					for(i=0;i<model.patientDiagnosisDTOListByPatientId.length;i++)
					{
						var inhouseDTO:PatientDiagnosisDTO = model.patientDiagnosisDTOListByPatientId.getItemAt(i) as PatientDiagnosisDTO;
						
						if(inhouseDTO.IsDeleted == true || inhouseDTO.IsDirty == true)
						{
							newList.addItem(inhouseDTO);
						}
						
					}
					if(newList.length>0)
						delegate.ManagePatientDiagnosis(newList,model.LoggedInUserId, model.VisitID , model.patientID, actionDate, model.LoggedInUserSessionID);
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
					//UtilityFunctions.ShowMessage( "ManagePatientDiagnosis Saved.", "Info" )
					var lpihEvent: LoadPatientDiagnosisByVisitIdEvent = new LoadPatientDiagnosisByVisitIdEvent(); 
					CairngormEventDispatcher.getInstance().dispatchEvent( lpihEvent );
				}
					
				else
				{
					UtilityFunctions.ShowMessage("ManagePatientDiagnosis \n\t No data returned from service.\nMesage: \n\t" + re.result.@Message + "\nDetails: \n\t" + re.result.@Details ,"Info");
				}
				
			}
		}
		
		
		
		public function fault( rpcEvent : Object ) : void 
		{
			var errorStatus:String = "Fault occured in ManagePatientDiagnosis.";
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId); 
			
		}
		
	}
}