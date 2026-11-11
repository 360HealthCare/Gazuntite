package com.gazuntite.document.view.event
{
	import flash.events.Event;
	
	public class patientListEvent extends Event
	{
		public static const  PATIENT_LIST_CLICKED:String = 'PatientListClick';
		
		
		public var userID: int ;
		public var docomentCount: int ;
		public var patientName: String ;
		
		public function patientListEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}