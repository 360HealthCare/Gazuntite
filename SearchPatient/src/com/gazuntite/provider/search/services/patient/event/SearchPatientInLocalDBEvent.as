package com.gazuntite.provider.search.services.patient.event
{
	import flash.events.Event;
	
	public class SearchPatientInLocalDBEvent extends Event
	{
		public static const SEARCH_PATIENT_IN_LOCAL_DB_EVENT:String = "SearchPatientInLocalDBEvent";
		
		public var searchString 	: String;
		public var qcase 			: uint;
		public var callBack			: Function;
		
		public function SearchPatientInLocalDBEvent(_searchString:String, _qcase:uint)//, _callBack:Function = null)
		{
			super(SEARCH_PATIENT_IN_LOCAL_DB_EVENT, true, false);
			searchString 		= _searchString;
			qcase 				= _qcase;
			//callBack 			= _callBack;
		}
	}
}