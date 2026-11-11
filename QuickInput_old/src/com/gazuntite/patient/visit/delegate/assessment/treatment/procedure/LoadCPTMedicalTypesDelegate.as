package com.gazuntite.patient.visit.delegate.assessment.treatment.procedure
{
	import com.gazuntite.patient.visit.model.QIModelLocator;
	import com.gazuntite.patient.visit.utils.QIConstants;
	import com.gazuntite.patient.visit.utils.QIServiceMethods;
	import com.gazuntite.common.util.QSCommonServiceMethods;
	import com.gazuntite.common.util.QSConstants;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadCPTMedicalTypesDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		
		
		public function LoadCPTMedicalTypesDelegate(responder:IResponder)
		{
			this.responder 		= responder;
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL + QIServiceMethods.LOAD_CPT_MEDICAL_TYPES;			
			service 			= new HTTPService(url);
			service.url 		= url;	
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		public function CPTMediacalTypeList(cptName:String , sessionID:String ):void
		{
			
			service.showBusyCursor = true;
			service.url = service.url + "/" + cptName + "/" + sessionID;
			service.resultFormat = "e4x";
			service.send();	
			//logger.debug( "LoadAllClaimbyProviderId -- > service.url:<br>" + service.url );
			trace( "LoadCPTMedicalTypesDelegate", service.url );
		}
		
		private function onResult(event:ResultEvent):void
		{
			responder.result(event);
			//logger.debug( "LoadAllClaimbyProviderId -- > result for call:<br>" + service.url + "<br> " + event.result);
		}
		
		private function onFault(event:FaultEvent):void
		{
			responder.fault(event);			
		}
	}
}