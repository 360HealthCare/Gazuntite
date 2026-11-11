package com.gazuntite.events.cchpi
{
	import flash.events.Event;
	
	public class GetSymptomsEvent extends Event
	{
		public static const GET_TEST_NAME:String = "getSymptomsEvent";
		
		public function GetSymptomsEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(GET_TEST_NAME, bubbles, cancelable);
		}
		
		public override function clone():Event
		{
			return new GetSymptomsEvent( this.bubbles, this.cancelable );
		}
		
	}
}