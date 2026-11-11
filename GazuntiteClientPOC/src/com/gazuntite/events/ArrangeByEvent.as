package com.gazuntite.events
{
	import flash.events.Event;
	
	public class ArrangeByEvent extends Event
	{
		public static const ARRANGE_BY:String = "arrangeBy";
		
		public var field:String;
		
		public function ArrangeByEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(ARRANGE_BY, bubbles, cancelable);
		}
		
		override public function clone():Event {
			return new  ArrangeByEvent(ARRANGE_BY);
		}
	}
}