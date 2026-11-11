package com.gazuntite.provider.live.services.scheduler.delegate
{
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerConstant;
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerServiceMethod;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadAllProviderByClinicBranchIdDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function LoadAllProviderByClinicBranchIdDelegate( responder : IResponder )
		{
			this.responder 		= responder;
			var url:String 		= SchedulerConstant.RESTFULL_SERVICE_BASE_URL + SchedulerServiceMethod.LoadAllProviderByClinicBranchId ;
			service 			= new HTTPService(url);
			service.url 		= url;
		}
		
		public function LoadAllProviderByClinicBranchId(clinicBranchID:int, stationId:int, isLoadAll:Boolean):void
		{
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
			
			service.url = service.url +'/'+ clinicBranchID + '/' + stationId +'/'+isLoadAll;
			service.resultFormat = "e4x";
			service.send();	
			
			trace( "LoadAllProviderByClinicBranchIdDelegate ", service.url );
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