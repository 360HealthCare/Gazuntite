package com.gazuntite.controls.calendar.views
{
	import mx.collections.ArrayCollection;
	
	public interface CalendarDescriptor
	{
		function getCalendarColor(calendar:*):Number;
		function getCalendarName(calendar:*):String;
		function getCalendar(event:*):*;

		function getEventStart(event:*):Date;
		function getEventEnd(event:*):Date;
		function getEventTitle(event:*):String;
		function getEventDescription(event:*):String;
		function getEventColor(event:*):Number;
	}
}