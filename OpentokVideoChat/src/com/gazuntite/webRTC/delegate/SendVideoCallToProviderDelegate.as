package com.gazuntite.webRTC.delegate
{
	import com.gazuntite.webRTC.model.vo.VideoChatDTO;
	import com.gazuntite.webRTC.util.WebRTCConstants;
	
	import flash.net.URLRequestDefaults;
	import flash.net.URLRequestMethod;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.messaging.messages.HTTPRequestMessage;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class SendVideoCallToProviderDelegate
	{
		
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		private var logger:ILogger = Log.getLogger("com.gazuntite.webRTC.delegate.SendVideoCallToProviderDelegate");
		
		public function SendVideoCallToProviderDelegate( responder : IResponder )
		{
			this.responder 		= responder;
			var url:String 		= WebRTCConstants.RESTFULL_SERVICE_BASE_URL + 'SaveVideoSessionForProvider';    
			service 			= new HTTPService(url);
			service.url 		= url;
			
			service.contentType =  "application/xml";
			service.method		= URLRequestMethod.POST;
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function SendVideoCallDetails(videoChat:VideoChatDTO):void
		{
			URLRequestDefaults.idleTimeout = 70000; 
			
			service.showBusyCursor = true;
			service.url = service.url ;
			service.resultFormat = "e4x";
			
			var xml:String =  videoChat.ToXML().toXMLString();
		//	service.requestTimeout = 3600; // 70 sec delay in response/timeout

			service.send(xml);	
			logger.debug( "SendVideoCallToProviderDelegate -- > service.url:<br>" + service.url );
		}
		
		private function onResult(event:ResultEvent):void
		{
			responder.result(event);
			logger.debug( "SendVideoCallToProviderDelegate -- > result for call:<br>" + service.url + "<br> " + event.result);
			service.showBusyCursor = false;
		}
		
		private function onFault(event:FaultEvent):void
		{
			responder.fault(event);			
		}	
	}
}