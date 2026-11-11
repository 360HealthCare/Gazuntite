package com.gazuntite.video.chat.manager
{
	import labs.otuome.p2p.events.VideoChatEvent;
	
	import mx.collections.ArrayCollection;

	public interface IVideoChatClient
	{
		function onCameraActivated(event:VideoChatEvent):void;
		function onCameraDeactivated(event:VideoChatEvent):void;
		
		function onInvitationReceived(event:VideoChatEvent):void;
		function onInvitationDeclined(event:VideoChatEvent):void;
		
		function onUserUnavailable(event:VideoChatEvent ):void;
		
		function onChatStart(event:VideoChatEvent):void;
		function onChatEnded(event:VideoChatEvent):void;
		
		function get neighborhood():ArrayCollection;
		function set neighborhood(value:ArrayCollection):void;

		function showCallingPopup():void;
		function removeCallingPopup():void
	}
}