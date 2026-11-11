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

	public class LoadAllAppointmentRequestStatusTypesDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
			
		public function LoadAllAppointmentRequestStatusTypesDelegate(responder : IResponder)
		{
			this.responder 		= responder;
			var url:String 		= SchedulerConstant.RESTFULL_SERVICE_BASE_URL + SchedulerServiceMethod.LoadAllAppointmentRequestStatusTypes ;
			service 			= new HTTPService(url);
			service.url 		= url;
		}
		
		public function LoadAllAppointmentRequestStatusTypes():void
		{
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
			
			service.url = service.url ;
			service.resultFormat = "e4x";
			service.send();	
			
			//trace( "LoadAllAppointmentRequestStatusTypesDelegate --> LoadAllAppointmentRequestStatusTypes() service call sent" );
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