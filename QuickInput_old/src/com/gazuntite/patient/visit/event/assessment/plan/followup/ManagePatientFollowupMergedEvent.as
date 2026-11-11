package com.gazuntite.patient.visit.event.assessment.plan.followup
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class ManagePatientFollowupMergedEvent extends CairngormEvent
	{
		public function ManagePatientFollowupMergedEvent()
		{
			super(QIController.MANAGE_PATIENT_FOLLOW_UP_EVENT);
		}
	}
}