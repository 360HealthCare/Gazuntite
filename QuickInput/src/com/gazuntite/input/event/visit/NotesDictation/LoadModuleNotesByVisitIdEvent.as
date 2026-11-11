package com.gazuntite.input.event.visit.NotesDictation
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class LoadModuleNotesByVisitIdEvent extends CairngormEvent
	{
		public function LoadModuleNotesByVisitIdEvent()
		{
			super(QIController.LOAD_MODULE_NOTES_BY_VISIT_ID_EVENT);
		}
	}
}