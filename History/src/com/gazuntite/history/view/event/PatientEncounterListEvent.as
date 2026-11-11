package com.gazuntite.history.view.event
{
	import com.gazuntite.common.dto.PatientEncounterDTO;
	
	import flash.events.Event;
	
	public class PatientEncounterListEvent extends Event
	{
		public static const PATIENT_ENCOUNTER_SOAP_NOTE_VIEW_EVENT:String = "patientEncounterSoapNoteView";
		
		public var patientEncounterDTO:PatientEncounterDTO;
		public var soapNoteLoadCompleteCallback:Function;
		
		public function PatientEncounterListEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}