package com.gazuntite.patient.visit.delegate.pmh.immunization
{
	import com.gazuntite.patient.visit.utils.QIConstants;
	import com.gazuntite.patient.visit.utils.QIServiceMethods;
	import com.gazuntite.common.util.QSConstants;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadImmunizationByVisitIDDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		
		public function LoadImmunizationByVisitIDDelegate(responder:IResponder)
		{
			this.responder = responder;
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL + QIServiceMethods.LOAD_IMMUNICATION_BY_VISIT_ID;			
			service 			= new HTTPService(url);
			service.url 		= url;	
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		
		public function LoadImmunicationByVisitID(VisitID:int,IsTemplateVisit:Boolean, LoggedInUserSessionID:String, PatientID:int):void
		{
			service.showBusyCursor = true;
			service.url = service.url + "/" + VisitID + "/" + IsTemplateVisit + "/" + LoggedInUserSessionID + "/" + PatientID;
			service.resultFormat = "e4x";
			service.send();	
			
			trace( "LoadimmunizationByVisitIDDelegate", service.url );
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