package com.gazuntite.events
{
	import flash.events.Event;
	
	import mx.utils.ObjectProxy;
	
	public class SaveFormDataEvent extends Event
	{
		public static const SAVE_FORM_DATA:String = "saveFormData";
		
		public var payload:Object = null; // this will change to whatever strong type is required
		public var isUpdate:Boolean = false;
		
		public function SaveFormDataEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(SAVE_FORM_DATA, bubbles, cancelable);
		}
		
		override public function clone():Event {
			return new  SaveFormDataEvent(SAVE_FORM_DATA);
		}
	}
}