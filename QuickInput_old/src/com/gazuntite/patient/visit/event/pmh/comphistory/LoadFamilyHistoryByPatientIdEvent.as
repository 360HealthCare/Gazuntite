package com.gazuntite.patient.visit.event.pmh.comphistory
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class LoadFamilyHistoryByPatientIdEvent extends CairngormEvent
	{
		public function LoadFamilyHistoryByPatientIdEvent()
		{
			super(QIController.LOAD_FAMILY_HISTORY_EVENT);
		}
	}
}