package com.gazuntite.input.delegate.visit.assessment.plan.followup
{
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.input.utils.QIServiceMethods;
	
	import flash.net.URLRequestMethod;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadFollowUpPatientLabTestTypesByPatientIdDelegate
	{
		private var responder:IResponder;
		private var service:HTTPService;
		
		public function LoadFollowUpPatientLabTestTypesByPatientIdDelegate(responder:IResponder)
		{
			this.service = new HTTPService();
			this.responder = responder;
			
			var url:String = QIConstants.RESTFULL_SERVICE_BASE_URL + QIServiceMethods.LOAD_PATIENT_LAB_TESTS_FOR_FOLLOW_UP_BY_PATIENT;
			
			service.url = url;
			service.method = URLRequestMethod.GET;
			service.resultFormat = "e4x";
			
			service.addEventListener(FaultEvent.FAULT, onFault);
			service.addEventListener(ResultEvent.RESULT, onResult);
		}
		
		public function LoadPatientLabTestsForFollowupByPatient(patientID:int, sessionID:String):void
		{
			service.showBusyCursor = true;
			
			service.url += "/" + patientID + "/" + sessionID;
			
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