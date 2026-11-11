package com.gazuntite.provider.live.services.billing.superBill.delegate
{
	import com.gazuntite.provider.live.services.billing.claimManagement.dto.CMSearchDTO;
	import com.gazuntite.provider.live.services.billing.superBill.util.SuperBillConstants;
	import com.gazuntite.provider.live.services.billing.superBill.util.SuperBillServiceMethods;
	
	import flash.net.URLRequestMethod;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class LoadAllPendingBillsbyProviderIdDelegate 
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function LoadAllPendingBillsbyProviderIdDelegate(responder : IResponder )
		{
			this.responder 		= responder;
			
			var url:String 		= SuperBillConstants.RESTFULL_SERVICE_BASE_URL + SuperBillServiceMethods.LOAD_PENDING_BILLS_BY_SEARCH_CRITERIA;
			service 			= new HTTPService(url);
			service.url 		= url;	
			service.requestTimeout = 60;
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		public function SearchPendingBillsList(clinicBranchId:int,searchType:int = 0,searchString:String = "0", pageNumber:int = 1 ):void
		{			
			service.showBusyCursor = true;
			
			var searchDTO:CMSearchDTO = new CMSearchDTO();
			
			searchDTO.Type = searchType.toString();
			searchDTO.SearchString = searchString;
			searchDTO.PageNo = pageNumber.toString();
			searchDTO.ClinicBranchId = clinicBranchId.toString();
			
			searchDTO.BatchID = "0";
			searchDTO.BillDate = "1900-01-01";
			searchDTO.ClaimID = "0";			
			searchDTO.DateCreated "1900-01-01";
			searchDTO.EDIReceiverTypeID ="0";
			searchDTO.ExcludeDone = "true"
			searchDTO.InsOrganizationID = "0";
			searchDTO.InsuranceTypeId = "0";
			searchDTO.ListType = "0";
			searchDTO.MediaTypeID = "0";			
			searchDTO.PatientID = "0";
			searchDTO.QuivusID = "0";			
			searchDTO.StatusTypeID = "0";			
			searchDTO.VisitDate = "1900-01-01";	
			searchDTO.DateCreated = "1900-01-01";
			
			var searchDetail:XML = searchDTO.ToXML();
			
			service.resultFormat 	= "e4x";
			service.contentType 	= "Text/Xml"; 
			service.method 			= URLRequestMethod.POST;
			service.send( searchDetail );	
			
			trace( "LoadAllPendingBillsbyProviderIdDelegate", service.url );
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