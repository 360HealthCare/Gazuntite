package com.gazuntite.webRTC.delegate
{
	
	import com.gazuntite.webRTC.util.WebRTCConstants;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class GetIncomingVideoChatSessionDelegate
	{
		
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		
		public function GetIncomingVideoChatSessionDelegate( responder : IResponder )
		{
			this.responder 		= responder;
			var url:String 		= WebRTCConstants.RESTFULL_SERVICE_BASE_URL + 'GetVideoSession'; 
			service 			= new HTTPService(url);
			service.url 		= url;
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
			
		}
		
		public function GetVideoCallDetails(userID:int,clinicBranchId:int):void
		{
			
			service.url = service.url + "/" + userID +"/" + clinicBranchId;
			service.resultFormat = "e4x";
			service.requestTimeout = 3600; // wait for the responce for one hour.
			service.send();	
			//trace( service.url );
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