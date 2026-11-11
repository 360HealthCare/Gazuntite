package com.gazuntite.webRTC.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.webRTC.webRTCcontroller.WebRTCcontroller;
	
	import flash.events.Event;

	public class VideoCallAcceptCallEvent extends CairngormEvent
	{
		public static const ACCEPT_VIDEO_CALL_EVENT:String = "AcceptVideoCallEvent";
		public var videoChatID 	: int;
		/*public var callBack			: Function;*/
		
		public function VideoCallAcceptCallEvent(videoChatID:int)
		{
			super(WebRTCcontroller.ACCEPT_VIDEO_CALL_NOTIFICATION);
			this.videoChatID = videoChatID;
		}
		
	
	}
}