package com.gazuntite.patient.visit.event.physical.cchpi
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class LoadPatientHPIByVisitEvent extends CairngormEvent
	{
		
		public function LoadPatientHPIByVisitEvent()
		{
			super( QIController.LOAD_PATIENT_HPI_BY_VISIT_EVENT);
		}
	}
}