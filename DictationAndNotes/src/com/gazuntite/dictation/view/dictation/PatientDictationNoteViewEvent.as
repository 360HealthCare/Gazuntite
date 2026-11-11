package com.gazuntite.dictation.view.dictation
{
	import flash.events.Event;
	
	public class PatientDictationNoteViewEvent extends Event
	{
		public static const PATIENT_DICTATION_NOTE_SAVE_EVENT:String = "patientDictationNoteSave";
		
		public var isNoteSave:Boolean;
		public var data:Object;
		public var moduleName:String;
		
		public function PatientDictationNoteViewEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super (type, bubbles, cancelable);
		}
	}
}