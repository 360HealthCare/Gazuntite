package com.gazuntite.events.immunization
{
	import flash.events.Event;
	
	public class GetImmunizationSitesEvent extends Event
	{
		public static const GET_IMMUNIZATION_SITES:String = "getImmunizationSitesEvent";
		
		public function GetImmunizationSitesEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(GET_IMMUNIZATION_SITES, bubbles, cancelable);
		}
		
		override public function clone():Event 
		{
			return new  GetImmunizationSitesEvent(this.bubbles, this.cancelable);
		}
	}
}