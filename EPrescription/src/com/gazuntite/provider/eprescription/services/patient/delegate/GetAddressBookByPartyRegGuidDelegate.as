package com.gazuntite.provider.eprescription.services.patient.delegate
{
	import com.gazuntite.provider.eprescription.services.patient.util.EConstants;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class GetAddressBookByPartyRegGuidDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		
		public function GetAddressBookByPartyRegGuidDelegate( responder : IResponder )
		{
			this.responder 		= responder;
			
			var url:String 		= EConstants.RESTFULL_ADRESSBOOK_SERVICE_BASE_URL + "GetAddressBookByPartyRegGuid";
			service 			= new HTTPService(url);
			service.url 		= url;
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function GetAddress(rec:String="0"):void
		{
			service.url += "/" + rec;
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