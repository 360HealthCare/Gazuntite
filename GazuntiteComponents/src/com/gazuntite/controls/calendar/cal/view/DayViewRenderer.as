package com.gazuntite.controls.calendar.cal.view
{
	import com.gazuntite.controls.calendar.cal.decoration.VerticalBackgroundRenderer;
	import com.gazuntite.controls.calendar.cal.event.BlockEventRenderer;
	import com.gazuntite.controls.calendar.cal.event.CalendarEvent;
	import com.gazuntite.controls.calendar.views.CalendarDescriptor;
	import com.gazuntite.controls.calendar.views.DateUtil;
	
	import flash.display.Graphics;
	
	import mx.collections.ArrayCollection;
	import mx.collections.Sort;
	import mx.collections.SortField;
	
	public class DayViewRenderer extends com.gazuntite.controls.calendar.cal.view.ViewRenderer
	{
		public var background:com.gazuntite.controls.calendar.cal.decoration.VerticalBackgroundRenderer = new VerticalBackgroundRenderer();
		
		internal override function updateEventRenderer(event:com.gazuntite.controls.calendar.cal.event.CalendarEvent): void 
		{
			event.rendererFactory = com.gazuntite.controls.calendar.cal.event.BlockEventRenderer
		}
		
		private function get pixelsPerMilisecond():Number 
		{
			return view.height / view.duration;
		}
		
		internal override function drawBackground(g:Graphics, width:Number, height:Number, verticalOffset:Number):void 
		{
			background.drawRuler(g, verticalOffset, view.duration * pixelsPerMilisecond, width, height);
		}
		
		internal override function layoutEvents(events:ArrayCollection, width:Number, height:Number):void 
		{
			events.sort = new Sort();
			events.sort.fields = [ new SortField("y") ];	
			events.refresh();
			var overlap:ArrayCollection = new ArrayCollection();
			
			var dayStart:Date = view.date;
			var calDesc:CalendarDescriptor = view.calendarDescriptor;
			
			for each (var event:CalendarEvent in events) 
			{
				var eventStart:Date = calDesc.getEventStart(event.eventData);
				var eventEnd:Date = calDesc.getEventEnd(event.eventData);
				event.x = 0;
				//TA - Check whether event start time less than end time
				var startBeforeEnd:Boolean = eventStart.time < eventEnd.time;
				
				if (startBeforeEnd) 
				{
					event.y = (eventStart.time - dayStart.time) * pixelsPerMilisecond;
					event.height = (eventEnd.time - eventStart.time) * pixelsPerMilisecond;
				} 
				else 
				{
					// wrap around
					if (eventStart.day == dayStart.day) 
					{
						// the start day
						event.y = (eventStart.time - dayStart.time) * pixelsPerMilisecond;
						event.height = (dayStart.time + DateUtil.DAY - eventStart.time) * pixelsPerMilisecond;
					} else 
					{
						// the wrapped day
						event.y = -60;			// position start out of range of mask to hide title/description
						event.height = (eventEnd.time - dayStart.time) * pixelsPerMilisecond + 60;
					}
				}
				event.width = width;
				updateEventRenderer(event);
				var currentY:int = event.y;
				
				// Remove non relevant items.
				var i:int = 0;
				while (i < overlap.length) 
				{
					var overlapEvent:CalendarEvent = overlap.getItemAt(i) as CalendarEvent;
					if (overlapEvent.y + overlapEvent.height <= currentY) 
					{
						overlap.removeItemAt(i);
					} 
					else 
					{
						i++;
					}
				}
				
				// find a location for the new item.
				var offset:int = 0;
				while(true) 
				{
					if (collides(overlap, offset))
					{
						//offset += 20;
						//TA - make two event in one Row
						offset = width/2;
						break;  //TA - No more than two Appoitment add with same date and Time
					}
					else
						break;
					
				}
				event.x = offset;
				overlap.addItem(event);
				
				// Set width depending on count in overlap
				i = 0;
				for each (var e:CalendarEvent in overlap) 
				{
					/*e.width = e.width - e.x
					- Math.min(10, e.width / overlap.length) * (overlap.length - i - 1)*/
					e.width = width/2;
					i++;
				} 
			}
		}
		
		private function collides(events:ArrayCollection, offset:int):Boolean 
		{
			for each (var event:CalendarEvent in events) 
			{
				if (event.x == offset) 
					return true;
			} 
			return false;
		}
	}
}