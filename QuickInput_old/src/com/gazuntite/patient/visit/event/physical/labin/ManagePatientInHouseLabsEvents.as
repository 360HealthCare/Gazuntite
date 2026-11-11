package com.gazuntite.patient.visit.event.physical.labin
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class ManagePatientInHouseLabsEvents extends CairngormEvent
	{
		public function ManagePatientInHouseLabsEvents()
		{
			super(QIController.MANAGE_PATIENT_LAB_IN_EVENT)
		}
	}
}