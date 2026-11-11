/*
*Class: SendMailDelegate
*Created by: zahid mehmood
*Description: 
*Copyright 2011 Zigron Inc. All right reserved
*/
package com.gazuntite.provider.services.email.delegate
{
	import com.gazuntite.provider.services.email.dto.EmailDTO;
	import com.gazuntite.provider.services.email.util.EmailConstant;
	import com.gazuntite.provider.services.email.util.EmailServiceMethods;
	
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

	public class SendMailDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		private var logger:ILogger = Log.getLogger("com.zigron.provider.services.email.delegate.SendEmailDelegate");
		
		private var servicePath:String;
		
		
		/*
		public function init():void{		
		service = new HTTPService();
		service.addEventListener(ResultEvent.RESULT, restResult);
		service.addEventListener(FaultEvent.FAULT, restFault);
		service.resultFormat = "e4x";
		service.method = "POST";		
		callRestService("address_books.xml", ALL_DATA);
		}
		
		private function callRestService(_request:String, _service:String, _data:XML = null):void{
		serviceState = _service;
		service.url = SERVER_URL + _request;		
		if(isNewPerson){			
		service.contentType = "application/xml";		
		}		
		service.send(_data);		
		}
		*/
		
		public function SendMailDelegate(responder : IResponder)
		{
			this.responder 		= responder;
			servicePath = EmailConstant.RESTFULL_SERVICE_BASE_URL + EmailServiceMethods.GET_SEND_END_POINT;
			var url:String 		= EmailConstant.RESTFULL_SERVICE_BASE_URL + EmailServiceMethods.GET_SEND_END_POINT;
			service 			= new HTTPService(url);
			service.url 		= url;
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function SendEmail(objEmailDTO : EmailDTO):void
		{
			
			
			service.showBusyCursor = true;
			////service.url = service.url;// + "/"+objEmailDTO ;
			service.resultFormat = "e4x";
			service.method = "POST";//URLRequestMethod.POST;
			
		//	var val:String = objEmailDTO.ToXML().toXMLString();
			service.url = service.url+'/';
			service.contentType ="application/xml";
			
			//var param:Object = {emailDTO: val}
			service.send(objEmailDTO.ToXML());
		//	service.send(param);	
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
			//trace(flash.events.HTTPStatusEvent.HTTP_RESPONSE_STATUS);
			
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