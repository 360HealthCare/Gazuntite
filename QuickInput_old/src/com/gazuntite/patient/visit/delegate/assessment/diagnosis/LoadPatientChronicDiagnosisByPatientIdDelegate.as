package com.gazuntite.patient.visit.delegate.assessment.diagnosis
{
	import com.gazuntite.patient.visit.utils.QIConstants;
	import com.gazuntite.patient.visit.utils.QIServiceMethods;
	
	import flash.net.URLRequestMethod;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadPatientChronicDiagnosisByPatientIdDelegate
	{
		private var responder:IResponder;
		private var service:HTTPService;
		
		public function LoadPatientChronicDiagnosisByPatientIdDelegate(responder:IResponder)
		{
			this.service = new HTTPService();
			this.responder = responder;	
			
			var url:String = "http://www.quivus.com/QuivusAirDev/QVisitService/RestService/VisitRestService.svc/" + QIServiceMethods.LOAD_PATIENT_CHRONIC_DIAGNOSIS_BY_PATIENT_ID;
			service = new HTTPService(url);
			service.url = url;
			service.method = URLRequestMethod.GET;
			service.resultFormat = "e4x";
			
			service.addEventListener(FaultEvent.FAULT, onFault);
			service.addEventListener(ResultEvent.RESULT, onResult);
		}
		
		public function loadPatientChronicDiagnosis(patientID:int , clinicBranchID:int):void
		{
			service.url  = service.url + "/" + patientID + "/" + clinicBranchID;
			service.send();
		}
		
		private function onResult(event:ResultEvent):void
		{
			responder.result(event);
		}
		
		private function onFault(event:FaultEvent):void
		{
			responder.fault(event);			
		}
	}
}