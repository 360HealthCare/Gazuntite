package com.zigron.gazuntite.view.event
{
	import flash.events.Event;
	
	public class NavigationEvent extends Event
	{
		public static const ClOSE_VIEW:String = "closeViewEvent";
		
		public static const EMAIL_OPTION_CHANGE:String="emailOptionChange";
		
		public var content:*;

		public function NavigationEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}