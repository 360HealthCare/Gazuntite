package com.gazuntite.common.view.events
{
	import flash.events.Event;
	
	public class ListOnlySelectionEvent extends Event
	{
		public static const LIST_ONLY_SELECTION	:String = "ListOnlySelection";
		
		public var selection:Object;
		public var from:String;
		public var to:String;
		
		public function ListOnlySelectionEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super( LIST_ONLY_SELECTION, bubbles, cancelable );
		}
	}
}