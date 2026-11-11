package com.gazuntite.common.delegate
{
	import com.gazuntite.common.util.QSCommonServiceMethods;
	import com.gazuntite.common.util.QSConstants;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadPlaceOfServiceTypesDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		public function LoadPlaceOfServiceTypesDelegate(responder:IResponder)
		{
			this.responder 		= responder;
			var url:String 		= QSConstants.BILLING_RESTFULL_SERVICE_BASE_URL + QSCommonServiceMethods.LOAD_PLACE_OF_SERVICE_CODE_TYPES;			
			service 			= new HTTPService(url);
			service.url 		= url;	
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function PlaceOfServiceTypeList(typeName:String ):void
		{			
			service.showBusyCursor = true;
			service.url = service.url + "/" + typeName;
			service.resultFormat = "e4x";
			service.send();	
			
			trace( "LoadPlaceOfServiceTypesDelegate", service.url );
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