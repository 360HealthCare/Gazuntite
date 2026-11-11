package com.gazuntite.input.event.visit.pmh.immunization
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class LoadImmunizationByVisitIDEvent extends CairngormEvent
	{
		public function LoadImmunizationByVisitIDEvent()
		{
			super(QIController.LOAD_IMMUNIZATION_BY_PATIENT_ID_EVENT);
		}
	}
}