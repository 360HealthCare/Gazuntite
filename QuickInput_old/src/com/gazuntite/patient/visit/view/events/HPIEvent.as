package com.gazuntite.patient.visit.view.events
{
	import flash.events.Event;
	
	public class HPIEvent extends Event
	{
		public static const LIST_EDIT_END:String = "listEditEnd";
		public static const LIST_SINGLE_ITEM_EDIT_END:String = "listSingleItemEditEnd";
		
		public var isEditedValueValid:Boolean;
		public var data:Object;
		
		public function HPIEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			var hpiEvent:HPIEvent = new HPIEvent(type, bubbles, cancelable);
			hpiEvent.isEditedValueValid = isEditedValueValid;
			hpiEvent.data = data;
			
			return hpiEvent;
		}
	}
}