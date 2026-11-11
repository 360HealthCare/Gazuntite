package com.gazuntite.input.event.visit.assessment.plan.followup
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class GetPatientAllMedEvent extends CairngormEvent
	{
		public function GetPatientAllMedEvent()
		{
			super(QIController.LOAD_PATIENT_ALL_MED_EVENT);
		}
	}
}