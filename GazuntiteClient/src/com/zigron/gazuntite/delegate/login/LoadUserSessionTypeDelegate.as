package com.zigron.gazuntite.delegate.login
{
	import com.gazuntite.provider.search.services.provider.util.PSConstants;
	import com.zigron.gazuntite.utils.Constants;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadUserSessionTypeDelegate
	{
		
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function LoadUserSessionTypeDelegate(responder : IResponder)
		{
			this.responder 		= responder;
			var url:String 		= Constants.RESTFULL_SERVICE_BASE_URL  + 'LoaduserSessionTypes'; 
			service 			= new HTTPService(url);
			service.url 		= url;
		}
		
		public function LoadUserSessionTypes():void
		{
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
			service.resultFormat = "e4x";
			service.send();
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