package com.gazuntite.input.view.viewmodel
{
	import flash.events.Event;
	
	public class PatientInputEvent extends Event
	{
		public static var REFRESH_PATIENT_ENCOUNTER_LIST:String = "refreshPatientEncounterList";
		
		public function PatientInputEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}