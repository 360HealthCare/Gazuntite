package com.gazuntite.common.delegate.rapidAccess
{
	import com.gazuntite.common.util.QSConstants;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadAllQuickLinksDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function LoadAllQuickLinksDelegate(responder:IResponder)
		{
			this.responder 		= responder;
			
			var url:String 		= QSConstants.USER_MANAGER_RESTFULL_SERVICE_BASE_URL + 'LoadAllQuickLinks'; 
			service 			= new HTTPService(url);
			service.url 		= url;
		}
		public function LoadAllQuickLinks():void
		{
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
			service.showBusyCursor = true;
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