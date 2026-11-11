package com.gazuntite.provider.live.services.scheduler.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.scheduler.appControllerSCH.SchedulerController;
	
	public class SearchPatientEvent extends CairngormEvent
	{
		public var clinicBranchId 	: int;
		public var providerId 		: int;
		public var userTypeId 		: int;
		public var searchString 	: String;
		public var pageNo 			: int;
		public var functionName 	: Function;
		
		public function SearchPatientEvent( _clinicBranchId:int, _providerId:int, _userTypeId:int, _searchString:String, _pageNo:int, _functionName : Function)
		{
			super(SchedulerController.SEARCH_PATIENT_BY_CLINIC_ID_SEARCH_STRING_EVENT);
			this.clinicBranchId		=_clinicBranchId;
			this.providerId			= _providerId
			this.userTypeId			= _userTypeId;
			this.searchString 		= _searchString;
			this.pageNo       		= _pageNo;
			this.functionName 		= _functionName;
		}
	}
}