package com.gazuntite.controls.calendar.cal.event
{
	import com.gazuntite.controls.calendar.views.CalendarDescriptor;
	import com.gazuntite.controls.calendar.views.NullCalendarDescriptor;
	import com.gazuntite.controls.calendar.views.UIProperty;
	
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	import mx.core.ClassFactory;
	import mx.core.FlexSprite;
	import mx.core.IFactory;
	import mx.core.UIComponent;
	import mx.events.PropertyChangeEvent;
	import mx.formatters.DateFormatter;

	[Style(name="headerHeight", type="Number", inherit="no")]
	[Style(name="cornerRadius", type="Number", inherit="no")]
	[Style(name="borderThickness", type="Number", inherit="no")]
	
	public class CalendarEvent extends UIComponent
	{
		// TA - Make true on expand and false on collaps
		private var isExpand:Boolean = true;
		
		public function setProp(property:String, value:*):void 
		{
			this[property] = value; 
		}
		public function getProp(property:String):*
		{
			return this[property];
		}
		
		internal var titleField:TextField = new TextField();
		internal var textField:TextField = new TextField();
		protected var timeFormater:DateFormatter = new DateFormatter();
		
		private var _renderer:EventRenderer;
		private var _rendererFactory:IFactory;
		private var _rendererFactoryChanged:Boolean = false;
		public function get rendererFactory():* 
		{
			return _rendererFactory; 
		}
		public function set rendererFactory(value:*):void 
		{
			if (value is Class) 
				value = new ClassFactory(value as Class);
			if (!(value is IFactory))
				throw new Error("Expecting Class or IFactory");
			UIProperty.setValue(this, "rendererFactory", value);
			
			if ( rendererFactory != null) 
			{
				_renderer = rendererFactory.newInstance();
				_renderer.event = this;
			} else 
			{
				_renderer = null;
			}
		}
		
		private var _eventData:*;
		private var _eventDataChanged:Boolean = false;
		public function get eventData():* 
		{
			return _eventData; 
		}
		
		public function set eventData(value:*):void 
		{
			UIProperty.setValue(this, "eventData", value);
		}
		
		private function eventDataChange(event:PropertyChangeEvent):void 
		{
			_eventDataChanged = true; invalidateProperties();
		}
		
		private var _calendarDescriptor:CalendarDescriptor = new com.gazuntite.controls.calendar.views.NullCalendarDescriptor();
		private var _calendarDescriptorChanged:Boolean = false;
		
		public function get calendarDescriptor():CalendarDescriptor
		{
			return _calendarDescriptor; 
		}
		
		public function set calendarDescriptor(value:CalendarDescriptor):void 
		{
			UIProperty.setValue(this, "calendarDescriptor", value);
			
		}
		
		internal function get timeText():String 
		{
			var start:Date = _calendarDescriptor.getEventStart(_eventData);
			return timeFormater.format(start);			
		}
		
		public function get duration():int 
		{
			//TA - if _eventData is null then only draw view
			if( null == _eventData ) return 0;
			var start:Date = _calendarDescriptor.getEventStart(_eventData);
			var end:Date = _calendarDescriptor.getEventEnd(_eventData);
			var d:int;
			
			if (start != null && end != null) 
			{
				d = end.time - start.time;
				if (d >= 0) 
				{
					return d;
				} 
				else 
				{
					return d;
				}
			}
			return 0;
		}
		
		public function CalendarEvent()
		{
			super();
			styleName = "CalendarEvent";
			timeFormater.formatString = "LL:NN"
			rendererFactory = new ClassFactory(BlockEventRenderer);
		}
		
		protected override function commitProperties():void 
		{
			super.commitProperties();
			if (_rendererFactoryChanged) 
			{
				_rendererFactoryChanged = false;
				_eventDataChanged = true;
			}
			if (_calendarDescriptorChanged)
			{
				_calendarDescriptorChanged = false;
				_eventDataChanged = true;
			}
			//TA -  old. if (_eventDataChanged)
			if (_eventDataChanged && _eventData) 
			{
				_eventDataChanged = false;
				var titleText:String = timeText;
				titleField.text =  _calendarDescriptor.getEventTitle(_eventData);
				var str:String  = _calendarDescriptor.getEventDescription(_eventData);
				var arr:Array	= str.split('|', str.length);
				appointmentID	= arr[0];
				stationID		= arr[1];
				//Old immpl - 
				// textField.text  = arr[2];;
				
				textField.text  = _calendarDescriptor.getEventTitle(_eventData) + "\n"+ arr[2];
				//TA-for remove Bold text
				/*if (titleText.length>0)
				{
				titleField.setTextFormat(_renderer.timeFormat, 0, titleText.length);
				titleField.setTextFormat(_renderer.titleFormat, titleText.length, titleField.text.length);
				}*/
				textField.setTextFormat(_renderer.textFormat);							
				
				//toolTip = titleField.text + "\n" + textField.text;
				toolTip = titleField.text ;//+ "\n" + textField.text;
				invalidateDisplayList();
				invalidateSize();
			}
		}
		
		protected override function createChildren():void 
		{
			titleField.tabEnabled = true;
			textField.wordWrap = true;
			textField.autoSize = TextFieldAutoSize.LEFT;
			
			titleField.selectable = false;
			textField.selectable = false;					
			
			addChild(titleField);
			addChild(textField);
			
			mask = new FlexSprite();
			addChild(mask);
		
			addEventListener(MouseEvent.CONTEXT_MENU, openMenu);
			//this.focusEnabled = true;
		}
		
		
		protected override function updateDisplayList(width:Number, height:Number):void
		{
			super.updateDisplayList(width, height);
			var clip:FlexSprite = mask as FlexSprite;
			clip.graphics.clear();
			clip.graphics.beginFill(0xFF0000);
			clip.graphics.drawRect(0, 0, width, height);
			_renderer.updateDisplayList(graphics, width, height);
			_renderer.positionTextFields(width, height);
		}
		
		protected override function measure():void 
		{
			super.measure();
			_renderer.measure();
		}
		// TA - Event ViewCollpas and expand Height(Day, Week Views)
		private function expandCollapsHeader(e:MouseEvent):void
		{
			var clip:FlexSprite = mask as FlexSprite;
			if(isExpand)
			{
				clip.graphics.clear();
				clip.graphics.beginFill(0xFF0000);
				clip.graphics.drawRect(0, 0, width, 18);
				isExpand = false;
			}
			else
			{
				clip.graphics.clear();
				clip.graphics.beginFill(0xFF0000);
				clip.graphics.drawRect(0, 0, width, height);
				isExpand = true;
			}
		}
		// #################### Menu ###########################################################################
		[Bindable]	private var appointmentID:uint;
		[Bindable]	private var stationID:uint;
		private function openMenu(event:MouseEvent):void
		{
			dispatchEvent(new OpenAppointmentEvent('openMenus', appointmentID,stationID, titleField.text));
		}
		
	}
}