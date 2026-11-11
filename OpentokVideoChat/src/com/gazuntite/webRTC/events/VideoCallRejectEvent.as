package com.gazuntite.webRTC.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.webRTC.webRTCcontroller.WebRTCcontroller;

	public class VideoCallRejectEvent extends CairngormEvent
	{
		
		public var userId : int;
		public var branchId : int;
		public var videoChatID:int;
		public var resultHandlerFunction:Function;
		
		public function VideoCallRejectEvent(userId : int,branchID:int,videoChatID:int,resultHandlerFunction:Function)
		{
			super(WebRTCcontroller.REJECT_VIDEO_CALL_NOTIFICATION);
			this.userId = userId;
			this.branchId = branchID;
			this.videoChatID = videoChatID;
			this.resultHandlerFunction = resultHandlerFunction;
		}
	
	}
}