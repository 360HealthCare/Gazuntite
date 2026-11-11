package com.zigron.gazuntite.view.event
{
	import flash.events.Event;

	public class LogoutViewEvent extends Event
	{
		
		public static const LOG_OUT:String = "logout";
		public var doApplicatiopClosed:Boolean;
		
		public function LogoutViewEvent(closeApplication:Boolean)
		{
			super(LOG_OUT, true, false);
			doApplicatiopClosed = closeApplication;
		}
	}
}