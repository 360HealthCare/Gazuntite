package com.gazuntite.input.delegate.history.dictationNote
{
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.input.utils.QIServiceMethods;
	
	import flash.net.URLRequestMethod;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class LoadModuleDictationNoteByPatientIDDelegate
	{
		private var responder:IResponder;
		private var service:HTTPService;
		
		public function LoadModuleDictationNoteByPatientIDDelegate(responder:IResponder)
		{
			this.responder = responder;
			
			var url:String = QIConstants.RESTFULL_SERVICE_BASE_URL + QIServiceMethods.LOAD_MODULE_DICTATION_NOTE_BY_PATIENT_ID;
			
			service = new HTTPService(url);
			service.url = url;
			service.method = URLRequestMethod.GET;
			service.resultFormat = "e4x";
			
			service.addEventListener(ResultEvent.RESULT, onResult);
			service.addEventListener(FaultEvent.FAULT, onFault);
		}
		
		public function loadModuleDictationNoteByPatientID(patientID:int, loggedInUserSessionID:String):void
		{
			service.showBusyCursor = true;
			service.url = service.url + "/" + patientID + "/" + loggedInUserSessionID;
			service.method = URLRequestMethod.GET;
			
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