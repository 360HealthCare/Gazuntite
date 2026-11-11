package com.zigron.gazuntite.delegate.rapidAccess
{
	import com.zigron.gazuntite.utils.Constants;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadUserDefaultQuickLinksbyLocationDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function LoadUserDefaultQuickLinksbyLocationDelegate(responder:IResponder)
		{
			this.responder 		= responder;
			
			var url:String 		= Constants.RESTFULL_PROVIDER_SERVICE_BASE_URL + 'LoadUserDefaultQuickLinksbyLocation'; 
			service 			= new HTTPService(url);
			service.url 		= url;
		}
		
		public function LoadUserDefaultQuickLinksbyLocation(userId:int, clinicBranchId:int, sessionID:String):void
		{
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
			service.showBusyCursor = true;
			service.url = service.url + "/" + userId + "/" + clinicBranchId + "/" + sessionID;
			service.resultFormat = "e4x";
			service.send();	
		}
		
		private function onResult(event:ResultEvent):void
		{
			service.showBusyCursor = false;
			responder.result(event);
		}
		
		private function onFault(event:FaultEvent):void
		{
			service.showBusyCursor = false;
			responder.fault(event);			
		}	
	}
}