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

	public class ProcessLabOrderDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		private var logger:ILogger = Log.getLogger("com.gazuntite.provider.live.services.elab.delegate.LoadeLabsStaticDataDelegate");
		
		public function ProcessLabOrderDelegate( responder : IResponder )
		{
			this.responder 		= responder;
			var url:String 		= ELabsConstant.RESTFULL_SERVICE_BASE_URL + ELabsServiceMethods.PROCESS_LAB_ORDER;
			service 			= new HTTPService(url);
			service.url 		= url;
			service.contentType = "Text/Xml";
			service.method		= "POST";
			
			logger.debug( "service.url", url );

			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		public function ProcessLabOrder(data:XML, date:Date):void
		{
			
			var df:DateFormatter = new DateFormatter();
			df.formatString = "MM-DD-YYYY";
			var d:String = df.format( date );
			service.url += "/" + d;
			
			logger.debug( "service.url", service.url );
			
			CursorManager.setBusyCursor();
			
			service.send(data);
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