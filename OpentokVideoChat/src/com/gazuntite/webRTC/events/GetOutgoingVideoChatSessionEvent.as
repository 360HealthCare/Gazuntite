package com.gazuntite.webRTC.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.webRTC.webRTCcontroller.WebRTCcontroller;

	public class GetOutgoingVideoChatSessionEvent extends CairngormEvent
	{
		
			public var userId : int;
			public var branchId : int;
			public var resultHandlerFunction:Function;
			
			public function GetOutgoingVideoChatSessionEvent(userId : int,resultHandlerFunction:Function)
			{
				super(WebRTCcontroller.GET_INCOMING_VIDEO_CHAT_SESSION);
				this.userId = userId;
				this.resultHandlerFunction = resultHandlerFunction;
			}
	}
}