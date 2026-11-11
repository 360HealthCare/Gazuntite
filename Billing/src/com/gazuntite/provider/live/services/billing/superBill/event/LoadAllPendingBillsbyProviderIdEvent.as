package com.gazuntite.provider.live.services.billing.superBill.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.billing.appController.BillingController;

	public class LoadAllPendingBillsbyProviderIdEvent extends CairngormEvent
	{
		public var providerId			: int;		
		public var clinicBranchId		: int;
		public var searchType		    : int;
		public var searchString		    : String;
		public var pageNumber		    : int;
		public var callBack			    : Function;
		
		public function LoadAllPendingBillsbyProviderIdEvent(providerId: int,clinicBranchId:int,searchType:int = 0,searchString:String = "0",pageNumber:int = 1,callBack: Function = null)
		{
			super( BillingController.LOAD_ALL_PENDING_BILLS_BY_PROVIDER_ID_EVENT );	
			
			this.providerId 		= providerId;int
			this.callBack			= callBack;
			this.clinicBranchId     = clinicBranchId;int
			this.searchType			= searchType;
			this.searchString		= searchString;
			this.pageNumber			= pageNumber;
		}
	}
}