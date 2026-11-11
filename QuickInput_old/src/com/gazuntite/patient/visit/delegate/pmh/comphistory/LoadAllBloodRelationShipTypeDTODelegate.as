package com.gazuntite.patient.visit.delegate.pmh.comphistory
{
	import com.gazuntite.patient.visit.utils.QIConstants;
	
	import flash.net.URLRequestMethod;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadAllBloodRelationShipTypeDTODelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function LoadAllBloodRelationShipTypeDTODelegate(responder:IResponder)
		{
			this.responder 		= responder;
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL + 'ListAllBloodRelationShipTypeDTOs';			
			service 			= new HTTPService(url);
			service.url 		= url;	
			service.method		= URLRequestMethod.GET;
			service.resultFormat = "e4x";
			service.contentType = "application/xml; charset=utf-8";
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function LoadAllBloodRelationShipType(SessionID:String):void
		{
			service.showBusyCursor = true;
			service.url = service.url + "/" + SessionID;
			service.resultFormat = "e4x";
			service.send();	
			
			trace( "LoadAllBloodRelationShipTypeDTODelegate", service.url );			
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