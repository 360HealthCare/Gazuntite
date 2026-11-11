package com.gazuntite.input.delegate.visit.visit
{
	import com.gazuntite.input.utils.QIConstants;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class GetVisitChargesDelegate
	{
		private var responder   : IResponder ; 
		private var service     : HTTPService;
		private var url         : String;
		public function GetVisitChargesDelegate(responder:IResponder)
		{
			this.responder 			= responder ;
			this.url	   			= QIConstants.RESTFULL_SERVICE_BASE_URL + 'GetVisitChargesByVisitID';
			service        			= new HTTPService(this.url);
			service.method 			= 'Get';
			service.contentType		= 'Text';
		}
		
		public function GetCharges(visitId:int):void 
		{
			service.addEventListener(ResultEvent.RESULT,onSuccess);
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.url =  url + "/" + visitId;
			//trace(service.url);
			service.resultFormat = "e4x";
			service.send();
			
		}
		
		private function onSuccess(resultEvent:ResultEvent):void
		{
			responder.result(resultEvent);
		}
		public function onFault(faultEvent:FaultEvent):void
		{
			responder.fault(faultEvent);
		}
	}
}