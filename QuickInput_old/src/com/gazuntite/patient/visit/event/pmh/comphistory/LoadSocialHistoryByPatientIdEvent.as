package com.gazuntite.patient.visit.event.pmh.comphistory
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class LoadSocialHistoryByPatientIdEvent extends CairngormEvent
	{
		public function LoadSocialHistoryByPatientIdEvent()
		{
			super(QIController.LOAD_SOCIAL_HISTORY_EVENT);
		}
	}
}