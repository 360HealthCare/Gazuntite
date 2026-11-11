package com.gazuntite.common.delegate.visit
{
	
	import com.gazuntite.common.util.QSConstants;
	
	import mx.formatters.DateFormatter;
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.logging.LogEvent;
	import mx.logging.LogEventLevel;
	import mx.logging.LogLogger;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class CreateVisitCommonDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function CreateVisitCommonDelegate( responder : IResponder )
		{
			this.responder 		= responder;
			var url:String 		= QSConstants.RESTFULL_SERVICE_BASE_URL + "CreateVisit/";
			service 			= new HTTPService(url);
			service.url 		= url;
			
			service.contentType = "Text/Xml";
			service.method		= "POST";
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
	
		public function CreateVisit(data:XML, userId:String, date:Date ):void
		{
			var df:DateFormatter = new DateFormatter();
			df.formatString = "MM-DD-YYYY";
			var d:String = df.format( date );
			
			service.url = service.url  + userId ;
			service.send(data);			
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