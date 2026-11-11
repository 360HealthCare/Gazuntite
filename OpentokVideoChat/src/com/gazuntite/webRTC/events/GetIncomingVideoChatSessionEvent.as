package com.gazuntite.webRTC.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.webRTC.webRTCcontroller.WebRTCcontroller;

	public class GetIncomingVideoChatSessionEvent extends CairngormEvent
	{
		
		public var userId : int;
		public var branchId : int;
		public var resultHandlerFunction:Function;
		
		public function GetIncomingVideoChatSessionEvent(userId : int,branchID:int,resultHandlerFunction:Function)
		{
			super(WebRTCcontroller.GET_INCOMING_VIDEO_CHAT_SESSION);
			this.userId = userId;
			this.branchId = branchID;
			this.resultHandlerFunction = resultHandlerFunction;
		}
	}
}