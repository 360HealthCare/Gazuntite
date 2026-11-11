package com.gazuntite.input.event.visit.physical.cchpi
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class LoadPatientHPIByVisitIdEvent extends CairngormEvent
	{
		public function LoadPatientHPIByVisitIdEvent()
		{
			super(QIController.LOAD_PATIENT_HPI_BY_VISIT_ID_EVENT);
		}
	}
}