package com.gazuntite.controls.calendar.cal.event
{
	import flash.events.Event;
	
	public class ChangeViewEvent extends Event
	{
		public var viewIndex:Number;
		public function ChangeViewEvent(type:String, _viewIndex:Number)
		{
			super(type, true);
			this.viewIndex = _viewIndex;
		}
	}
}