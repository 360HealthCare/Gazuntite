package com.zigron.gazuntite.view.event
{
	import flash.events.Event;

	public class RegisterProviderViewEvent extends Event
	{
		public static const REGISTER_PROVIDER:String = "RegisterProvider";
		
		public var success:Boolean = false;
		public var registeredProviderId:String = "";
		
		public function RegisterProviderViewEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(REGISTER_PROVIDER, bubbles, cancelable);
		}
		
		override public function clone():Event {
			return new  RegisterProviderViewEvent(REGISTER_PROVIDER);
		}
	}
}