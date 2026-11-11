package com.gazuntite.provider.eprescription.services.patient.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.appController.EPrescriptionController;
	
	public class SearchPatientbyClinicIdEvent extends CairngormEvent
	{
		
		public var pageNo 			: int;
		public var searchString 	: String;
		public var callBack			: Function;
		
		public function SearchPatientbyClinicIdEvent( searchString:String, pageNo:int, callback:Function = null )
		{
			super( EPrescriptionController.SUBSCRIBE_PATIENT_EVENT );
			this.searchString 	= searchString;
			this.pageNo 		= pageNo;
			this.callBack 		= callback;
		}
	}
}