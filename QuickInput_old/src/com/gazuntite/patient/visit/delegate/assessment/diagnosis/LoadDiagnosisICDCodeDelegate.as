package com.gazuntite.patient.visit.delegate.assessment.diagnosis
{
	import com.gazuntite.common.util.QSConstants;
	import com.gazuntite.patient.visit.utils.QIConstants;
	import com.gazuntite.patient.visit.utils.QIServiceMethods;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadDiagnosisICDCodeDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		
		public function LoadICDCode(icdCode:String,sessionID:String):void
		{
			icdCode = UtilityFunctions.getEncodedBase64String(icdCode);
			service.showBusyCursor = true;
			service.url = service.url + "/" + sessionID + "/" + icdCode;
			service.resultFormat = "e4x";
			service.send();	
			
			trace( "LoadDiagnosisICDCodeDelegate", service.url );
		}
		public function LoadDiagnosisICDCodeDelegate(responder : IResponder)
		{
			this.responder 		= responder;
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL + QIServiceMethods.LOAD_DIAGNOSIS_ICD_CODE;			
			service 			= new HTTPService(url);
			service.url 		= url;	
			
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