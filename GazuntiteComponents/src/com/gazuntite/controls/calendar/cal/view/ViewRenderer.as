package com.gazuntite.controls.calendar.cal.view
{
	import com.gazuntite.controls.calendar.cal.event.CalendarEvent;
	
	import flash.display.Graphics;
	
	import mx.collections.ArrayCollection;
	
	public class ViewRenderer
	{
		internal var view:CalendarView;
		
		internal function updateDisplayList(g:Graphics, width:Number, height:Number):void 
		{
			
		}
		
		internal function drawBackground(g:Graphics, width:Number, height:Number, verticalOffset:Number):void 
		{
			g.clear();
			g.beginFill(0xFFFFFF, 0.4);
			g.drawRect(0, 0, width, height);
		}
		
		internal function updateEventRenderer(event:com.gazuntite.controls.calendar.cal.event.CalendarEvent): void 
		{
		}
		
		internal function layoutEvents(events:ArrayCollection, width:Number, height:Number):void 
		{
		}
		
		internal function measure():void 
		{
		}
		
		internal function setActualSize(w:Number, h:Number):void 
		{
		}
	}
}