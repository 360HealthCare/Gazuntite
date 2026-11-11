package com.gazuntite.controls.calendar.calsample
{
	import com.gazuntite.controls.calendar.views.CalendarDescriptor;

	public class SampleCalendarDescriptor implements com.gazuntite.controls.calendar.views.CalendarDescriptor
	{
		public function getCalendarColor(calendar:*):Number
		{
			return (calendar as Calendar).color;
		}
		
		public function getCalendarName(calendar:*):String 
		{
			return (calendar as Calendar).name;
		}
		
		public function getCalendar(event:*):* 
		{
			return (event as CalendarEvent).calendar;
		}
		
		public function getEventStart(event:*):Date {
			return (event as CalendarEvent).start;
		}
		
		public function getEventEnd(event:*):Date {
			return (event as CalendarEvent).end;
		}
		
		public function getEventTitle(event:*):String {
			return (event as CalendarEvent).title;
		}
		
		public function getEventDescription(event:*):String {
			return (event as CalendarEvent).description;
		}
		
		public function getEventColor(event:*):Number {
			//return (event as Event).calendar.color;
			
			//TA - 
			// Event Color are no longer associatd with calendar Color
			// Each Event has its own color according to its EventStatus;
			return (event as CalendarEvent).color;
		}
		
		
	}
}