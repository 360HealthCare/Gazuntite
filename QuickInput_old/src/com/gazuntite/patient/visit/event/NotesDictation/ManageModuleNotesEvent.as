package com.gazuntite.patient.visit.event.NotesDictation
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;
	import com.gazuntite.patient.visit.dto.ModuleNoteDTO;

	public class ManageModuleNotesEvent extends CairngormEvent
	{
		public var notesDTO:ModuleNoteDTO;
		
		public function ManageModuleNotesEvent(note:ModuleNoteDTO)
		{
			super(QIController.MANAGE_MODULE_NOTES_BY_VISIT_ID_EVENT);
			this.notesDTO = note;
			note = null;
		}
	}
}