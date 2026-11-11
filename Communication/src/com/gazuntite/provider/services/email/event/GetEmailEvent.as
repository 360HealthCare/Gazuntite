/*
*Class: GetEmailEvent
*Created by: zahid mehmood
*Description: 
*Copyright 2011 Zigron Inc. All right reserved
*/
package com.gazuntite.provider.services.email.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.services.email.appController.EmailController;
	public class GetEmailEvent extends CairngormEvent
	{
		public var userId:int;
		public var clinicBranchid:int;
		public var stationId:int;
		public var totalPages:int;
		public var currentPage:int;
		public var isInbox:Boolean;
		
		public var callBack			: Function;
		
		public function GetEmailEvent(userId:int,clinicBranchid:int,stationId:int,totalPages:int,currentPage:int,isInbox:Boolean,callBack:Function )
		{
			super(EmailController.GET_EMAIL_LIST_EVENT);
			this.userId = userId;
			this.clinicBranchid = clinicBranchid;
			this.stationId = stationId;
			this.totalPages=totalPages;
			this.currentPage=currentPage;
			this.isInbox = isInbox;
			this.callBack = callBack;
		}
		
	}
}