package com.gazuntite.events
{
	import flash.events.Event;
	
	public class ChangeViewEvent extends Event
	{
		public static const CHANGE_VIEW:String = "changeView";
		
		public var selectedView:String = "";
		
		public function ChangeViewEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(CHANGE_VIEW, bubbles, cancelable);
		}
		
		override public function clone():Event {
			return new  ChangeViewEvent(CHANGE_VIEW);
		}
	}
}