package com.gazuntite.provider.eprescription.services.patient.view.events
{
	import flash.events.Event;
	
	public class FavPharmacySelectedEvent extends Event
	{
		public static const PHARMACY_SELECTED:String 		= "FavPharmacySelected";
		public var selection:Object;
		
		public function FavPharmacySelectedEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}