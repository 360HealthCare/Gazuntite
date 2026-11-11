package com.gazuntite.patient.visit.delegate.physical.cchpi
{
	import com.gazuntite.patient.visit.utils.QIConstants;
	import com.gazuntite.patient.visit.utils.QIServiceMethods;
	import com.gazuntite.common.util.QSConstants;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadPatientHPIByVisitIdDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function LoadPatientHPIByVisitIdDelegate(responder:IResponder)
		{
			this.responder = responder;
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL + QIServiceMethods.LOAD_PATIENT_HPI_BY_VISIT_ID;			
			service 			= new HTTPService(url);
			service.url 		= url;	
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function LoadPatientHPI(VisitID:int,IsTemplateVisit:Boolean, SessionID:String):void
		{
			service.showBusyCursor = true;
			service.url = service.url + "/" + VisitID + "/" + IsTemplateVisit + "/" + SessionID ;
			service.resultFormat = "e4x";
			service.send();	
			
			trace( "LoadPatientHPIByVisitIDDelegate", service.url );
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