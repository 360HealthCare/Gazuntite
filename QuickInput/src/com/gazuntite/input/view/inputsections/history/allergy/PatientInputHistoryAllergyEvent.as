package com.gazuntite.input.view.inputsections.history.allergy
{
	import com.gazuntite.common.dto.pmh.Allergy.AllergyDTO;
	
	import flash.events.Event;
	
	public class PatientInputHistoryAllergyEvent extends Event
	{
		public static const PATIENT_INPUT_ALLERGY_EDIT_EVENT:String = "patientInputAllergyEditEvent";
		public static const PATIENT_INPUT_ALLERGY_DELETE_EVENT:String = "patientInputAllergyDelete";
		
		public var allergyDTO:AllergyDTO;
		public var gaxenAllergyID:String;
		
		public function PatientInputHistoryAllergyEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}