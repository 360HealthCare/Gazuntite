package com.gazuntite.events
{
	import flash.events.Event;
	
	import mx.utils.ObjectProxy;
	
	public class CommOpenEvent extends Event
	{
		public static const COMM_OPEN:String = "commOpen";
		
		public var isOpen:Boolean = false;
		
		public function CommOpenEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(COMM_OPEN, bubbles, cancelable);
		}
		
		override public function clone():Event {
			return new  CommOpenEvent(COMM_OPEN);
		}
	}
}