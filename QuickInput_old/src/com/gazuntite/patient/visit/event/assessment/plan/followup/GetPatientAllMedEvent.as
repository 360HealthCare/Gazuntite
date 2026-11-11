package com.gazuntite.patient.visit.event.assessment.plan.followup
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class GetPatientAllMedEvent extends CairngormEvent
	{
		public function GetPatientAllMedEvent()
		{
			super(QIController.LOAD_PATIENT_ALL_MED_EVENT);
		}
	}
}