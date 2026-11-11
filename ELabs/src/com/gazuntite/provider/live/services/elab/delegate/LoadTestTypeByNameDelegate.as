package com.gazuntite.provider.live.services.elab.delegate
{
	import com.gazuntite.provider.live.services.elab.util.ELabsConstant;
	import com.gazuntite.provider.live.services.elab.util.ELabsServiceMethods;
	
	import mx.events.Request;
	import mx.formatters.DateFormatter;
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.managers.CursorManager;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadTestTypeByNameDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		private var logger:ILogger = Log.getLogger("com.gazuntite.provider.live.services.elab.delegate.LoadTestTypeByNameDelegate");
		
		public function LoadTestTypeByNameDelegate(responder : IResponder )
		{
			this.responder 		= responder;
			var url:String 		= ELabsConstant.RESTFULL_SERVICE_BASE_URL + ELabsServiceMethods.LOAD_TEST_TYPE_BY_NAME;
			service 			= new HTTPService(url);
			service.url 		= url;
			service.resultFormat = "e4x";
			
			logger.debug( "service.url", url );
			
			service.addEventListener(ResultEvent.RESULT,onResult);
			service.addEventListener(FaultEvent.FAULT,onFault);
		}
		
		public function LoadTestTypeByName(searchText:String):void
		{
			service.url += "/" + searchText;
			
			logger.debug( "service.url", service.url );
			
			CursorManager.setBusyCursor();
			service.send();
		}
		
		private function onResult(event:ResultEvent):void
		{
			CursorManager.removeBusyCursor();
			
			responder.result(event);
		}
		
		private function onFault(event:FaultEvent):void
		{
			CursorManager.removeBusyCursor();
			
			responder.fault(event);			
		}
	}
}