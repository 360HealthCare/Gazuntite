package com.gazuntite.provider.services.email.view.event
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class ReplyEmailEvent extends Event
	{
		
		public static const REPLY_EMAIL_EVENT:String = "ReplyEmailEvent";
		public var emailID:int;
		public var userId:int;
		public   var subject:String;
		public  var message:String;
		public  var from:String;
		public  var sendto:String;
		public var attachment:ArrayCollection;
		
		public function ReplyEmailEvent(emailID:int,userId:int,message:String,from:String,sendto:String,subject:String,attachment:ArrayCollection)
		{
			super(REPLY_EMAIL_EVENT, true, false);
			this.emailID=emailID;
			this.userId = userId;
			this.message = message;
			this.from = from;
			this.sendto = sendto;
			this.subject = subject;
			this.attachment = attachment;
		}
	}
}