package com.gazuntite.patient.visit.command.assessment.diagnosis
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.util.exceptionAlert.QSCombinedExceptionAlert;
	import com.gazuntite.controls.custom.calendar.views.ChooseDay;
	import com.gazuntite.patient.visit.delegate.assessment.diagnosis.LoadPatientChronicDiagnosisByPatientIdDelegate;
	import com.gazuntite.patient.visit.dto.PatientDiagnosisDTO;
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class LoadPatientChronicDiagnosisByPatientIdCommand implements Command, IResponder
	{
		private var model:QIModelLocator = QIModelLocator.getInstance();
		
		public function LoadPatientChronicDiagnosisByPatientIdCommand()
		{
		}
		
		public function execute(cgEvent:CairngormEvent) : void 
		{
			if(model.LoggedInUserId)
			{
				var delegate:LoadPatientChronicDiagnosisByPatientIdDelegate = new  LoadPatientChronicDiagnosisByPatientIdDelegate(this);
				
				delegate.loadPatientChronicDiagnosis(model.patientID, model.ClinicBranchIdSeq);
			}
			
		}
		
		public function result( rpcEvent : Object ) : void 
		{
			if(model.LoggedInUserId)
			{
				var re:ResultEvent = rpcEvent as ResultEvent;
				
				var xml:XMLList = XMLList(re.result);
				
				if(xml!=null)
				{
					var xlist:XMLList = xml.children();
					if( xlist != null )
					{	
						var dtoList:ArrayCollection = new ArrayCollection();
						
						for each(var x:XML in xlist)
						{
							var t:PatientDiagnosisDTO = new PatientDiagnosisDTO();
							t.FromXML(x);
							dtoList.addItem(t);
						}
						
						model.patientDiagnosisDTOAllChronicListByPatientId = dtoList ;
					}
				}
				else
				{
					UtilityFunctions.ShowMessage("LoadPatientChronicDiagnosisCommand \n Service didnot respond.", "Info");
				}
			}
		}
		
		public function fault( rpcEvent : Object ) : void 
		{	
			var errorStatus:String = "Fault occured in LoadPatientChronicDiagnosisCommand.";
			
			var userId:int = UtilityFunctions.IsNullOrEmpty( model.LoggedInUserId )? -1:model.LoggedInUserId;
			QSCombinedExceptionAlert.getInstance().Show( errorStatus, rpcEvent.toString(), userId);
		}
	}
}