package com.gazuntite.patient.visit.event.physical.vitals
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class ManagePatientVitalEvent extends CairngormEvent
	{
		public function ManagePatientVitalEvent()
		{
			super(QIController.MANAGE_PATIENT_VITALS_EVENT);
		}
	}
}