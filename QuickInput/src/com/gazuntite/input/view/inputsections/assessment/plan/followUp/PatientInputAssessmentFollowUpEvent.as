package com.gazuntite.input.view.inputsections.assessment.plan.followUp
{
	import com.gazuntite.common.dto.assessment.followUp.FollowUpDTO;
	
	import flash.events.Event;
	
	public class PatientInputAssessmentFollowUpEvent extends Event
	{
		public static const PATIENT_INPUT_FOLLOW_UP_ITEM_EDIT_KEY_UP_EVENT:String = "patietInputFollowUpItemEditKeyUp";
		public static const PATIENT_INPUT_FOLLOW_UP_ADD_EVENT:String = "patientInputFollowUpAdd";
		public static const PATIENT_INPUT_FOLLOW_UP_DELETE_EVENT:String = "patientInputFollowUpDelete";
		public static const PATIENT_INPUT_FOLLOW_UP_EDIT_EVENT:String = "patientInputFollowUpEdit";
		
		public static const PATIENT_INPUT_LOAD_FOLLOW_UP_LABS:String = "patientInputLoadFollowUpLabs";
		public var searchString:String;
		public var followUpDataControlTypeID:int;
		public var followUpDTO:FollowUpDTO;
		
		public function PatientInputAssessmentFollowUpEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}