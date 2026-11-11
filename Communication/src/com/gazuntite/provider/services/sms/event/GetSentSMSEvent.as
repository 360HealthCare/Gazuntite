package com.gazuntite.provider.services.sms.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.services.sms.appController.SMSController;
	

	public class GetSentSMSEvent extends CairngormEvent
	{
		public var clinicBranchID:int;
		public var userID:int;
		public var currentPage:int;
		public var  callBack:Function;
		public function GetSentSMSEvent(clinicBranchID:int,userID:int,currentPage:int,callback:Function)
		{
			super(SMSController.GET_SENT_SMS_EVENT);
			this.clinicBranchID = clinicBranchID;
			this.userID = userID;
			this.currentPage = currentPage;
			this.callBack = callback;
		}
		
		
	}
}