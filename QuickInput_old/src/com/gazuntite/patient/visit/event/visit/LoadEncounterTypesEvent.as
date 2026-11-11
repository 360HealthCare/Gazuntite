package com.gazuntite.patient.visit.event.visit
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class LoadEncounterTypesEvent extends CairngormEvent
	{
		public function LoadEncounterTypesEvent()
		{
			super( QIController.LOAD_ENCOUNTER_TYPES_EVENT);
		}
	}
}