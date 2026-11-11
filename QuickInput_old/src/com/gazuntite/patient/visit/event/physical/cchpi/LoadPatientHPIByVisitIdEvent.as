package com.gazuntite.patient.visit.event.physical.cchpi
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class LoadPatientHPIByVisitIdEvent extends CairngormEvent
	{
		public function LoadPatientHPIByVisitIdEvent()
		{
			super(QIController.LOAD_PATIENT_HPI_BY_VISIT_ID_EVENT);
		}
	}
}