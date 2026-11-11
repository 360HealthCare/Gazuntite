package com.gazuntite.provider.eprescription.services.patient.delegate
{
	import com.gazuntite.provider.eprescription.services.patient.util.EConstants;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class DeleteOutBoxDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		
		public function DeleteOutBoxDelegate( responder : IResponder )
		{
			this.responder 		= responder;
			var url:String 		= EConstants.RESTFULL_SERVICE_BASE_URL + "DeleteOutBox/";
			service 			= new HTTPService(url);
			service.url 		= url;
			
			service.contentType = "Text/Xml";
			service.method		= "POST";
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
			
		}
		
		public function RemoveOutbox(refno:String, data:XML):void
		{
			service.url += refno;
			service.send(data);	
			trace( service.url );
		}
		
		private function onResult(event:ResultEvent):void
		{
			responder.result(event);
			trace( "RemoveOutboxDelegate -- > result for call:<br>" + service.url + "<br> " + event.result.toString());
		}
		
		private function onFault(event:FaultEvent):void
		{
			responder.fault(event);			
			trace("RemoveOutboxDelegate -- > fault for call:<br>" + service.url + "<br> " + event.fault);
		}	
	}
}