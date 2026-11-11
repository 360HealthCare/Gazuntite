package com.gazuntite.input.view.inputsections.assessment.treatment.procedure
{
	import com.gazuntite.common.dto.assessment.procedure.ProcedureDTO;
	
	import flash.events.Event;
	
	public class PatientInputAssessmentProcedureEvent extends Event
	{
		public static const PATIENT_INPUT_PROCEDURE_ITEM_KEY_UP_EVENT:String = "patientInputProcedureItemKeyUp";
		public static const PATIENT_INPUT_PROCEDURE_ADD_EVENT:String = "patientInputProcedureAdd";
		public static const PATIENT_INPUT_PROCEDURE_DELETE_EVENT:String = "patientInputProcedureDelete";
		public static const PATIENT_INPUT_PROCEDURE_EDIT_EVENT:String = "patientInputProcedureEdit";
		
		public var searchString:String;
		public var searchType:int;
		public var procedureDTO:ProcedureDTO;
		
		public function PatientInputAssessmentProcedureEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}