package com.gazuntite.controls.calendar.views
{	
	import com.gazuntite.controls.calendar.cal.decoration.VerticalTimeRuler;
	import com.gazuntite.controls.calendar.cal.event.CalendarEvent;
	import com.gazuntite.controls.calendar.cal.event.OpenAppointmentEvent;
	import com.gazuntite.controls.calendar.cal.view.CalendarView;
	
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import mx.collections.ArrayCollection;
	import mx.containers.HBox;
	import mx.controls.VScrollBar;
	import mx.formatters.DateFormatter;

	public class WeekView extends HBox
	{
		
		protected var rulerChrome:DayChrome = new DayChrome();
		protected var ruler:com.gazuntite.controls.calendar.cal.decoration.VerticalTimeRuler = new VerticalTimeRuler();
		protected var scrollBar:VScrollBar = new VScrollBar();
		protected var chromes:ArrayCollection = new ArrayCollection();
		protected var views:ArrayCollection = new ArrayCollection();
		
		public var dateFormatter:DateFormatter = new DateFormatter();
		
		public var hourHeight:Number = 50;
		
		private var _use24HourClock:Boolean = false;
		private var _IsWorkWeek:Boolean 	= false;
		private var _numDaysOfWeeks:int 	= 7;
		
		//TA - For Date label in calendar
		[Bindable]
		public var stratDate:String;
		public var endDate:String;
		
		public function get IsWorkWeek():Boolean
		{
			return _IsWorkWeek;
		}

		public function set IsWorkWeek(value:Boolean):void
		{
			_IsWorkWeek 	= value;
			_numDaysOfWeeks = value ? 5:7 ;
		}

		public function get use24HourClock():Boolean 
		{
			return _use24HourClock; 
		}
		
		public function set use24HourClock(u24:Boolean):void 
		{
			_use24HourClock = u24;
			ruler = new VerticalTimeRuler(_use24HourClock);
			ruler.pixelsPerMilisecond = hourHeight / DateUtil.HOUR;			
			invalidateDisplayList();
		}
		
		private var _calendarEventClass:Class = CalendarEvent;
		
		public function get calendarEventClass():Class 
		{
			return _calendarEventClass;
		}
		
		public function set calendarEventClass(cev:Class):void 
		{
			_calendarEventClass = cev;
			for each (var view:CalendarView in views) 
			{
				view.calendarEventClass = _calendarEventClass;
			}
		}

		public function set calendarDescriptor(calendarDescriptor:CalendarDescriptor):void 
		{
			for each (var view:CalendarView in views)
				view.calendarDescriptor = calendarDescriptor;
		}
		
		public function set events(events:ArrayCollection):void 
		{
			for each (var view:CalendarView in views)
				view.events = events;
		}
		
		public function addEvent(event:*):void 
		{
			for each (var view:CalendarView in views) 
			{
				view.addEvent(event);
			}
		}
		
		public function removeEvent(event:*):void 
		{
			for each (var view:CalendarView in views) 
			{
				view.removeEvent(event);
			}
		}
		
		public function set calendars(calendars:ArrayCollection):void 
		{
			for each (var view:CalendarView in views)
				view.calendars = calendars;
		}
		
		public function set date(date:Date):void 
		{
			date = DateUtil.trimToWeek(date);
			for (var i:int = 0; i < _numDaysOfWeeks ; i++) 
			{
				if(i== 0)
					stratDate = dateFormatter.format(date);
				if(i == _numDaysOfWeeks -1)
					endDate = dateFormatter.format(date);
				
				var chrome:DayChrome = chromes.getItemAt(i) as DayChrome;
				var view:CalendarView = views.getItemAt(i) as CalendarView;
				chrome.title = dateFormatter.format(date);
				view.date = date;
				
				date = new Date(date.time + DateUtil.DAY);
			}
		}
		
		public function WeekView(hrHeight:Number=50) 
		{
			hourHeight = hrHeight;
			ruler.pixelsPerMilisecond = hourHeight / DateUtil.HOUR;
			for (var i:int = 0; i < _numDaysOfWeeks ; i++) 
			{
				views.addItem(new CalendarView());
				chromes.addItem(new DayChrome());
			}
			//dateFormatter.formatString = "EEEE MMM D";
			dateFormatter.formatString = "EEE DD-MM-YY";
		}
		
		override protected function createChildren():void 
		{
			super.createChildren();
			
			rulerChrome.title = "";
			rulerChrome.percentHeight = 100;
			rulerChrome.width = 52;
			rulerChrome.verticalScrollBar = scrollBar;
			rulerChrome.addChild(ruler);
			
			rulerChrome.setStyle("backgroundAlpha", 0.2);
			
			
			
			
			addChild(rulerChrome);

			ruler.height = 24 * hourHeight;
			
			//label = "Week";
			setStyle("horizontalGap", 0);
			
			scrollBar.percentHeight = 100;
			scrollBar.styleName = "VScrollBar"; 
			
			for (var i:int = 0; i < _numDaysOfWeeks ; i++) 
			{
				var chrome:DayChrome = chromes.getItemAt(i) as DayChrome;
				chrome.percentHeight = 100;
				chrome.percentWidth = 100;
				chrome.verticalScrollBar = scrollBar;
				
				//chrome.setStyle("backgroundAlpha", 0.2);
				
				
				var view:CalendarView = views.getItemAt(i) as CalendarView;
				view.height = 24 * hourHeight;
				view.percentWidth = 100;							
				
				
				chrome.addChild(view);
				addChild(chrome);
			}
			addChild(scrollBar);
//			date = new Date();
			this.addEventListener(MouseEvent.CONTEXT_MENU, openMenu);
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void 
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			updateScrollSize();
		}
		
		private function updateScrollSize():void 
		{
			var viewHeight:Number = chromes.getItemAt(0).viewHeight;
			var actualHeight:Number = 24 * hourHeight;
			if (actualHeight > viewHeight) 
			{
				scrollBar.visible = true;
				scrollBar.setScrollProperties(viewHeight, 0, actualHeight - viewHeight, viewHeight);
			} 
			else 
			{
				scrollBar.visible = false;
			}
		}
// #################### Menu ###########################################################################
		private function openMenu(event:MouseEvent):void
		{
			if( event.target is TextField )
			{
				return;
			}
			dispatchEvent(new OpenAppointmentEvent('newAppointmentMenus', 0, 0, ''));
			
			trace( "newAppointmentMenus >>>>>>>>>>>>>>>>>>>>>>>>>>>" );
		}
		
	}
}