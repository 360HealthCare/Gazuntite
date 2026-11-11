package com.gazuntite.provider.search.services.patient.delegate
{
	import com.gazuntite.provider.search.services.patient.util.PSConstants;
	import com.gazuntite.provider.search.services.patient.util.PSServiceMethods;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class SearchPatientbyClinicIdDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function SearchPatientbyClinicIdDelegate( responder : IResponder )
		{
			this.responder 		= responder;
			var url:String 		= PSConstants.RESTFULL_SERVICE_BASE_URL + PSServiceMethods.SEARCH_PATIENT_BY_CLINIC_ID_AND_SEARCH_STRING_FILTERS;
			//var url:String 		= 'http://quivus.com/QuivusAirDev/UserSearchService/Service/RestfulService/UserManagerRestfulService.svc/SearchPatientbyClinicIdAndSearchStringFilters';
			service 			= new HTTPService(url);
			service.url 		= url;
			
			service.contentType = "Text/Xml";
			service.method		= "POST";
		}
		
		public function SearchPatientList(clinicBranchId:int, searchString:String, demandPageNo:int, filterType:int ):void
		{
			var PatientSearch:XML 					= <PatientSearchCriteria />;
			PatientSearch.@clinicBranch				= clinicBranchId;
			PatientSearch.@userType					= 3;
			PatientSearch.@provider 				= 597;
			PatientSearch.@searchString				= searchString;
			PatientSearch.@demandPage				= demandPageNo;
			PatientSearch.@FilterType				= filterType;
			
			service.addEventListener(FaultEvent.FAULT, onFault);
			service.addEventListener(ResultEvent.RESULT, onResult);
			
			service.showBusyCursor = true;
			service.resultFormat = "e4x";

			service.send(PatientSearch);	
			trace('SearchPatientbyClinicIdDelegate', 'CALL SEND FOR RESULT' );
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