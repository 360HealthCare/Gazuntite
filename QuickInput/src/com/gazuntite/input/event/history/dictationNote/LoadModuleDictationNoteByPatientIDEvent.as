package com.gazuntite.input.event.history.dictationNote
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;
	
	public class LoadModuleDictationNoteByPatientIDEvent extends CairngormEvent
	{
		public function LoadModuleDictationNoteByPatientIDEvent()
		{
			super (QIController.LOAD_MODULE_DICTATION_NOTE_BY_PATIENT_ID_EVENT);
		}
	}
}