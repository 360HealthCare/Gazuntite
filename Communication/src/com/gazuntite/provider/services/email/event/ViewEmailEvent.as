/*
*Class: ViewEmailEvent
*Created by: zahid mehmood
*Description: 
*Copyright 2011 Zigron Inc. All right reserved
*/
package com.gazuntite.provider.services.email.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.services.email.appController.EmailController;
	public class ViewEmailEvent extends CairngormEvent
	{
		public var emailID:int;
		public var userId:int;
		public var clinicBranchid:int;
		public var stationId:int;
		public var isInbox:Boolean;
		public var callBack			: Function;
		
		public function ViewEmailEvent(emailID:int,userId:int,clinicBranchId:int,stationId:int,isInbox:Boolean,callBack:Function)
		{
			super(EmailController.GET_EMAIL_DETAILS_EVENT);
			this.emailID=emailID;
			this.userId = userId;
			this.clinicBranchid = clinicBranchId;
			this.stationId = stationId;
			this.isInbox = isInbox;
			this.callBack = callBack;
		}
	}
}