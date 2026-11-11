package com.gazuntite.controls.calendar.cal.event
{
	import flash.events.Event;
	
	public class DeleteAppointmentEvent extends Event
	{
		public var ID:uint;
		public function DeleteAppointmentEvent(type:String, _ID:Number)
		{
			super(type, true);
			this.ID = _ID;
		}
	}
}