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

	public class SearchAppointmentsDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		
		public function SearchAppointmentsDelegate( responder : IResponder )
		{
			this.responder 		= responder;
			var url:String 		= SchedulerConstant.RESTFULL_SERVICE_BASE_URL + SchedulerServiceMethod.SearchAppointments  ;
			service 			= new HTTPService(url);
			service.url 		= url;
		}

		public function SearchAppointments(providerUserId:int, providerId:int, stationId:int, fieldTypeId:int, searchText:String, pageNo:int):void
		{
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
			
			service.url = service.url +'/'+ providerUserId +'/'+ providerId +'/'+ stationId +'/'+ fieldTypeId +'/'+searchText +'/'+pageNo;
			service.resultFormat = "e4x";
			service.send();	
			
			trace( "SearchAppointmentsDelegate", service.url );
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