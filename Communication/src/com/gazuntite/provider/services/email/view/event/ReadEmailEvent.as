package com.gazuntite.provider.services.email.view.event
{
	import flash.events.Event;

	public class ReadEmailEvent extends Event
	{
		public static const LOAD_EMAIL_EVENT:String = "LoadEmailEvent";
		public var emailID:int;
		public var userId:int;
		public var isInbox:Boolean;
		public function ReadEmailEvent(emailID:int,isInbox:Boolean,userId:int)
		{
			super(LOAD_EMAIL_EVENT, true, false);
			this.emailID=emailID;
			this.userId = userId;
			this.isInbox = isInbox;
		}
	}
}