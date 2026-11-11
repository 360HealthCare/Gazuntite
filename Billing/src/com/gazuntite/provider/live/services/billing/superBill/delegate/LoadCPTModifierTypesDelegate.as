package com.gazuntite.provider.live.services.billing.superBill.delegate
{
	import com.gazuntite.provider.live.services.billing.superBill.util.SuperBillConstants;
	import com.gazuntite.provider.live.services.billing.superBill.util.SuperBillServiceMethods;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadCPTModifierTypesDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function LoadCPTModifierTypesDelegate(responder:IResponder)
		{
			this.responder 		= responder;
			var url:String 		= SuperBillConstants.RESTFULL_SERVICE_BASE_URL + SuperBillServiceMethods.LOAD_CPT_MODIFIER_TYPES;			
			service 			= new HTTPService(url);
			service.url 		= url;	
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		public function CPTModifierTypeList(modifierCocde:String ):void
		{
			
			service.showBusyCursor = true;
			service.url = service.url + "/" + modifierCocde;
			service.resultFormat = "e4x";
			service.send();	
			
			trace( "LoadCPTModifierTypesDelegate", service.url );
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