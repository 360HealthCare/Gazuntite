package com.zigron.gazuntite.view.event
{
	import flash.events.Event;
	
	public class PracticeManagerClickEvent extends Event
	{
		public static const PRACTICE_MANAGER_CLICK_EVENT:String = "PracticeManagerClickEvent";
		public var selected_Section:String;
		
		public function PracticeManagerClickEvent(_selected_Section:String)
		{
			super(PRACTICE_MANAGER_CLICK_EVENT, true, true);
			this.selected_Section = _selected_Section;
		}
	}
}