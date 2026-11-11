package com.gazuntite.provider.live.services.scheduler.view.event
{
	import flash.events.Event;
	
	public class RefreshCalendarAppoinmentsEvent extends Event
	{
		public function RefreshCalendarAppoinmentsEvent(type:String)
		{
			super(type, true);

		}
	}
}