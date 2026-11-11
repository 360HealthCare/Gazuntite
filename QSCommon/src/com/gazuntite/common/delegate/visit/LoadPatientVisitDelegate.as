package com.gazuntite.common.delegate.visit
{
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class LoadPatientVisitDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function LoadPatientVisitDelegate( responder : IResponder )
		{
			this.responder 		= responder;
			var url:String 		= 'http://www.quivus.com/QuivusAirDev/QuivusMainManagerService/QuivusManagerRestfullService/QuivusManagerRestfullService.svc/' + "LoadPatientVisits";
			service 			= new HTTPService(url);
			service.url 		= url;
			
			service.contentType = "Text/Xml";
			service.method		= "GET";
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function GetPatientVisits(userId:String="0", clinicBranchId:String="0"):void
		{
			service.url += "/" + userId + "/" + clinicBranchId ;
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