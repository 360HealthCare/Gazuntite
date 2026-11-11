package com.gazuntite.common.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.appController.QSCommonController;

	public class VerifyUserEmailEvent extends CairngormEvent
	{
		public var email		:String;
		public var callBack		:Function;
		public var isUserName	:Boolean;
		
		public function VerifyUserEmailEvent(email:String, callBack:Function, isUserName:Boolean = false )
		{
			super(QSCommonController.VERIFY_USER_EMAIL_EVENT);
			
			this.email 		= email;
			this.callBack 	= callBack;
			this.isUserName = isUserName;
		}
	}
}