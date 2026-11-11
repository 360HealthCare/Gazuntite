package com.gazuntite.patient.visit.view.events
{
	import flash.events.Event;
	
	public class VitalsHeaderEvent extends Event
	{
		public static const METRIC_UNIT_SELECTED:String = "metricUnitSelected";
		public static const ENGLISH_UNIT_SELECTED:String = "englishUnitSelected";
		
		public static const CLEAR_CLICKED:String = "clearClicked";
		public static const IMPORT_VITALS_CLICKED:String = "importVitalsClicked";
		public static const SAVE_VITALS_CLICKED:String = "SaveVitalsClicked";
		public static const ALL_NORMAL_CLICKED:String = "ALLNormal";
		
		public function VitalsHeaderEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}