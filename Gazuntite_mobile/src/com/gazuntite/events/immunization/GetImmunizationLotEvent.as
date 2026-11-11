package com.gazuntite.events.immunization
{
	import flash.events.Event;
	
	public class GetImmunizationLotEvent extends Event
	{
		public static const GET_IMMUNIZATION_LOT:String = "getImmunizationLotEvent";
		
		public function GetImmunizationLotEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(GET_IMMUNIZATION_LOT, bubbles, cancelable);
		}
		
		override public function clone():Event 
		{
			return new  GetImmunizationLotEvent(this.bubbles, this.cancelable);
		}
	}
}