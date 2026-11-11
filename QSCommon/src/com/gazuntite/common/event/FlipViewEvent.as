package com.gazuntite.common.event
{
	import flash.events.Event;
	
	public class FlipViewEvent extends Event
	{
		public static const FLIP_VIEW_EVENT:String = "flip_view_event";
		public var isAlreadyFlipped:Boolean = false;
		
		public function FlipViewEvent(isAlreadyFlipped:Boolean = false)
		{
			super(FLIP_VIEW_EVENT, true, false);
			this.isAlreadyFlipped		= isAlreadyFlipped;
		}
	}
}