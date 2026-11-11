package com.gazuntite.events
{
	import flash.events.Event;
	
	public class CompHistoryShowFormEvent extends Event
	{
		public static const SHOW_FORM:String = "showForm";
		
		public var formVisible:Boolean = false;
		
		public function CompHistoryShowFormEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(SHOW_FORM, bubbles, cancelable);
		}
		
		override public function clone():Event {
			return new  CompHistoryShowFormEvent(SHOW_FORM);
		}
	}
}