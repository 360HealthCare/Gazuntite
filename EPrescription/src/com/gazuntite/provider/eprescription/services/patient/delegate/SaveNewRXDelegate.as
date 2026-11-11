package com.gazuntite.provider.eprescription.services.patient.delegate
{
	import com.gazuntite.provider.eprescription.services.patient.dto.ResponseDTO;
	import com.gazuntite.provider.eprescription.services.patient.util.EConstants;
	import com.gazuntite.provider.eprescription.services.patient.util.PSServiceMethods;
	
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
	
	public class SaveNewRXDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function SaveNewRXDelegate( responder : IResponder, ShowSummary:Boolean)
		{
			this.responder 		= responder;
			
			if(ShowSummary)
				var url:String 		= EConstants.RESTFULL_SERVICE_BASE_URL + "GetNewRxReport"; //SaveNewRX
			else
				var url:String 		= EConstants.RESTFULL_SERVICE_BASE_URL + "SaveNewRX"; //SaveNewRX
			
			service 			= new HTTPService(url);
			service.url 		= url;
			
			service.contentType = "Text/Xml";
			service.method		= "POST";
			
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function SaveNewRX(data:XML, date:Date):void
		{			
			var df:DateFormatter = new DateFormatter();
			df.formatString = "MM-DD-YYYY";
			var d:String = df.format( date );
			
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