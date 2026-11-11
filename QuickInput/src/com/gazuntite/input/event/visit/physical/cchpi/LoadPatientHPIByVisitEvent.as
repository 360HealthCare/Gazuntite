package com.gazuntite.input.event.visit.physical.cchpi
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class LoadPatientHPIByVisitEvent extends CairngormEvent
	{
		
		public function LoadPatientHPIByVisitEvent()
		{
			super( QIController.LOAD_PATIENT_HPI_BY_VISIT_EVENT);
		}
	}
}