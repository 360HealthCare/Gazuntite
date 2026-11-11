package com.gazuntite.input.event.visit.pmh.comphistory
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class LoadMedicalHistoryByPatientIdEvent extends CairngormEvent
	{
		public function LoadMedicalHistoryByPatientIdEvent()
		{
			super(QIController.LOAD_MEDICAL_HISTORY_EVENT);
		}
	}
}