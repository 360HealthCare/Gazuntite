package com.gazuntite.controls.extended.components.vitals
{
	import flash.events.Event;
	
	public class VitalsEvent extends Event
	{
		public static var VITALS_FOCUS_IN:String = "vitalsFocusIn";
		public static var VITALS_FOCUS_OUT:String = "vitalsFocusOut";
		
		public function VitalsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}