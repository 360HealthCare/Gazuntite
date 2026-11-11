/*
*Class: DeleteEmailEvent
*Created by: zahid mehmood
*Description: 
*Copyright 2011 Zigron Inc. All right reserved
*/
package com.gazuntite.provider.services.email.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.services.email.appController.EmailController;
	
	public class DeleteEmailEvent extends CairngormEvent
	{
		
		public var emailIDs:String;
		public var userID:int;
		public var callBack			: Function;
		
		public function DeleteEmailEvent(emailIDs:String,userID:int,callBack:Function )
		{
			super(EmailController.DELETE_EMAIL_EVENT);
			this.emailIDs = emailIDs;
			this.userID = userID;
			this.callBack = callBack;
			
		}
	}
}