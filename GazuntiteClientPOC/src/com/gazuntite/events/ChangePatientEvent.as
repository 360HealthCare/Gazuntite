package com.gazuntite.events
{
	import flash.events.Event;
	
	public class ChangePatientEvent extends Event
	{
		public static const CHANGE_PATIENT:String = "changePatient";
		
		public function ChangePatientEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(CHANGE_PATIENT, bubbles, cancelable);
		}
		
		override public function clone():Event {
			return new  ChangePatientEvent(CHANGE_PATIENT);
		}
	}
}