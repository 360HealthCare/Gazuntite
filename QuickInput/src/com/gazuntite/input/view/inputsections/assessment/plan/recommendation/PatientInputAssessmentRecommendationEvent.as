package com.gazuntite.input.view.inputsections.assessment.plan.recommendation
{
	import com.gazuntite.common.dto.assessment.recommendation.RecommendationDTO;
	
	import flash.events.Event;
	
	public class PatientInputAssessmentRecommendationEvent extends Event
	{
		public static const PATIENT_INPUT_RECOMMENDATION_ADD_EVENT:String = "patientInputRecommendationAdd";
		public static const PATIENT_INPUT_RECOMMENDATION_ITEM_EDIT_KEY_UP_EVENT:String = "patietInputRecommendationItemEditKeyUp";
		public static const PATIENT_INPUT_RECOMMENDATION_DELETE_EVENT:String = "patientInputRecommendationDelete";
		public static const PATIENT_INPUT_RECOMMENDATION_EDIT_EVENT:String = "patientInputRecommendationEdit";
		
		public var searchString:String;
		public var recommedationDTO:RecommendationDTO;
		
		public function PatientInputAssessmentRecommendationEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}