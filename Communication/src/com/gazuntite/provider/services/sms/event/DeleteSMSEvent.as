package com.gazuntite.provider.services.sms.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.services.sms.appController.SMSController;
	
	public class DeleteSMSEvent extends CairngormEvent
	{
		public var smsIDs:String;
		public var userID:int;
		public var callBack			: Function;
		
		public function DeleteSMSEvent(smsIDs:String,userID:int,callBack:Function )
		{
			super(SMSController.DELETE_SENT_SMS_EVENT);
			this.smsIDs = smsIDs;
			this.userID = userID;
			this.callBack = callBack;
			
		}
	}
}