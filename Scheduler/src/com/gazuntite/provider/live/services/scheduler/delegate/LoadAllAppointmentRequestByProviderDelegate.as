package com.gazuntite.provider.live.services.scheduler.delegate
{
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerConstant;
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerServiceMethod;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadAllAppointmentRequestByProviderDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function LoadAllAppointmentRequestByProviderDelegate( responder : IResponder)
		{
			this.responder 		= responder;
			var url:String 		= SchedulerConstant.RESTFULL_SERVICE_BASE_URL + SchedulerServiceMethod.LoadAllAppointmentRequestByProvider  ;
			service 			= new HTTPService(url);
			service.url 		= url;
			service.concurrency = 'last';

		}
		public function LoadAllAppointmentRequestByProvider(providerId:int, clinicBranchId:int):void
		{
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
			
			service.url = service.url +'/'+ providerId +'/'+ clinicBranchId;
			service.resultFormat = "e4x";
			service.send();	
			
			trace( "LoadAllAppointmentRequestByProvider", service.url );
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