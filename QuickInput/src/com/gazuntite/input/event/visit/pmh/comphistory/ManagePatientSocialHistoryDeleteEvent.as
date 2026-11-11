package com.gazuntite.input.event.visit.pmh.comphistory
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class ManagePatientSocialHistoryDeleteEvent extends CairngormEvent
	{
		public function ManagePatientSocialHistoryDeleteEvent()
		{
			super(QIController.MANAGE_PATIENT_SOCIAL_HISTORY_DELETE_EVENT);
		}
	}
}