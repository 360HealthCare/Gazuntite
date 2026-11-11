package com.gazuntite.patient.visit.delegate.physical.vitals
{
	import com.gazuntite.patient.visit.utils.QIConstants;
	import com.gazuntite.patient.visit.utils.QIServiceMethods;
	import com.gazuntite.common.util.QSConstants;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadPatientVitalByVisitDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function LoadPatientVitalByVisitDelegate(responder:IResponder)
		{
			this.responder = responder;
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL + QIServiceMethods.LOAD_PATIENT_BY_VISIT_ID;			
			service 			= new HTTPService(url);
			service.url 		= url;	
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function LoadVitalsByVisitID(VisitID:int,IsTemplateVisit:Boolean,LoggedInUserSessionID:String):void
		{
			service.showBusyCursor = true;
			//LoadImmunicationStaticData/{searchCritera}/{clinicBranchID}/{subSectionName}/{userSessionID}
			service.url = service.url + "/" + VisitID + "/" + IsTemplateVisit + "/" + LoggedInUserSessionID;
			service.resultFormat = "e4x";
			service.send();	
			
			trace( "LoadVitalsByVisiteIDDelegate", service.url );
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