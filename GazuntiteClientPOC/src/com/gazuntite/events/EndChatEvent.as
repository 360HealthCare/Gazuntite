package com.gazuntite.events
{
	import flash.events.Event;
	
	public class EndChatEvent extends Event
	{
		public static const END_CHAT_EVENT:String = "endChatEvent";
		
		
		public function EndChatEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(END_CHAT_EVENT, bubbles, cancelable);
		}
		
		override public function clone():Event {
			return new  EndChatEvent(END_CHAT_EVENT);
		}
	}
}