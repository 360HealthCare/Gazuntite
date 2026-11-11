package com.gazuntite.controls.events
{
	import flash.events.Event;
	
	public class FlipViewEvent extends Event
	{
		public static const FLIP_VIEW_EVENT:String = "flip_view_event";
		public function FlipViewEvent()
		{
			super(FLIP_VIEW_EVENT, true, false);
		}
	}
}