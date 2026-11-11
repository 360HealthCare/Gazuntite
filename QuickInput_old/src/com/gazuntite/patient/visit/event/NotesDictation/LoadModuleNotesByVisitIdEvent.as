package com.gazuntite.patient.visit.event.NotesDictation
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class LoadModuleNotesByVisitIdEvent extends CairngormEvent
	{
		public function LoadModuleNotesByVisitIdEvent()
		{
			super(QIController.LOAD_MODULE_NOTES_BY_VISIT_ID_EVENT);
		}
	}
}