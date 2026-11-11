package com.gazuntite.events
{
	import flash.events.Event;
	
	public class CloseSlideoutEvent extends Event
	{
		public static const CLOSE_SLIDEOUT:String = "closeSlideout";
		
		
		
		public function CloseSlideoutEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(CLOSE_SLIDEOUT, bubbles, cancelable);
		}
		
		override public function clone():Event {
			return new  CloseSlideoutEvent(CLOSE_SLIDEOUT);
		}
	}
}