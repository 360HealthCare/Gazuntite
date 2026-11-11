package com.gazuntite.input.view.inputsections.assessment.diagnosis
{
	import com.gazuntite.common.dto.assessment.diagnosis.DiagnosisDTO;
	
	import flash.events.Event;

	public class PatientInputAssessmentDiagnosisEvent extends Event
	{
		public static const PATIENT_INPUT_DIAGNOSIS_ITEM_EDIT_KEY_UP_EVENT:String = "patietInputDiagnosisItemEditKeyUp";
		public static const PATIENT_INPUT_DIAGNOSIS_ADD_EVENT:String = "patientInputDiagnosisAdd";
		public static const PATIENT_INPUT_DIAGNOSIS_DELETE_EVENT:String = "patientInputDiagnosisDelete";
		public static const PATIENT_INPUT_DIAGNOSIS_EDIT_EVENT:String = "patientInputDiagnosisEdit";
		
		public var searchString:String;
		public var diagnosisDTO:DiagnosisDTO;
		public var sectioName:String;
		public var AssociateType:String = 'This Visit';
		
		public function PatientInputAssessmentDiagnosisEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}