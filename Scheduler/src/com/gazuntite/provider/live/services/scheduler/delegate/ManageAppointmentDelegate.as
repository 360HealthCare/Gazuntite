package com.gazuntite.provider.live.services.scheduler.delegate
{
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerConstant;
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerServiceMethod;
	
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
	import mx.messaging.messages.HTTPRequestMessage;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class ManageAppointmentDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		private var uploadPath:String;
		
		public function ManageAppointmentDelegate( responder : IResponder )
		{
			this.responder 		= responder;
			uploadPath 			= SchedulerConstant.RESTFULL_SERVICE_BASE_URL + SchedulerServiceMethod.ManageAppointment;
		}
		
		public function ManageAppointment(appointmentXml:XML, providerId:int, userTypeId:int):void
		{
			uploadPath = uploadPath +'/'+providerId +'/'+userTypeId;
			
			var urlRequest:URLRequest = new URLRequest();
			urlRequest.url = uploadPath;
			urlRequest.contentType = "Text/Xml"; 
			urlRequest.method = URLRequestMethod.POST;
			urlRequest.data = appointmentXml;
			urlRequest.requestHeaders.push( new URLRequestHeader( 'Cache-Control', 'no-cache' ) );
			
			var urlLoader:URLLoader = new URLLoader();
			
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, onUploadingError);
			urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onUploadingError);
			urlLoader.addEventListener(AsyncErrorEvent.ASYNC_ERROR, onUploadingError);
			urlLoader.addEventListener(Event.COMPLETE, onUploadingSuccess);
			
			urlLoader.load(urlRequest);
			
			trace( "ManageAppointmentDelegate", urlRequest.url );
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