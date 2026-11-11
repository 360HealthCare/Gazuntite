package com.gazuntite.provider.live.services.scheduler.view.event
{
	import flash.events.Event;
	
	public class RefreshScheduleAppointmentsEvent extends Event
	{
		public function RefreshScheduleAppointmentsEvent(type:String)
		{
			super(type, true);
		}
	}
}