package com.gazuntite.events
{
	import flash.events.Event;
	
	public class ClearTextInputEvent extends Event
	{
		public static const CLEAR_TEXT_INPUT:String = "clearTextInput";
		
		public function ClearTextInputEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(CLEAR_TEXT_INPUT, bubbles, cancelable);
		}
		
		override public function clone():Event {
			return new  ClearTextInputEvent(CLEAR_TEXT_INPUT);
		}
	}
}