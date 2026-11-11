package com.gazuntite.controls.calendar.cal.event
{
	import flash.events.Event;
	
	public class OpenAppointmentEvent extends Event
	{
		public var ID:uint;
		public var StationID:uint;
		public var title:String;
		
		public function OpenAppointmentEvent(type:String, _ID:Number, _StationID:int, _title:String)
		{
			super(type, true);
			this.ID = _ID;
			this.StationID = _StationID;
			this.title = _title;
		}
	}
}