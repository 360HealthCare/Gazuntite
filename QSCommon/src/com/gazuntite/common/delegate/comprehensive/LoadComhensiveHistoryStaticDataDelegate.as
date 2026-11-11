package com.gazuntite.common.delegate.comprehensive
{
	import com.gazuntite.common.util.QSCommonServiceMethods;
	import com.gazuntite.common.util.QSConstants;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadComhensiveHistoryStaticDataDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		
		public function LoadComhensiveHistoryStaticDataDelegate(responder:IResponder)
		{
			this.responder 		= responder;
			var url:String 		= QSConstants.RESTFULL_SERVICE_BASE_URL + QSCommonServiceMethods.COMPREHENSIVE_LOAD_HISTORY_STATIC_DATA;			
			service 			= new HTTPService(url);
			service.url 		= url;	
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function LoadComhensiveHistoryStaticData(sessionID:String):void
		{
			service.showBusyCursor = true;
			service.url = service.url + "/" + sessionID;
			service.resultFormat = "e4x";
			service.send();	
			
			trace( "LoadComhensiveHistoryStaticDataDelegate", service.url );
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