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

	public class LoadPatientCompleteInfoDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		
		public function LoadPatientCompleteInfoDelegate( responder : IResponder )
		{
			this.responder 		= responder;
			var url:String 		= SchedulerConstant.RESTFULL_SERVICE_BASE_URL + SchedulerServiceMethod.LoadPatientCompleteInfo  ;
			service 			= new HTTPService(url);
			service.url 		= url;
		}
		public function LoadPatientCompleteInfo(patientId:int, clinicBranchId:int, providerUserId:int, stationId:int):void
		{
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
			
			service.url = service.url +'/'+ patientId +'/'+ clinicBranchId +'/'+ providerUserId +'/'+ stationId ;
			service.resultFormat = "e4x";
			service.send();	
			
			trace( "LoadPatientCompleteInfoDelegate", service.url );
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