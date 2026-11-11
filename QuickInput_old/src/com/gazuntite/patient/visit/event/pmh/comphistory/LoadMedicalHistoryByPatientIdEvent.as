package com.gazuntite.patient.visit.event.pmh.comphistory
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class LoadMedicalHistoryByPatientIdEvent extends CairngormEvent
	{
		public function LoadMedicalHistoryByPatientIdEvent()
		{
			super(QIController.LOAD_MEDICAL_HISTORY_EVENT);
		}
	}
}