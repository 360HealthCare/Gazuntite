package com.gazuntite.webRTC.delegate
{
	
	import com.gazuntite.webRTC.util.WebRTCConstants;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class VideoCallAcceptDelegate
	{
		
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		private var logger:ILogger = Log.getLogger("com.adobe.Quivus.delegate.communication.videochat.VideoCallAcceptDelegate");//new LogLogger("com.zigron.provider.live.services.elab.delegate.LoadPatientLabsByClinicIdDelegate");
		
		public function VideoCallAcceptDelegate( responder : IResponder )
		{
			this.responder 		= responder;
			var url:String 		= WebRTCConstants.RESTFULL_SERVICE_BASE_URL + 'AcceptIncomingCallNotification'; //PSConstants.RESTFULL_SERVICE_BASE_URL + PSServiceMethods.SEARCH_PROVIDER_CLINIC_USERBASIC_END_POINT;   
			service 			= new HTTPService(url);
			service.url 		= url;
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function AcceptVideoCallDetails(videoChatID:int):void
		{
			
			//service.showBusyCursor = true;
			service.url = service.url + "/"+videoChatID;// + "/" + pageNo;
			service.resultFormat = "e4x";
			service.send();	
			logger.debug( "AcceptVideoCall -- > service.url:<br>" + service.url );
			//trace( service.url );
		}
		
		private function onResult(event:ResultEvent):void
		{
			responder.result(event);
			logger.debug( "AcceptVideoCall -- > result for call:<br>" + service.url + "<br> " + event.result);
		}
		
		private function onFault(event:FaultEvent):void
		{
			responder.fault(event);			
		}	
	}
}