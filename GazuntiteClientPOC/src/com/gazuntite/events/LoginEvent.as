package com.gazuntite.events
{
	import flash.events.Event;
	
	import mx.utils.ObjectProxy;
	
	public class LoginEvent extends Event
	{
		public static const LOGIN:String = "login";
		
		public var success:Boolean = false;
		
		public function LoginEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(LOGIN, bubbles, cancelable);
		}
		
		override public function clone():Event {
			return new  LoginEvent(LOGIN);
		}
	}
}