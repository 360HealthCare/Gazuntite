package com.gazuntite.provider.live.services.elab.delegate
{
	import com.gazuntite.provider.live.services.elab.util.ELabsConstant;
	import com.gazuntite.provider.live.services.elab.util.ELabsServiceMethods;
	
	import mx.managers.CursorManager;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadLabResultDelegate
	{
		private var responder:IResponder;
		private var service:HTTPService;
		
		public function LoadLabResultDelegate(responder:IResponder)
		{
			this.responder = responder;
			
			service = new HTTPService();
			service.url = ELabsConstant.RESTFULL_SERVICE_BASE_URL + ELabsServiceMethods.LOAD_LAB_RESULT;
			service.contentType = "text/xml";
			service.resultFormat = "e4x";
			service.method = "Post";
			
			service.addEventListener(ResultEvent.RESULT, onResult);
			service.addEventListener(FaultEvent.FAULT, onFault);
		}
		
		public function LoadLabResult(xmlToSend:XML):void
		{
			CursorManager.setBusyCursor();
			
			service.send(xmlToSend);
		}
		
		private function onResult(event:ResultEvent):void
		{
			CursorManager.removeBusyCursor();
			
			responder.result(event);
		}
		
		private function onFault(event:FaultEvent):void
		{
			CursorManager.removeBusyCursor();
			
			responder.fault(event);			
		}
	}
}