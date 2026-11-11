package com.gazuntite.input.view.inputsections.physical.inhouselab
{
	import com.gazuntite.common.dto.physical.inHouseLab.InHouseLabDTO;
	
	import flash.events.Event;
	
	public class PatientInputPhysicalInHouseLabEvent extends Event
	{
		public static const PATIENT_INPUT_IN_HOUSE_LAB_ITEM_EDIT_KEY_UP_EVENT:String = "patientInputInHouseLabItemEditKeyUp";
		public static const PATIENT_INPUT_IN_HOUSE_LAB_ADD_EVENT:String= "patientInputInHouseLabAdd";
		public static const PATIENT_INPUT_IN_HOUSE_LAB_DELETE_EVENT:String = "patientInputInHouseLabDelete";
		public static const PATIENT_INPUT_IN_HOUSE_LAB_EDIT_EVENT:String = "patientInputInHouseLabEdit";
		
		public var searchString:String;
		public var searchType:int;
		public var inHouseLabDTO:InHouseLabDTO;
		
		public function PatientInputPhysicalInHouseLabEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}