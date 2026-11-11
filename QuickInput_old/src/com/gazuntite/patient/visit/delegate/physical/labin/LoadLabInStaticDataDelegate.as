package com.gazuntite.patient.visit.delegate.physical.labin
{
	import com.gazuntite.patient.visit.utils.QIConstants;
	import com.gazuntite.patient.visit.utils.QIServiceMethods;
	
	import flash.events.Event;
	import flash.net.URLRequestMethod;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadLabInStaticDataDelegate
	{
		private var responder : IResponder;
		private var service : HTTPService;
		
		private var logger:ILogger = Log.getLogger("com.gazuntite.patient.visit.delegate.physical.labin.LoadLabInStaticDataDelegate");
		com.gazuntite.patient.visit.delegate.physical.labin.LoadLabInStaticDataDelegate
		public function LoadLabInStaticDataDelegate( responder : IResponder)
		{
			this.service =  new HTTPService();
			this.responder = responder;	
			
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL  + QIServiceMethods.LABIN_LOAD_SEARCH_BY_ID;
			service 			= new HTTPService(url);
			service.url 		= url;
			service.method		= URLRequestMethod.GET;
			service.resultFormat = "e4x";
			
			logger.debug( "service.url", url );
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		private function onResult(event:ResultEvent):void
		{
			responder.result(event);
		}
		
		private function onFault(event:FaultEvent):void
		{
			responder.fault(event);			
		}
		
		private function onOtherError(event:Event):void
		{
			trace(event);			
		}
		
		
		public function loadLabInStaticData(searchString:String , clinicBranchId:int , sessionID : String):void
		{
			
			service.url  = service.url + "/" + searchString + "/" + clinicBranchId + "/" + sessionID ;
			
			
			trace(service.url);
			service.send();
		}
	}
}