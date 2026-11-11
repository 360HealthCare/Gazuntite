package com.gazuntite.input.view.inputsections.assessment.plan.labOut
{
	import com.gazuntite.common.dto.assessment.labOut.LabDTO;
	
	import flash.events.Event;
	
	public class PatientInputAssessmentLabOutEvent extends Event
	{
		public static const PATIENT_INPUT_LAB_OUT_ADD_EVENT:String = "patientInputLabOutAdd";
		public static const PATIENT_INPUT_LAB_OUT_ITEM_EDIT_KEY_UP_EVENT:String = "patietInputLabOutItemEditKeyUp";
		public static const PATIENT_INPUT_LAB_OUT_DELETE_EVENT:String = "patientInputLabOutDelete";
		public static const PATIENT_INPUT_LAB_OUT_EDIT_EVENT:String = "patientInputLabOutEdit";
		
		public var searchString:String;
		public var testTypeID:int;
		public var searchType:int;
		public var labDTO:LabDTO;
		
		public function PatientInputAssessmentLabOutEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}