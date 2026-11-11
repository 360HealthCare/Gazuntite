package com.gazuntite.patient.visit.delegate.assessment.treatment.procedure
{
	import com.gazuntite.patient.visit.utils.QIConstants;
	import com.gazuntite.patient.visit.utils.QIServiceMethods;
	
	import flash.net.URLRequestMethod;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadProcedureByVisitIDDelegate
	{
		private var responder : IResponder;
		private var service : HTTPService;
		
		public function LoadProcedureVisitID(VisitID:int , IsTemplateVisit :Boolean ,LoggedInUserSessionID:String):void
		{
			service.url  = service.url + "/" + VisitID + "/" + IsTemplateVisit + "/" + LoggedInUserSessionID ;
			trace(service.url);
			service.send();
		}
		public function LoadProcedureByVisitIDDelegate(responder:IResponder)
		{
			this.service =  new HTTPService();
			this.responder = responder;	
			
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL  + QIServiceMethods.LOAD_PROCEDURE_BY_VISIT_ID;
			service 			= new HTTPService(url);
			service.url 		= url;
			service.method		= URLRequestMethod.GET;
			service.resultFormat = "e4x";
			
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
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