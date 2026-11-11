package com.gazuntite.provider.search.services.provider.delegate
{
	import com.gazuntite.provider.search.services.provider.util.PSConstants;
	import com.gazuntite.provider.search.services.provider.util.PSServiceMethods;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.logging.LogEvent;
	import mx.logging.LogEventLevel;
	import mx.logging.LogLogger;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class SearchProviderDelegate
	{
		
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		private var logger:ILogger = Log.getLogger("com.zigron.provider.search.services.patient.delegate.SearchProviderDelegate");//new LogLogger("com.zigron.provider.live.services.elab.delegate.LoadPatientLabsByClinicIdDelegate");
		
		public function SearchProviderDelegate( responder : IResponder )
		{
			this.responder 		= responder;
			var url:String 		= PSConstants.RESTFULL_SERVICE_BASE_URL + PSServiceMethods.SEARCH_PROVIDER_END_POINT;
			service 			= new HTTPService(url);
			service.url 		= url;
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
			
		}
		
		public function SearchProviderList(clinicBranchId:int):void
		{
			
			service.showBusyCursor = true;
			service.url = service.url + "/" + clinicBranchId;//"/" + clinicBranchID + "/" + pageNo;
			service.resultFormat = "e4x";
			service.send();	
			logger.debug( "SearchProvider -- > service.url:<br>" + service.url );
			trace( service.url );
		}
		
		private function onResult(event:ResultEvent):void
		{
			responder.result(event);
			logger.debug( "SearchProvider -- > result for call:<br>" + service.url + "<br> " + event.result);
		}
		
		private function onFault(event:FaultEvent):void
		{
			responder.fault(event);			
		}
	}
}