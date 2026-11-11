package com.gazuntite.input.delegate.history.assessment.diagnosis
{
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.input.utils.QIServiceMethods;
	
	import flash.net.URLRequestMethod;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadResolvedDiagnosisByPatientIdPagedDelegate
	{
		private var responder:IResponder;
		private var service:HTTPService;
		
		public function LoadResolvedDiagnosisByPatientIdPagedDelegate(responder:IResponder)
		{
			this.responder = responder;
			
			var url:String = QIConstants.RESTFULL_SERVICE_BASE_URL + QIServiceMethods.LOAD_RESOLVED_DIAGNOSIS_BY_PATIENT_ID_PAGED;
			
			service = new HTTPService(url);
			service.contentType = "application/xml";
			service.url = url;
			
			service.addEventListener(ResultEvent.RESULT, onResult);
			service.addEventListener(FaultEvent.FAULT, onFault);
		}
		
		public function loadResolvedDiagnosisByPatientIdPaged(xml2Send:XML, patientID:int, loggedInUserSessionID:String):void
		{
			service.showBusyCursor = true;
			service.url = service.url + "/" + patientID + "/" + loggedInUserSessionID;
			service.resultFormat = "e4x";
			service.method = URLRequestMethod.POST;
			
			service.send(xml2Send);
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