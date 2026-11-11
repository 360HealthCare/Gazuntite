package com.gazuntite.common.delegate
{
	import com.gazuntite.common.dto.ErrorReportDTO;
	import com.gazuntite.common.util.QSCommonServiceMethods;
	import com.gazuntite.common.util.QSConstants;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class SendErrorReportDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		private var logger:ILogger = Log.getLogger("com.gazuntite.common.delegate.SendErrorReportDelegate");
		
		
		public function SendErrorReportDelegate(responder:IResponder)
		{
			this.responder 		= responder;
			var url:String 		= QSConstants.RESTFULL_SERVICE_BASE_URL + QSCommonServiceMethods.GET_ERROR_REPORT_MAIL_POINT;
			service 			= new HTTPService(url);
			service.url 		= url;
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
	
		public function SendErrorReport(objErrorDTO:ErrorReportDTO):void
		{
			
			service.showBusyCursor = true;
			service.resultFormat = "e4x";
			service.method = "POST";
			service.url = service.url+'/';
			service.contentType ="application/xml";
			service.send(objErrorDTO.ToXML());
			logger.debug( "Send Exception Email -- > service.url:<br>" + service.url );
			trace(service.url );
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