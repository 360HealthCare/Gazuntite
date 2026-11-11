package com.gazuntite.patient.visit.event.NotesDictation
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class LoadModuleDictationByVisitIdEvent extends CairngormEvent
	{
		public function LoadModuleDictationByVisitIdEvent()
		{
			super(QIController.LOAD_MODULE_DICTATION_BY_VISIT_ID_EVENT);
		}
	}
}