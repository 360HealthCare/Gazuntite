package com.gazuntite.webRTC.delegate
{
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class GetOutgoingVideoChatSessionDelegate
	{
		
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		private var logger:ILogger = Log.getLogger("com.adobe.Quivus.delegate.communication.GetOutgoingVideoChatSessionDelegate");//new LogLogger("com.zigron.provider.live.services.elab.delegate.LoadPatientLabsByClinicIdDelegate");
		
		public function GetOutgoingVideoChatSessionDelegate( responder : IResponder )
		{
			this.responder 		= responder;
			var url:String 		= "";//PSConstants.RESTFULL_SERVICE_BASE_URL + PSServiceMethods.SEARCH_PROVIDER_CLINIC_USERBASIC_END_POINT;   
			service 			= new HTTPService(url);
			service.url 		= url;
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
			
		}
		
		public function GetOutgoingVideoSession(userID:int,clinicBranchId:int):void
		{
			
			service.showBusyCursor = true;
			service.url = service.url + "/" + userID +"/" + clinicBranchId;// + "/" + pageNo;
			service.resultFormat = "e4x";
			service.send();	
			logger.debug( "SearchProvider -- > service.url:<br>" + service.url );
			trace( service.url );
		}
		
		private function onResult(event:ResultEvent):void
		{
			responder.result(event);
			logger.debug( "SearchProvider -- > result for call:<br>" + service.url + "<br> " + event.result);
		}
		
		private function onFault(event:FaultEvent):void
		{
			responder.fault(event);			
		}	
	}
}