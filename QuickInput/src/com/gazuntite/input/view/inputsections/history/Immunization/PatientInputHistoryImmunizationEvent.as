package com.gazuntite.input.view.inputsections.history.Immunization
{
	import com.gazuntite.common.dto.pmh.immunization.ImmunizationDTO;
	
	import flash.events.Event;
	
	public class PatientInputHistoryImmunizationEvent extends Event
	{
		public static const PATIENT_INPUT_IMMUNIZATION_ITEM_EDIT_KEY_UP_EVENT:String = "patietInputImmunizationItemEditKeyUp";
		public static const PATIENT_INPUT_IMMUNIZATION_ADD_EVENT:String = "patientInputImmunizationAdd";
		public static const PATIENT_INPUT_IMMUNIZATION_DELETE_EVENT:String = "patientInputImmunizationDelete";
		public static const PATIENT_INPUT_IMMUNIZATION_EDIT_EVENT:String = "patientInputImmunizationEdit";
		
		public var immunizationDTO:ImmunizationDTO;
		
		public function PatientInputHistoryImmunizationEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super (type, bubbles, cancelable);
		}
	}
}