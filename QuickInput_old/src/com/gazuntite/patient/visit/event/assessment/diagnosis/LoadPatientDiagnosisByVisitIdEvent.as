package com.gazuntite.patient.visit.event.assessment.diagnosis
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class LoadPatientDiagnosisByVisitIdEvent extends CairngormEvent
	{
		public function LoadPatientDiagnosisByVisitIdEvent()
		{
			super(QIController.LOAD_PATIENT_DIAGNOSIS_BY_VISIT_ID_EVENT)
		}
	}
}