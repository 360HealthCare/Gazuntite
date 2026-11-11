package com.gazuntite.events.immunization
{
	import flash.events.Event;
	
	public class GetImmunizationBodySideRouteEvent extends Event
	{
		public static const GET_IMMUNIZATION_BODY_SIDE_ROUTE:String = "getImmunizationBodySideRouteEvent";
		
		public function GetImmunizationBodySideRouteEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(GET_IMMUNIZATION_BODY_SIDE_ROUTE, bubbles, cancelable);
		}
		
		override public function clone():Event 
		{
			return new  GetImmunizationBodySideRouteEvent(this.bubbles, this.cancelable);
		}
	}
}