package com.gazuntite.controls.calendar.cal.view
{
	import com.gazuntite.controls.calendar.cal.event.AgendaEventRenderer;
	import com.gazuntite.controls.calendar.cal.event.CalendarEvent;
	
	import mx.collections.ArrayCollection;
	import mx.logging.ILogger;
	import mx.logging.Log;
	
	public class AgendaViewRenderer extends com.gazuntite.controls.calendar.cal.view.ViewRenderer
	{
		private static const log:ILogger = Log.getLogger("com.hevery.cal.view.AgendaViewRenderer");
		
		internal override function updateEventRenderer(event:com.gazuntite.controls.calendar.cal.event.CalendarEvent): void {
			event.rendererFactory = com.gazuntite.controls.calendar.cal.event.AgendaEventRenderer
		}
		
		override internal function measure():void {
			super.measure();
			var height:Number = 0;
			for each (var event:CalendarEvent in view.visibleEvents) {
				height += event.measuredHeight;
			}
			view.measuredHeight = height;
		}
		
		internal override function layoutEvents(events:ArrayCollection, width:Number, height:Number):void {
			log.info("layoutEvents()");
			var lastY:Number = 0;
			for each (var event:CalendarEvent in events) {
				event.x = 0;
				event.y = lastY;
				event.width = width;
				event.height = event.measuredHeight;
				lastY += event.height;
			}
		}
	}
}