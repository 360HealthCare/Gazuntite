package com.gazuntite.events
{
	import flash.events.Event;
	
	public class GetImmunizationTypesEvent extends Event
	{
		public static const GET_IMMUNIZATION_TYPES:String = "getImmunizationTypes";
		
		public function GetImmunizationTypesEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(GET_IMMUNIZATION_TYPES, bubbles, cancelable);
		}
		
		override public function clone():Event {
			return new  GetImmunizationTypesEvent(GET_IMMUNIZATION_TYPES);
		}
	}
}