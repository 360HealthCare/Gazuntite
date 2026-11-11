package com.gazuntite.patient.visit.delegate.assessment.plan.followup
{
	import com.gazuntite.patient.visit.utils.QIConstants;
	import com.gazuntite.patient.visit.utils.QIServiceMethods;
	
	import flash.net.URLRequestMethod;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class GetPatientAllMedDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function GetPatientAllMedDelegate(responder:IResponder)
		{
			this.responder 		= responder;
			var url:String 		= QIConstants.EPRESCRIPTION_RESTFULSERVICE + QIServiceMethods.GET_PATIENT_ALL_MEDS;			
			service 			= new HTTPService(url);
			service.url 		= url;	
			service.method		= URLRequestMethod.POST;
			service.resultFormat = "e4x";
			service.contentType = "application/xml; charset=utf-8";
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function getPatientDrugs(gaxenID:String):void
		{
			service.showBusyCursor = true;
			service.url = service.url + "/" + "0" + "/" + gaxenID;
			service.resultFormat = "e4x";
			service.send("<Header/>");	
			
			trace( "GetPatientAllMedDelegate", service.url );
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