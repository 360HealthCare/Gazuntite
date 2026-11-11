package com.gazuntite.input.view.inputsections.physical.vitals
{
	import com.gazuntite.common.dto.VitalsDTO;
	
	import flash.events.Event;
	
	public class PatientInputPhysicalVitalsEvent extends Event
	{
		public static const PATIENT_INPUT_VITALS_ADD_EVENT:String = "patientInputVitalsAdd";
		public static const PATIENT_INPUT_VITALS_EDIT_EVENT:String = "patientInputVitalsEdit";
		public static const PATIENT_INPUT_VITALS_DELETE_EVENT:String = "patientInputVitalsDelete";
		
		public var vitalsDTO:VitalsDTO;
		
		public function PatientInputPhysicalVitalsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super (type, bubbles, cancelable);
		}
	}
}