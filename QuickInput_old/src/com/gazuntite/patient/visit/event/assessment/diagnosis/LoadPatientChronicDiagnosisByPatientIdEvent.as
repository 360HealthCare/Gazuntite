package com.gazuntite.patient.visit.event.assessment.diagnosis
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;
	
	public class LoadPatientChronicDiagnosisByPatientIdEvent extends CairngormEvent
	{
		public function LoadPatientChronicDiagnosisByPatientIdEvent()
		{
			super(QIController.LOAD_PATIENT_CHRONIC_DIAGNOSIS_BY_PATIENT_ID);
		}
	}
}