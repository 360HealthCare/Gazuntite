package com.gazuntite.events
{
	import flash.events.Event;
	
	public class DoctorStatusChangeEvent extends Event
	{
		public static const DOCTOR_STATUS_CHANGE_EVENT:String = "doctorStatusChangeEvent";
		
		public var status:String = "";
		
		public function DoctorStatusChangeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(DOCTOR_STATUS_CHANGE_EVENT, bubbles, cancelable);
		}
		
		override public function clone():Event {
			return new  DoctorStatusChangeEvent(DOCTOR_STATUS_CHANGE_EVENT);
		}
	}
}