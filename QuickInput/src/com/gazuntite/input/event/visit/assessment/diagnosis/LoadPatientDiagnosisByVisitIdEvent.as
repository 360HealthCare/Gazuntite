package com.gazuntite.input.event.visit.assessment.diagnosis
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class LoadPatientDiagnosisByVisitIdEvent extends CairngormEvent
	{
		public function LoadPatientDiagnosisByVisitIdEvent()
		{
			super(QIController.LOAD_PATIENT_DIAGNOSIS_BY_VISIT_ID_EVENT)
		}
	}
}