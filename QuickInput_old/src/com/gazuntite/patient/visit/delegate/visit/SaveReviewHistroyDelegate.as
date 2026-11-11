package com.gazuntite.patient.visit.delegate.visit
{
	import com.adobe.cairngorm.business.Responder;
	import com.gazuntite.patient.visit.utils.Constants;
	import com.gazuntite.patient.visit.utils.QIConstants;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	

	public class SaveReviewHistroyDelegate
	{
		private var responder : IResponder ;
		private  var service  : HTTPService;
		private var  url      : String;
		
		public function SaveReviewHistroyDelegate(responder:IResponder)
		{
			this.responder      = responder;
			url				    = QIConstants.RESTFULL_SERVICE_BASE_URL + 'ManageVisitReviewByVisitIDAndProviderID';
			service				= new HTTPService(url);
			//service.url			= url;
			service.method		="POST";
			service.contentType	= 'application/xml';
			
			
		}
		public function SaveHistroy(sessionID: String,visitID:int,providerId:int,ReviewHistroyXML:XML):void
		{
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
			service.url = url + "/" + sessionID + "/" + visitID + "/" + providerId ;
			service.resultFormat = "e4x";
			service.send(ReviewHistroyXML  );
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