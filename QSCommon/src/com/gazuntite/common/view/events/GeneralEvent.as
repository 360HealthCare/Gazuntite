package com.gazuntite.common.view.events
{
	import flash.events.Event;
	
	public class GeneralEvent extends Event
	{
		
		private var _value:Object;
		
		public function GeneralEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}

		public function get value():Object
		{
			return _value;
		}

		public function set value(value:Object):void
		{
			_value = value;
		}

	}
}