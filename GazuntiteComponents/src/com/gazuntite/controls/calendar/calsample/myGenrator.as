package com.gazuntite.controls.calendar.calsample
{
	import com.gazuntite.controls.calendar.vo.EventVO;
	
	import mx.collections.ArrayCollection;

	public class myGenrator
	{
		public function myGenrator()
		{
		}
		
		
		public var events:ArrayCollection = new ArrayCollection();
		public var calendars:ArrayCollection = new ArrayCollection();
		public var numberOfCalendars:int = 1;
		// TA - Calendar Events Color are associated with this calendar Colors
		public var colors:Array = [0x00D4FF,0xFF55FF,0xD4FF00,0x00FF00, 0xCCCCFF];
		
		
		public function generate():void 
		{
			for(var i:int=0; i<numberOfCalendars; i++) 
			{
				var calendar:Calendar = new Calendar();
				calendars.addItem(calendar);
				//calendar.color = colors[i];
				calendar.name = "Calendar " + i//generateName();
				generateEvents(events, calendar, new Date());
			}
		}
		
		private function generateEvents(events:ArrayCollection, calendar:Calendar, day:Date):void 
		{
			for(var i:int=0; i<5; i++) 
			{
				var col:ArrayCollection = getDummyDayEvents( new Date( 2011, 8, 28 + i ) );
				for(var j:int=0; j < col.length; j++) 
				{
					var eventVO:com.gazuntite.controls.calendar.vo.EventVO = col.getItemAt( j ) as EventVO;
					var event:CalendarEvent = new CalendarEvent();
					
					event.color = eventVO.eventColors[j];
				//	trace('Event Color ' + event.color);
					event.calendar = calendar;
					event.title = eventVO.Title;
					event.where = eventVO.Location;
					event.description = eventVO.Description;
					event.start = eventVO.StartDate;
					event.end = eventVO.EndDate;
					
					events.addItem(event);
				}
			}
		}
		
		private function getDummyDayEvents( day:Date ):ArrayCollection
		{
			var delta:int = 1; 
			var col:ArrayCollection = new ArrayCollection();
			//	trace( "day", day.toString(),"\n");
			/*for(var i:int=0; i<5; i++) 
			{
			var eventVO:EventVO = new EventVO();
			eventVO.StartDate 	= day;
			eventVO.EndDate		= day;
			eventVO.StartTime   = i + delta++ + ":00:00 GMT+0500"; 
			eventVO.EndTime     = i + ++delta + ":00:00 GMT+0500"; 
			
			//		trace( "start end", eventVO.StartTime, eventVO.EndTime, delta, "\n");
			
			eventVO.Title 		= 'Event ' + i;
			eventVO.Location 	= 'Islamabad Pakistan';
			eventVO.Description = 'This is an test event description by the Dr.ABC, and for this event we examine the patient medical histroy in detail';
			
			col.addItem( eventVO );
			}*/
			// Test for everlap two event for same day & same date and time;	
			for(var i:int=0; i<2; i++) 
			{
				var eventVO:EventVO = new EventVO();
				eventVO.StartDate 	= day;
				eventVO.EndDate		= day;
				eventVO.StartTime   = 2   + ":00:00 GMT+0500"; 
				eventVO.EndTime     = 4   + ":00:00 GMT+0500"; 
				
				//		trace( "start end", eventVO.StartTime, eventVO.EndTime, delta, "\n");
				
				eventVO.Title 		= 'Event ' + i;
				eventVO.Location 	= 'Islamabad Pakistan';
				eventVO.Description = 'This is an test event description by the Dr.ABC, and for this event we examine the patient medical histroy in detail';
				
				col.addItem( eventVO );
			}
			
			return col;
		}
	
	}
}