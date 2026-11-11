package com.gazuntite.provider.live.services.scheduler.view.event
{
	import flash.events.Event;
	
	public class PatientSelectedEvent extends Event
	{
		public var selection:Object;
		public function PatientSelectedEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}