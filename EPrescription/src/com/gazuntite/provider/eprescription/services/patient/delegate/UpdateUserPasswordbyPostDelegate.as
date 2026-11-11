package com.gazuntite.provider.eprescription.services.patient.delegate
{
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.logging.LogEvent;
	import mx.logging.LogEventLevel;
	import mx.logging.LogLogger;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	import com.gazuntite.provider.eprescription.services.patient.util.EConstants;
	
	public class UpdateUserPasswordbyPostDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function UpdateUserPasswordbyPostDelegate( responder : IResponder )
		{
			this.responder 		= responder;
			var url:String 		= EConstants.RESTFULL_USER_SERVICE_BASE_URL + 'UpdateUserPasswordbyPost';
			service 			= new HTTPService(url);
			service.url 		= url;
			
			service.contentType = "Text/Xml";
			service.method		= "POST";
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function ChangePassword(data:XML):void
		{
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