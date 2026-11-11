package com.gazuntite.common.delegate
{
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class SavePatientGaxenIdDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function SavePatientGaxenIdDelegate( responder : IResponder)
		{
			this.responder 		= responder;
		//	var url:String 		= QSConstants.RESTFULL_PROVIDER_SERVICE_BASE_URL + "UpdateGaxenID/";
			var url:String 		= 'http://www.quivus.com/QuivusAirDev/QuivusMainManagerService/QuivusManagerProviderSearchRestfullService/QuivusManagerProviderSearchRestfullService.svc/' + "UpdateGaxenID/";
			service 			= new HTTPService(url);
			service.url 		= url;
			service.method		= "GET";
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function SaveGaxenId(userId:String, gaxenId:String):void
		{
			service.url = service.url + gaxenId + "/" + userId ;
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