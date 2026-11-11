package com.gazuntite.patient.visit.event.pmh.comphistory
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class ManagePatientSocialHistoryDeleteEvent extends CairngormEvent
	{
		public function ManagePatientSocialHistoryDeleteEvent()
		{
			super(QIController.MANAGE_PATIENT_SOCIAL_HISTORY_DELETE_EVENT);
		}
	}
}