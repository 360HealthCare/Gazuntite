package com.gazuntite.webRTC.view.event
{
	import flash.events.Event;
	
	public class IncomingCallViewEvent extends Event
	{
		private const INCOMMING_CALL			:String = 'incommingCall';
		public var IsProviderCalling			:Boolean;
		public var callerName:String;
		
		public function IncomingCallViewEvent(callerName:String , isProvider:Boolean)
		{
			super(INCOMMING_CALL, true);
			this.IsProviderCalling = 	isProvider;
			this.callerName = 	callerName;
		}
	}
}