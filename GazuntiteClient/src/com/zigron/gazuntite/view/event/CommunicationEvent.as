package com.zigron.gazuntite.view.event
{
	import flash.events.Event;
	
	public class CommunicationEvent extends Event
	{
		public static const ClOSE_VIEW:String = "closeViewEvent";

		public function CommunicationEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}