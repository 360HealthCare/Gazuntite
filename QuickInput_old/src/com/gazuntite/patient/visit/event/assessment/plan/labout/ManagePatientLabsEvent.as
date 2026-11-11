package com.gazuntite.patient.visit.event.assessment.plan.labout
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class ManagePatientLabsEvent extends CairngormEvent
	{
		public function ManagePatientLabsEvent()
		{
			super(QIController.MANAGE_PATIENT_LABOUT_EVENT);
		}
	}
}