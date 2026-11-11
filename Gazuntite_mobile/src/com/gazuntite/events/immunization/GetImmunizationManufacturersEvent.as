package com.gazuntite.events.immunization
{
	import flash.events.Event;
	
	public class GetImmunizationManufacturersEvent extends Event
	{
		public static const GET_IMMUNIZATION_MANUFACTURERS:String = "getImmunizationManufacturersEvent";
		
		public function GetImmunizationManufacturersEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(GET_IMMUNIZATION_MANUFACTURERS, bubbles, cancelable);
		}
		
		override public function clone():Event 
		{
			return new  GetImmunizationManufacturersEvent(this.bubbles, this.cancelable);
		}
	}
}