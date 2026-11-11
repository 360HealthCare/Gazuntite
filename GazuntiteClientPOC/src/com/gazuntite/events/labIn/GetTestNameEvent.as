package com.gazuntite.events.labIn
{
	import flash.events.Event;
	
	public class GetTestNameEvent extends Event
	{
		public static const GET_TEST_NAME:String = "getTestNameEvent";
		
		public function GetTestNameEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(GET_TEST_NAME, bubbles, cancelable);
		}
		
		public override function clone():Event
		{
			return new GetTestNameEvent( this.bubbles, this.cancelable );
		}
		
	}
}