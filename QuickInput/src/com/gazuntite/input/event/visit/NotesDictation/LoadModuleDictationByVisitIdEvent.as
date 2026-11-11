package com.gazuntite.input.event.visit.NotesDictation
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class LoadModuleDictationByVisitIdEvent extends CairngormEvent
	{
		public function LoadModuleDictationByVisitIdEvent()
		{
			super(QIController.LOAD_MODULE_DICTATION_BY_VISIT_ID_EVENT);
		}
	}
}