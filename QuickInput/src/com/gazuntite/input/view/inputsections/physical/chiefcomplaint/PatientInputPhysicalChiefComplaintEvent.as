package com.gazuntite.input.view.inputsections.physical.chiefcomplaint
{
	import com.gazuntite.common.dto.physical.ccHpi.ChiefComplaintHpiDTO;
	
	import flash.events.Event;
	
	public class PatientInputPhysicalChiefComplaintEvent extends Event
	{
		public static const PATIENT_INPUT_CHIEF_COMPLAINT_ITEM_EDIT_KEY_UP_EVENT:String = "patientInputChiefComplaintItemEditKeyUp";
		public static const PATIENT_INPUT_CHIEF_COMPLAINT_ADD_EVENT:String= "patientInputChiefComplaintAdd";
		public static const PATIENT_INPUT_CHIEF_COMPLAINT_DELETE_EVENT:String = "patientInputChiefComplaintDelete";
		public static const PATIENT_INPUT_CHIEF_COMPLAINT_EDIT_EVENT:String = "patientInputChiefComplaintEdit";
		
		public var searchString:String;
		public var sectionName:String;
		public var chiefComplaintHpiDTO:ChiefComplaintHpiDTO;
		
		public function PatientInputPhysicalChiefComplaintEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}