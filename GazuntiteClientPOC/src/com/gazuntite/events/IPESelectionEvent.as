package com.gazuntite.events
{
	import flash.events.Event;
	
	public class IPESelectionEvent extends Event
	{
		public static const IPE_SELECTION_CHANGED:String = "ipeSelectionChanged";
		
		public var selection:String = "";
		
		public function IPESelectionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(IPE_SELECTION_CHANGED, bubbles, cancelable);
		}
		
		override public function clone():Event {
			return new  IPESelectionEvent(IPE_SELECTION_CHANGED);
		}
	}
}