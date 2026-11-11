package com.gazuntite.input.delegate.visit.assessment.diagnosis
{
	import com.gazuntite.common.dto.assessment.diagnosis.DiagnosisDTO;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.input.utils.QIServiceMethods;
	
	import flash.net.URLRequestMethod;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class ManagePatientDiagnosisDelegate
	{
		private var responder : IResponder;
		private var service : HTTPService;
		
		public function ManagePatientDiagnosisDelegate(responder:IResponder)
		{
			this.service 		=  new HTTPService();
			this.responder 		= responder;	
			
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL + QIServiceMethods.MANAGE_PATIENT_DIAGNOSIS;
			service 			= new HTTPService(url);
			service.url 		= url;
			service.method		= URLRequestMethod.POST;
			service.resultFormat = "e4x";
			service.contentType = "application/xml; charset=utf-8";
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);			
		}
		
		public function ManagePatientDiagnosis(newList : ArrayCollection ,LoggedInUserId:int, VisitID:int , patientID:int , actionDate:String, LoggedInUserSessionID:String):void
		{
			service.showBusyCursor = true;
			
			service.url  = service.url + "/" + LoggedInUserId + "/" + VisitID  + "/" + patientID  + "/" + actionDate  + "/" + LoggedInUserSessionID;
			
			var xml2send:XML = XmlUtils.getNodeByTagName("ArrayOfPatientDiagnosisDTO");
			for each (var dto:DiagnosisDTO in newList)
			{
				xml2send.appendChild( dto.ToXML() );
			}
			service.send(xml2send);
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