package com.zigron.gazuntite.view.event
{
	import flash.events.Event;
	
	import mx.utils.ObjectProxy;
	
	public class LoginViewEvent extends Event
	{
		public static const LOGIN:String = "login";
		
		public var success:Boolean = false;
		
		public function LoginViewEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(LOGIN, bubbles, cancelable);
		}
		
		override public function clone():Event {
			return new  LoginViewEvent(LOGIN);
		}
	}
}