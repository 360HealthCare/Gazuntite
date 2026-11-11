package com.gazuntite.webRTC.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.webRTC.webRTCcontroller.WebRTCcontroller;

	public class VideoCallNotificationEvent extends CairngormEvent
	{
		public static const ACCEPT_VIDEO_CALL_EVENT:String = "VideoCallNotificationEvent";
		public var videoChatID 	: int;
		public var callBack			: Function;
		
		public function VideoCallNotificationEvent(videoChatID:int,callback:Function)
		{
			super(WebRTCcontroller.OUTGOING_VIDEO_CALL_NOTIFICATION);
			this.videoChatID = videoChatID;
			this.callBack 		= callback;
		}
	
	}
}