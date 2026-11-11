package com.gazuntite.patient.visit.delegate.visit
{
	import com.gazuntite.patient.visit.dto.visit.VisitDTO;
	import com.gazuntite.patient.visit.utils.QIConstants;
	import com.gazuntite.patient.visit.utils.QIServiceMethods;
	import com.gazuntite.common.util.QSConstants;
	
	import flash.net.URLRequestMethod;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class CreateVisitDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		private var logger:ILogger = Log.getLogger("com.gazuntite.patient.visit.delegate.visit.CreateVisitDelegate");
		
		public function CreateVisitDelegate(responder:IResponder)
		{
			this.responder = responder;
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL + QIServiceMethods.CREATE_NEW_VISIT;			
			service 			= new HTTPService(url);
			service.url 		= url;	
			
			service.method		= URLRequestMethod.POST;
			service.contentType 	= "application/xml; charset=utf-8";
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function CreateVisit(providerID:int, sessionID:String, visitDTO:VisitDTO):void
		{
			service.showBusyCursor = true;
			service.url = service.url + "/" + providerID  + "/" + sessionID;
			service.resultFormat = "e4x";
			
			var xml2send:String = visitDTO.ToXML().toXMLString();
			
			logger.debug( "service.url: " + service.url );
			logger.debug( "xml2send: " + xml2send );
			
			
			service.send(xml2send);	
			
			trace( "CreateVisitDelegate", service.url );
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