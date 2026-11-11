package com.gazuntite.webRTC.manager
{
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.webRTC.events.GetIncomingVideoChatSessionEvent;
	import com.gazuntite.webRTC.events.VideoCallAcceptCallEvent;
	import com.gazuntite.webRTC.events.VideoCallRejectEvent;
	import com.gazuntite.webRTC.model.WebRTCModel;
	import com.gazuntite.webRTC.util.WebRTCConstants;
	import com.gazuntite.webRTC.view.event.IncomingCallViewEvent;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.events.CloseEvent;
	
	public class OpenTokWebViewManager extends EventDispatcher
	{
		[Bindable] public var model : WebRTCModel = WebRTCModel.getInstance();
		
		[Bindable] public var VideoChat_URL:String = '';
		
		private var _isAvailable:Boolean = true;
		
		private const VIDEO_CHAT_SESSION_ID			:int = 0;
		private const VIDEO_CHAT_INITIATOR_ID		:int = 1;
		private const VIDEO_CHAT_ID					:int = 2;
		private const VIDEO_CHAT_TOKEN_ID			:int = 3;
		private const CALLER_NAME					:int = 4;
		
		public var CallName:String;
		private var userSessionInfo:Array;
		///// ///// Singlton impl. start ///// /////  
		
		private static var m_oInstance:OpenTokWebViewManager ;
		
		public function get isAvailable():Boolean
		{
			return _isAvailable;
		}

		public function set isAvailable(value:Boolean):void
		{
			_isAvailable = value;
			if(value)
				Init();
		}

		public static function getInstance():OpenTokWebViewManager 
		{
			if ( m_oInstance == null )
				m_oInstance = new OpenTokWebViewManager(new Lock());
			return m_oInstance;
		}
		
		public function OpenTokWebViewManager(lock:Lock)
		{
			if(null == lock )
				throw("Can't create object. please use getInstance() method instead ... ");
			
		}
		
		
		public function Init():void
		{
			trace("MainContainer: InitComponents");
			//Alert.show('Init Called from opentokwebViewManager', 'test alert' );
		//	var getSessionEvent:GetIncomingVideoChatSessionEvent = new GetIncomingVideoChatSessionEvent(model.loggedInUserId,model.loggedInUserSelectedBranchId,getVideoCallDetailsDetails);//model.userSelectedStationDTO.ClinicBranchID,
		//	CairngormEventDispatcher.getInstance().dispatchEvent(getSessionEvent);
			
		}
		
		public  function AcceptCall():void
		{
			VideoChat_URL = WebRTCConstants.VIDEO_CHAT_URL + "?ID="+userSessionInfo[VIDEO_CHAT_SESSION_ID]+"&tokenID="+userSessionInfo[VIDEO_CHAT_TOKEN_ID]+"&CallerName="+userSessionInfo[CALLER_NAME];
			
			
			var acceptCallEvent:VideoCallAcceptCallEvent = new VideoCallAcceptCallEvent(parseInt(userSessionInfo[VIDEO_CHAT_ID]));
			CairngormEventDispatcher.getInstance().dispatchEvent(acceptCallEvent);
			
			isAvailable = false;
		}
		
		public function SetCallInfo(OpenTokSessionID:String, OpenTokTokenID:String, CallInitiatorName:String, CallRecieverName:String ):void
		{
			VideoChat_URL = WebRTCConstants.VIDEO_CHAT_URL + "?ID="+ OpenTokSessionID +"&tokenID="+ OpenTokTokenID +"&CallerName="+ CallInitiatorName + "&RecName=" + CallRecieverName;
		}
		
		public  function RejectCall():void
		{
			var videoChatID:int;
			if(userSessionInfo.length > 0)
			{
				var videochatSessionID:String = userSessionInfo[VIDEO_CHAT_SESSION_ID];
				var videochatInitiatorID:String = userSessionInfo[VIDEO_CHAT_INITIATOR_ID];
				videoChatID = userSessionInfo[VIDEO_CHAT_ID];
				var videoChatTokenID:String = userSessionInfo[VIDEO_CHAT_TOKEN_ID];
			}
			var videoCallRejectEvent:VideoCallRejectEvent = new VideoCallRejectEvent(model.loggedInUserId,model.loggedInUserSelectedBranchId,videoChatID,getVideoCallDetailsDetails);
			CairngormEventDispatcher.getInstance().dispatchEvent(videoCallRejectEvent);
		}
		
		
		private function getVideoCallDetailsDetails(val:* = null):void
		{
			if(model.videoCallInfo != null && model.videoCallInfo != "" && model.videoCallInfo != "Call Dropped" && model.videoCallInfo != "Call Rejected")
			{
				
				userSessionInfo = model.videoCallInfo.split('^');
				
				model.CallerID = userSessionInfo[VIDEO_CHAT_INITIATOR_ID];
				model.CallerName = userSessionInfo[CALLER_NAME];
				
				dispatchEvent(new IncomingCallViewEvent(userSessionInfo[CALLER_NAME], model.isCallfromProvider)); // temp true, put the value from service.
				
				
			}
			else
			{
				if(model.loggedInUserId > 0 && this.isAvailable)
				{
					var getSessionEvent:GetIncomingVideoChatSessionEvent = new GetIncomingVideoChatSessionEvent(model.loggedInUserId,model.loggedInUserSelectedBranchId,getVideoCallDetailsDetails);//model.userSelectedStationDTO.ClinicBranchID,
					CairngormEventDispatcher.getInstance().dispatchEvent(getSessionEvent);
				}
			}
		}
	}
}
class Lock
{
	//Singlton Lock
}