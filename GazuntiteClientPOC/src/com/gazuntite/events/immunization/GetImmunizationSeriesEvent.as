package com.gazuntite.events.immunization
{
	import flash.events.Event;
	
	public class GetImmunizationSeriesEvent extends Event
	{
		public static const GET_IMMUNIZATION_SERIES:String = "getImmunizationSeriesEvent";
		
		public function GetImmunizationSeriesEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(GET_IMMUNIZATION_SERIES, bubbles, cancelable);
		}
		
		override public function clone():Event 
		{
			return new  GetImmunizationSeriesEvent(this.bubbles, this.cancelable);
		}
	}
}