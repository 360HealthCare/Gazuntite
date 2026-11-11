package com.gazuntite.provider.search.services.patient.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.search.services.patient.appController.SearchPatientController;
	
	public class SearchPatientbyClinicIdEvent extends CairngormEvent
	{
		
		public var pageNo 			: int;
		public var searchString 	: String;
		public var filterType 		: int;
		public var callBack			: Function;
		
		public function SearchPatientbyClinicIdEvent( searchString:String, pageNo:int, filterType:int, callback:Function = null )
		{
			super( SearchPatientController.SEARCH_PATIENT_BY_CLINIC_ID_EVENT );
			this.searchString 	= searchString;
			this.pageNo 		= pageNo;
			this.filterType 	= filterType;
			this.callBack 		= callback;
		}
	}
}