package com.gazuntite.provider.live.services.scheduler.delegate
{
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerConstant;
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerServiceMethod;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class ManageAppointmentRequestDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function ManageAppointmentRequestDelegate( responder : IResponder)
		{
			this.responder 		= responder;
			var url:String 		= SchedulerConstant.RESTFULL_SERVICE_BASE_URL + SchedulerServiceMethod.ManageAppointmentRequest  ;
			service 			= new HTTPService(url);
			service.url 		= url;
		}
		
		public function ManageAppointmentRequest(requestId:String, statusId:int, modifiedBy:int, modifiedAt:String, reqStatus:String, clinicBranchId:int , rejectionReason:String):void
		{
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
			
			service.url = service.url +'/'+ requestId +'/'+ statusId +'/'+modifiedBy +'/'+modifiedAt+'/'+reqStatus+'/'+clinicBranchId +'/'+rejectionReason;
			service.resultFormat = "e4x";
			service.send();	
			
			trace( "ManageAppointmentRequest", service.url );
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