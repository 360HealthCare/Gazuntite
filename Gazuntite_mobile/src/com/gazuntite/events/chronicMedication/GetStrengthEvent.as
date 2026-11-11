package com.gazuntite.events.chronicMedication
{
	import flash.events.Event;
	
	public class GetStrengthEvent extends Event
	{
		public static const GET_STRENGTH:String = "getStrengthEvent";
		
		public function GetStrengthEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(GET_STRENGTH, bubbles, cancelable);
		}
		
		public override function clone():Event
		{
			return new GetStrengthEvent( this.bubbles, this.cancelable );
		}
	}
}