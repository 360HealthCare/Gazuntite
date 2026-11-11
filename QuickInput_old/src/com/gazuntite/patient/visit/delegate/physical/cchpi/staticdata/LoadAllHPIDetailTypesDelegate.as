package com.gazuntite.patient.visit.delegate.physical.cchpi.staticdata
{
	import com.gazuntite.patient.visit.utils.QIConstants;
	import com.gazuntite.patient.visit.utils.QIServiceMethods;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadAllHPIDetailTypesDelegate
	{
		private var responder : IResponder;
		private var service : HTTPService;
		
		private var logger:ILogger = Log.getLogger("com.gazuntite.patient.visit.delegate.physical.cchpi.staticdata.LoadAllHPIDetailTypesDelegate");
		
		
		public function LoadAllHPIDetailTypesDelegate(  responder : IResponder )
		{		
			this.service =  new HTTPService();
			this.responder = responder;	
			
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL  + QIServiceMethods.HPI_LOAD_DETAIL_TYPES;
			service 			= new HTTPService(url);
			service.url 		= url;
			service.resultFormat = "e4x";
			logger.debug( "service.url", url );
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function LoadAllHPIDetailTypes(sessionID:String) : void 
		{
			service.url  = service.url + "/" + sessionID;
			trace(service.url);
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