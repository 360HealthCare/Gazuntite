package com.gazuntite.events
{
	import flash.events.Event;
	
	public class OptionsButtonClickedEvent extends Event
	{
		public static const OPTIONS_BUTTON_CLICKED:String = "optionsButtonClicked";
		
		public var notes:Boolean = true;
		
		public function OptionsButtonClickedEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(OPTIONS_BUTTON_CLICKED, bubbles, cancelable);
		}
		
		override public function clone():Event {
			return new  OptionsButtonClickedEvent(OPTIONS_BUTTON_CLICKED);
		}
	}
}