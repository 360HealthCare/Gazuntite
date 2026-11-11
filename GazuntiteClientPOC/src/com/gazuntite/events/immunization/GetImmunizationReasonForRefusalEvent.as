package com.gazuntite.events.immunization
{
	import flash.events.Event;
	
	public class GetImmunizationReasonForRefusalEvent extends Event
	{
		public static const GET_IMMUNIZATION_REASON_FOR_REFUSAL:String = "getImmunizationReasonForRefusalEvent";
		
		public function GetImmunizationReasonForRefusalEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(GET_IMMUNIZATION_REASON_FOR_REFUSAL, bubbles, cancelable);
		}
		
		override public function clone():Event 
		{
			return new  GetImmunizationReasonForRefusalEvent(this.bubbles, this.cancelable);
		}
	}
}