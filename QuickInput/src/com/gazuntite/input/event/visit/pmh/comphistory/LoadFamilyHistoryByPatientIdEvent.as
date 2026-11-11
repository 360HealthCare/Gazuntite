package com.gazuntite.input.event.visit.pmh.comphistory
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class LoadFamilyHistoryByPatientIdEvent extends CairngormEvent
	{
		public function LoadFamilyHistoryByPatientIdEvent()
		{
			super(QIController.LOAD_FAMILY_HISTORY_EVENT);
		}
	}
}