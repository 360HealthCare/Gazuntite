package com.gazuntite.common.view.events
{
	import flash.events.Event;
	
	public class SelectSection extends Event
	{
		private var m_sSectionID:String;
		public static const SelectSelectionEvent:String 	= 'SelectSelectionEvent';
		public static const SelectTabEvent:String 			= 'SelectTabEvent';
		public static const SelectInnerTabEvent:String 		= 'SelectInnerTabEvent';
		
		public function SelectSection(type:String, sectionID:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			SectionID = sectionID;
		}

		public function get SectionID():String
		{
			return m_sSectionID;
		}

		public function set SectionID(value:String):void
		{
			m_sSectionID = value;
		}

	}
}