package com.gazuntite.provider.eprescription.services.patient.view.events
{
	import flash.events.Event;
	
	public class PharmacySelectedEvent extends Event
	{
		public static const PHARMACY_SELECTED:String 		= "PharmacySelected";
		public var selection:Object;
		
		public function PharmacySelectedEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}