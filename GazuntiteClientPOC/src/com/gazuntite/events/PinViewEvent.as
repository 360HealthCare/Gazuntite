package com.gazuntite.events
{
	import flash.events.Event;
	
	public class PinViewEvent extends Event
	{
		public static const PIN_VIEW_EVENT:String = "pinViewEvent";
		
		
		
		public function PinViewEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(PIN_VIEW_EVENT, bubbles, cancelable);
		}
		
		override public function clone():Event {
			return new  PinViewEvent(PIN_VIEW_EVENT);
		}
	}
}