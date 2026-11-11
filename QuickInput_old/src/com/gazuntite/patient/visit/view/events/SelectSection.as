package com.gazuntite.patient.visit.view.events
{
	import flash.events.Event;
	
	public class SelectSection extends Event
	{
		private var m_sSectionID:String;
		public function SelectSection(type:String, sectionID:String, bubbles:Boolean=false, cancelable:Boolean=false)
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