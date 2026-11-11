package com.gazuntite.provider.services.sms.delegate
{
	import com.gazuntite.provider.services.sms.dto.SMSDTO;
	import com.gazuntite.provider.services.sms.dto.SMSRecieverListDTO;
	import com.gazuntite.provider.services.sms.util.CommunicationConstant;
	import com.gazuntite.provider.services.sms.util.SMSServiceMethods;
	
	import flash.events.AsyncErrorEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestHeader;
	import flash.net.URLRequestMethod;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.logging.LogEvent;
	import mx.logging.LogEventLevel;
	import mx.logging.LogLogger;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class SendSMSDelegate
	{
		
		
		private var responder	:IResponder;
		private var service		:HTTPService;
		private var logger:ILogger = Log.getLogger("com.zigron.provider.services.email.delegate.SendSMSDelegate");
		
		private var servicePath:String;
		
		public function SendSMSDelegate(responder : IResponder)
			{
				this.responder 		= responder;
				//servicePath = EmailConstant.RESTFULL_SERVICE_BASE_URL + EmailServiceMethods.GET_SEND_END_POINT;
				var url:String 		= CommunicationConstant.RESTFULL_SERVICE_BASE_URL + SMSServiceMethods.GET_SMS_END_POINT;
				service 			= new HTTPService(url);
				service.url 		= url;
				service.addEventListener(FaultEvent.FAULT,onFault);
				service.addEventListener(ResultEvent.RESULT,onResult);
			}
		
		public function SendSMS(objSMSDTO : SMSDTO):void
		{
			
			
			service.showBusyCursor = true;
			
			service.resultFormat = "e4x";
			service.method = "POST";//URLRequestMethod.POST;
			
			
			service.url = service.url+'/';
			service.contentType ="application/xml";
			
			
			service.send(objSMSDTO.ToXML());
			
			logger.debug( "Send Email -- > service.url:<br>" + service.url );
			trace(service.url );
		}
		
		private function onResult(event:ResultEvent):void
		{
			responder.result(event);
			logger.debug( "Send Email -- > result for call:<br>" + service.url + "<br> " + event.result);
		}
		
		private function onFault(event:FaultEvent):void
		{
			trace(event.message.toString());
			responder.fault(event);			
		}
		
		private function onUploadingSuccess(event:Event):void
		{
			responder.result(event);
		}
		private function onUploadingError(event:IOErrorEvent):void
		{
			responder.fault(event);
		}
	}
}