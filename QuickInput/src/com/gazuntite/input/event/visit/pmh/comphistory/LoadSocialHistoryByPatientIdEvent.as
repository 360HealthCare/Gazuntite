package com.gazuntite.input.event.visit.pmh.comphistory
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class LoadSocialHistoryByPatientIdEvent extends CairngormEvent
	{
		public function LoadSocialHistoryByPatientIdEvent()
		{
			super(QIController.LOAD_SOCIAL_HISTORY_EVENT);
		}
	}
}