package com.gazuntite.provider.live.services.elab.delegate
{
	import com.gazuntite.provider.live.services.elab.dto.ELabDTO;
	import com.gazuntite.provider.live.services.elab.util.ELabsConstant;
	import com.gazuntite.provider.live.services.elab.util.ELabsServiceMethods;
	
	import flash.net.URLRequestMethod;
	
	import mx.events.Request;
	import mx.formatters.DateFormatter;
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class ViewResultDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		private var logger:ILogger = Log.getLogger("com.gazuntite.provider.live.services.elab.delegate.ViewResultDelegate");
		
		public function ViewResultDelegate(responder : IResponder )
		{
			this.responder 		= responder;
			var url:String 		= ELabsConstant.RESTFULL_SERVICE_BASE_URL + ELabsServiceMethods.LOAD_RESULT;
			service 			= new HTTPService(url);
			service.contentType = "Text/Xml";
			service.resultFormat = "e4x";
			service.method		= URLRequestMethod.GET;
			service.url 		= url;
			
			
			logger.debug( "service.url", url );
			
			service.addEventListener(ResultEvent.RESULT,onResult);
			service.addEventListener(FaultEvent.FAULT,onFault);
		}
		
		public function LoadResult( OrderID:String ):void
		{
			//LoadResult/OID
			service.url = service.url + "/" + OrderID;
			service.send();
			
			if( Log.isDebug() )
			{
				logger.debug( "service.url", service.url );
				logger.debug( "ViewResultDelegate", " OrderID: " + OrderID  );
			}
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