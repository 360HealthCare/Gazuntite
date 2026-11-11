package com.gazuntite.provider.live.services.scheduler.view.event
{
	import flash.events.Event;
	
	public class LoadAppointmentEvent extends Event
	{
		public function LoadAppointmentEvent(type:String)
		{
			super(type, true);
		}
	}
}