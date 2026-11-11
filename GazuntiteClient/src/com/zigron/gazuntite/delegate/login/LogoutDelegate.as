package com.zigron.gazuntite.delegate.login
{
	import com.zigron.gazuntite.utils.Constants;
	import com.gazuntite.provider.search.services.provider.util.PSConstants;
	import com.zigron.gazuntite.utils.CommonServiceMethods;
	
	import flash.net.URLRequestMethod;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LogoutDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function LogoutDelegate(responder:IResponder)
		{
			this.responder 		= responder;
			
//			var url:String 		= PSConstants.RESTFULL_SERVICE_BASE_URL + 'SignOutUserSession'; 
			var url:String 		= Constants.RESTFUL_SERVICE_BASE_URL + 'SignOutUserSession'; 
			service 			= new HTTPService(url);
			service.url 		= url;
		}
		
		public function sendLogoutRequest(sessionID:String):void
		{
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
			service.showBusyCursor = true;
			service.url = service.url + "/" + sessionID ;
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