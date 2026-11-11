package com.gazuntite.events
{
	import flash.events.Event;
	
	import mx.utils.ObjectProxy;
	
	public class ToggleFormOptionsEvent extends Event
	{
		public static const TOGGLE_FORM_OPTIONS:String = "toggleFormOptions";
		
		public var full:Boolean = false;
		
		public function ToggleFormOptionsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(TOGGLE_FORM_OPTIONS, bubbles, cancelable);
		}
		
		override public function clone():Event {
			return new  ToggleFormOptionsEvent(TOGGLE_FORM_OPTIONS);
		}
	}
}