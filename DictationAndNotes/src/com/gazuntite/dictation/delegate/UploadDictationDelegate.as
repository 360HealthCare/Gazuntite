package com.gazuntite.dictation.delegate
{
	import com.gazuntite.dictation.utils.DictationConstants;
	import com.gazuntite.dictation.utils.DictationServiceMethods;
	
	import flash.events.Event;
	import flash.net.URLRequestMethod;
	import flash.utils.ByteArray;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class UploadDictationDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function UploadDictationDelegate( responder : IResponder )
		{
			this.responder 		= responder;
			var url:String 		= DictationConstants.RESTFULL_SERVICE_BASE_URL + DictationServiceMethods.UPLOAD_DICTATION;
			//var url:String 		= 'http://quivus.com/QuivusAirDev/UserSearchService/Service/RestfulService/UserManagerRestfulService.svc/SearchPatientbyClinicIdAndSearchStringFilters';
			service 			= new HTTPService(url);
			service.url 		= url;
			
			service.contentType = "application/octet-stream";
			service.method		= URLRequestMethod.POST;
			service.resultFormat = "e4x";
			
			service.addEventListener(FaultEvent.FAULT, onFault);
			service.addEventListener(ResultEvent.RESULT, onResult);
		}
		
		public function UploadDictation(soundBytes:ByteArray, dictationId:String, sessionID:String, recordTimeStamp:String, createdAt:String, createdBy:String):void
		{
			service.url = service.url + "/" + dictationId + "/" + recordTimeStamp + "/" + sessionID + "/" + createdAt + "/" + createdBy;
			
			service.showBusyCursor = true;
			
			service.send(soundBytes);	
			trace('UploadDictationDelegate', 'CALL SEND FOR RESULT' );
		}
		
		private function onResult(event:ResultEvent):void
		{
			responder.result(event);
			service.showBusyCursor = false;
		}
		
		private function onFault(event:FaultEvent):void
		{
			responder.fault(event);	
			service.showBusyCursor = false;
		}
	}
}