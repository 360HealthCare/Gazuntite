package com.gazuntite.common.view.events
{
	import flash.events.Event;

	public class StartChatWithProviderEvent extends Event
	{
		public static const SEND_CALL:String = 'SendCall';
			
		public var SessionStatusID:int;
		public var providerName:String;
		public var providerID:int;
		
		public function StartChatWithProviderEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable)
		}
	}
}