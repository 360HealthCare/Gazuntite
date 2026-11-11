package com.gazuntite.events.immunization
{
	import flash.events.Event;
	
	public class GetImmunizationTypesEvent extends Event
	{
		public static const GET_IMMUNIZATION_TYPES:String = "getImmunizationTypesEvent";
		
		public function GetImmunizationTypesEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event {
			return new  GetImmunizationTypesEvent(GET_IMMUNIZATION_TYPES);
		}
	}
}