package com.gazuntite.common.delegate
{
	import com.gazuntite.common.util.QSCommonServiceMethods;
	import com.gazuntite.common.util.QSConstants;	
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadAllInsuranceDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function LoadAllInsuranceDelegate(responder:IResponder)
		{
			this.responder 		= responder;
			var url:String 		= QSConstants.BILLING_RESTFULL_SERVICE_BASE_URL + QSCommonServiceMethods.LOAD_ALL_INSURANCES;			
			service 			= new HTTPService(url);
			service.url 		= url;	
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		public function InsuranceList():void
		{
			
			service.showBusyCursor = true;
			service.url = service.url;
			service.resultFormat = "e4x";
			service.send();	
			
			trace( "LoadAllInsuranceDelegate", service.url );
		}
		
		private function onResult(event:ResultEvent):void
		{
			responder.result(event);
			//logger.debug( "LoadAllClaimbyProviderId -- > result for call:<br>" + service.url + "<br> " + event.result);
		}
		
		private function onFault(event:FaultEvent):void
		{
			responder.fault(event);			
		}
	}
}