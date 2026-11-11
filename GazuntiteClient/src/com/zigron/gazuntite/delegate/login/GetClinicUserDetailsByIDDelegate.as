package com.zigron.gazuntite.delegate.login
{
	import com.gazuntite.provider.search.services.provider.util.PSConstants;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class GetClinicUserDetailsByIDDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function GetClinicUserDetailsByIDDelegate( responder : IResponder )
		{
			this.responder 		= responder;
			var url:String 		= PSConstants.RESTFULL_SERVICE_BASE_URL + 'LoadClinicUsersBasicInfo'; 
			service 			= new HTTPService(url);
			service.url 		= url;
		}
		
		public function GetProviderDetails(userID:int,clinicBranchId:int):void
		{
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
			service.showBusyCursor = true;
			service.url = service.url + "/" + userID +"/" + clinicBranchId;// + "/" + pageNo;
			service.resultFormat = "e4x";
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