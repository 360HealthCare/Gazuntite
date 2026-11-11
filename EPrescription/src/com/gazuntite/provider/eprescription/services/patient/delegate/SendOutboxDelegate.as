package com.gazuntite.provider.eprescription.services.patient.delegate
{
	import com.gazuntite.provider.eprescription.services.patient.util.EConstants;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class SendOutboxDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function SendOutboxDelegate( responder : IResponder )
		{
			this.responder 		= responder;
			var url:String 		= EConstants.RESTFULL_SERVICE_BASE_URL + "SendOutBox/";
			service 			= new HTTPService(url);
			service.url 		= url;
			
			service.contentType = "Text/Xml";
			service.method		= "POST";
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function SendOutbox(refno:String, data:XML):void
		{
			service.url += refno;
			service.send(data);	
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