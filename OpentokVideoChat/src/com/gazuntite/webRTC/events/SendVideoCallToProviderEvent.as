package com.gazuntite.webRTC.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.webRTC.model.vo.VideoChatDTO;
	import com.gazuntite.webRTC.webRTCcontroller.WebRTCcontroller;

	public class SendVideoCallToProviderEvent extends CairngormEvent
	{
		public var videoChat:VideoChatDTO;
		public var callBack			: Function;
		
		public function SendVideoCallToProviderEvent(videoChat:VideoChatDTO, callBack:Function)
		{
			super(WebRTCcontroller.SEND_VIDEO_CALL_TO_PROVIDER);
			
			this.videoChat 	= videoChat;
			this.callBack = callBack
		}
	}
}