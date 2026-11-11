package com.gazuntite.provider.eprescription.services.patient.view.events
{
	import flash.events.Event;
	
	public class MedicineSelectedEvent extends Event
	{
		public static const MED_SELECTED:String 		= "MedicineSelected";
		public var selection:Object;
		
		public function MedicineSelectedEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}