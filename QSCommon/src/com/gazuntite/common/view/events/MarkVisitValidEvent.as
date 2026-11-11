package com.gazuntite.common.view.events
{
	import flash.events.Event;
	
	public class MarkVisitValidEvent extends Event
	{
		public static const MarkVisitValid	:String = "MarkVisitValid";
		
		public var visitID:int;
		public var visitDate:String;
		
		public function MarkVisitValidEvent(type:String)
		{
			super(type, true, false);
		}
	}
}