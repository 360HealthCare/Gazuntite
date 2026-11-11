package com.gazuntite.events.chronicMedication
{
	import flash.events.Event;
	
	public class GetGenericnameEvent extends Event
	{
		public static const GET_GENERIC_NAME:String = "getGenericnameEvent";
		
		public function GetGenericnameEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(GET_GENERIC_NAME, bubbles, cancelable);
		}
		
		public override function clone():Event
		{
			return new GetGenericnameEvent( this.bubbles, this.cancelable );
		}
		
	}
}