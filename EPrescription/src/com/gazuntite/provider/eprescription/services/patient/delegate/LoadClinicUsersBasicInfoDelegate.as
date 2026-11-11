package com.gazuntite.provider.eprescription.services.patient.delegate
{
	import com.gazuntite.provider.eprescription.services.patient.util.EConstants;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class LoadClinicUsersBasicInfoDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function LoadClinicUsersBasicInfoDelegate( responder : IResponder )
		{
			this.responder 		= responder;
			
			var url:String 		= EConstants.RESTFULL_PROVIDER_SERVICE_BASE_URL  + 'LoadClinicUsersBasicInfo'; 
			service 			= new HTTPService(url);
			service.url 		= url;
		}
		
		public function loadClinicUsersBasicInfo(userID:int,clinicBranchId:int):void
		{
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
			service.showBusyCursor = true;
			service.url = service.url + "/" + userID +"/" + clinicBranchId;
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