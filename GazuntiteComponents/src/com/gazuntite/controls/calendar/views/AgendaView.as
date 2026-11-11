package com.gazuntite.controls.calendar.views
{
	import com.gazuntite.controls.calendar.cal.decoration.VerticalTimeRuler;
	import com.gazuntite.controls.calendar.cal.view.AgendaViewRenderer;
	import com.gazuntite.controls.calendar.cal.view.CalendarView;
	
	import mx.collections.ArrayCollection;
	import mx.containers.HBox;

	public class AgendaView extends HBox
	{
		
		private var ruler:com.gazuntite.controls.calendar.cal.decoration.VerticalTimeRuler = new VerticalTimeRuler();
		private var view:com.gazuntite.controls.calendar.cal.view.CalendarView = new CalendarView();

		public function set calendarDescriptor(calendarDescriptor:CalendarDescriptor):void {
			view.calendarDescriptor = calendarDescriptor;
		}
		
		public function set events(events:ArrayCollection):void {
			view.events = events;
		}
		
		public function set calendars(calendars:ArrayCollection):void {
			view.calendars = calendars;
		}
		
		override protected function createChildren():void {
			super.createChildren();
			
			label = "Agenda";
			setStyle("horizontalGap", 0);
			
			setStyle("backgroundAlpha", 0);
			
			view.percentWidth = 100;
			view.percentHeight = 100;
			view.rendererFactory = AgendaViewRenderer;
			
			addChild(view);
		}
	}
}