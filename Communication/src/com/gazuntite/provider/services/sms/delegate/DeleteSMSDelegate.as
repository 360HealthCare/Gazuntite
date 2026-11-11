package com.gazuntite.provider.services.sms.delegate
{
	import com.gazuntite.provider.services.sms.util.CommunicationConstant;
	import com.gazuntite.provider.services.sms.util.SMSServiceMethods;
	
	import flash.events.HTTPStatusEvent;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.logging.LogEvent;
	import mx.logging.LogEventLevel;
	import mx.logging.LogLogger;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class DeleteSMSDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		private var logger:ILogger = Log.getLogger("com.zigron.provider.services.email.delegate.DeleteSMSDelegate");
		
		
		public function DeleteSMSDelegate(responder:IResponder)
		{
			this.responder 		= responder;
			var url:String 		=  CommunicationConstant.RESTFULL_SERVICE_BASE_URL + SMSServiceMethods.DELETE_SENT_SMS_END_POINT;
			service 			= new HTTPService(url);
			service.url 		= url;
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function DeleteSMS(smsIds:String,userID:int):void
		{
			
			service.showBusyCursor = true;
			service.url = service.url + "/" + smsIds+"/"+ userID;
			service.resultFormat = "e4x";
			service.send();	
			logger.debug( "GetSentEmailList -- > service.url:<br>" + service.url );
			trace( service.url );
		}
		
		private function onResult(event:ResultEvent):void
		{
			responder.result(event);
			logger.debug( "Get All Emails of a User -- > result for call:<br>" + service.url + "<br> " + event.result);
		}
		
		private function onFault(event:FaultEvent):void
		{
			responder.fault(event);			
		}
	}
}