package com.gazuntite.provider.live.services.scheduler.delegate
{
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerConstant;
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerServiceMethod;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class SearchPatientDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		
		public function SearchPatientDelegate( responder : IResponder )
		{
			this.responder 		= responder;
			var url:String 		= SchedulerConstant.RESTFULL_SERVICE_BASE_URL + SchedulerServiceMethod.SearchPatientbyClinicIdAndSearchString  ;
			service 			= new HTTPService(url);
			service.url 		= url;
			service.useProxy	= false;
		}
		public function SearchPatientbyClinicIdAndSearchString(clinicBranchId:int, providerId:int, userTypeId:int, searchString:String, demandPageNo:int):void
		{
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
			
			service.url = service.url +'/'+ clinicBranchId +'/'+ providerId +'/'+ userTypeId +'/'+ searchString +'/'+ demandPageNo ;
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