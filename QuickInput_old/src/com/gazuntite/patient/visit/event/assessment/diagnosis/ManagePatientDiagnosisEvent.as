package com.gazuntite.patient.visit.event.assessment.diagnosis
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class ManagePatientDiagnosisEvent extends CairngormEvent
	{
		public function ManagePatientDiagnosisEvent()
		{
			super(QIController.MANAGE_PATIENT_DIAGNOSIS_EVENT);
		}
	}
}