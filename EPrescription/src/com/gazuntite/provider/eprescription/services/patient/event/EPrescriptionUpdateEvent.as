package com.gazuntite.provider.eprescription.services.patient.event
{
	import flash.events.Event;
	
	public class EPrescriptionUpdateEvent extends Event
	{
		public static const EPRESCRIPTION_UPDATE:String 	= "EPRESCRIPTION_UPDATE";
		
		public function EPrescriptionUpdateEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			var ev:EPrescriptionUpdateEvent = new EPrescriptionUpdateEvent(type, bubbles, cancelable);
			return ev;
		}
		
	}
}