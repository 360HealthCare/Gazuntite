package com.gazuntite.webRTC.webRTCcontroller
{
	import com.adobe.cairngorm.control.FrontController;
	import com.gazuntite.webRTC.command.GetIncomingVideoChatSessionCommand;
	import com.gazuntite.webRTC.command.GetOutgoingVideoChatSessionCommand;
	import com.gazuntite.webRTC.command.SendVideoCallToProviderCommand;
	import com.gazuntite.webRTC.command.VideoCallAcceptCommand;
	import com.gazuntite.webRTC.command.VideoCallNotificationCommand;
	import com.gazuntite.webRTC.command.VideoCallRejectCommand;

	public class WebRTCcontroller extends FrontController
	{
		private static var m_oControllerInstance:WebRTCcontroller;
		
		public static const GET_INCOMING_VIDEO_CHAT_SESSION	: String 							= "GET_INCOMING_VIDEO_CHAT_SESSION";
		public static const GET_OUTGOING_VIDEO_CHAT_SESSION	: String 							= "GET_OUTGOING_VIDEO_CHAT_SESSION";
		public static const REJECT_VIDEO_CALL_NOTIFICATION	: String 							= "REJECT_VIDEO_CALL_NOTIFICATION";
		public static const ACCEPT_VIDEO_CALL_NOTIFICATION	: String 							= "ACCEPT_VIDEO_CALL_NOTIFICATION";
		public static const SEND_VIDEO_CALL_TO_PROVIDER	: String 								= "SEND_VIDEO_CALL_TO_PROVIDER";
		public static const OUTGOING_VIDEO_CALL_NOTIFICATION	: String 						= "OUTGOING_VIDEO_CALL_NOTIFICATION";
		
		
		public static const RESPONDER_TIME_TEST	: String 										= "RESPONDER_TIME_TEST";
		
		public static function getInstance():WebRTCcontroller 
		{
			if ( m_oControllerInstance == null )
				m_oControllerInstance = new WebRTCcontroller( new Lock() );
			return m_oControllerInstance;
		}
		
		public function WebRTCcontroller(lock:Lock)
		{
			if(null == lock )
				throw("Singlton class 'GazuntiteClientController' is Locked, can't create instance of this class. Please use getInstance() method instead ... ")
			
			
			addCommand( GET_INCOMING_VIDEO_CHAT_SESSION,  GetIncomingVideoChatSessionCommand);
			addCommand( GET_OUTGOING_VIDEO_CHAT_SESSION,  GetOutgoingVideoChatSessionCommand);
			
			addCommand(REJECT_VIDEO_CALL_NOTIFICATION,VideoCallRejectCommand);
			addCommand(ACCEPT_VIDEO_CALL_NOTIFICATION,VideoCallAcceptCommand);
			addCommand(SEND_VIDEO_CALL_TO_PROVIDER, SendVideoCallToProviderCommand);
			addCommand(OUTGOING_VIDEO_CALL_NOTIFICATION,VideoCallNotificationCommand);
			
			
			//addCommand(RESPONDER_TIME_TEST,ResponderTimeTestCommand);
		}
	}
}
class Lock
{
	//Singlton Lock
}