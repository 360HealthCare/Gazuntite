package com.gazuntite.provider.search.services.provider.view.event
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
		
		
		/*public static const EMAIL_OPTION_CHANGE:String="emailOptionChange";
		
		public var content:*;
		
		public function EmailOptionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}*/
	}
}