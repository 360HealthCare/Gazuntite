package com.gazuntite.video.chat.manager
{
	import com.gazuntite.utils.UtilityFunctions;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import labs.otuome.p2p.VideoChat;
	import labs.otuome.p2p.events.VideoChatEvent;
	
	import mx.binding.utils.BindingUtils;
	import mx.core.UIComponent;

	public class VideoChatManager extends EventDispatcher
	{
		public static const LOBBY:String 	= "Lobby";
		public static const CHAT:String 	= "Chat";
		public static const DEBUG:String 	= "Debug";
		
		private var _client:IVideoChatClient;
		private var _sender:Object;
		private var _recipient:Object;
		private var _videoChat:VideoChat;
		private var _lastState:String;
		private var preferredCamera:String   = "0";

		private var callLaterPool:Array = new Array();

		private var lastAction:String;

		public function get sender():Object
		{
			return _sender;
		}

		public function set sender(value:Object):void
		{
			_sender = value;
		}
		
		public function get recipient():Object
		{
			return _recipient;
		}
		
		public function set recipient(value:Object):void
		{
			_recipient = value;
		}

		public function get client():IVideoChatClient
		{
			return _client;
		}

		public function set client(value:IVideoChatClient):void
		{
			_client = value;
		}

		public function get videoChat():VideoChat
		{
			return _videoChat;
		}

		public function set videoChat(value:VideoChat):void
		{
			_videoChat = value;
		}

		public function get lastState():String
		{
			return _lastState;
		}

		public function set lastState(value:String):void
		{
			_lastState = value;
		}

		public function get chatGroupName():String
		{
			return videoChat.groupname;
		}

		public function set chatGroupName(value:String):void
		{
			videoChat.groupname = value;
		}

		public function get debugLog():String
		{
			return videoChat.debugLog;
		}

		public function get username():String
		{
			return videoChat.username;
		}
		
		
		///// ///// Singlton impl. start ///// /////  
		
		private static var m_oInstance:VideoChatManager ;
		
		public static function getInstance():VideoChatManager 
		{
			if ( m_oInstance == null )
				m_oInstance = new VideoChatManager(new Lock());
			return m_oInstance;
		}
		
		public function VideoChatManager(lock:Lock)
		{
			if(null == lock )
				throw("Can't create object. please use getInstance() method instead ... ");
			
			initVideoChat();
			
		}
		
		private function initVideoChat():void
		{
			videoChat = new VideoChat();
			preferredCamera = "0";
			
			videoChat.addEventListener( VideoChatEvent.CAMERA_ACTIVATED, onCameraActivated );
			videoChat.addEventListener( VideoChatEvent.CAMERA_DEACTIVATED, onCameraDeactivated );
			videoChat.addEventListener( VideoChatEvent.INVITATION_RECEIVED, onInvitationReceived );
			videoChat.addEventListener( VideoChatEvent.INVITATION_DECLINED, onInvitationDeclined );
			videoChat.addEventListener( VideoChatEvent.USER_UNAVAILABLE, onUserUnavailable );
			videoChat.addEventListener( VideoChatEvent.START_CHAT, onChatStart );
			videoChat.addEventListener( VideoChatEvent.END_CHAT, onChatEnded );
			
			
			videoChat.checkDeviceCapabilities();
			videoChat.log( "ZigChat v1.0 \n" );
		}
		
		///// ///// Singlton impl. End ///// ///// 
		
		public function BindView(client:IVideoChatClient, outgoingPreview:UIComponent, incomingPreview:UIComponent ):void
		{
			this.client = client;
			
			videoChat.outgoingDisplay = outgoingPreview;
			videoChat.incomingDisplay = incomingPreview;
			
			BindingUtils.bindProperty( client, "neighborhood", videoChat, "neighbors" );
			
			//videoChat.activateCamera(  preferredCamera );
			
			loadCallbackHooks();
		}
		
		private function loadCallbackHooks():void
		{
			if( callLaterPool && callLaterPool.length )
			{
				while( callLaterPool.length )
				{
					var hook:CallbackHook = callLaterPool.pop() as CallbackHook;
					hook.call();
				}
			}
			else
			{
				trace("no hooks defined");
			}
			
			if( lastAction == VideoChatEvent.INVITE && null != client )
				client.showCallingPopup();
		}
		
		public function stopChatting():void
		{
			videoChat.stopChatting();
			dispatchEvent( new Event("stopChatting", true) );
		}
		
		public function launch( sender:Object ):void
		{
			videoChat.launch( sender );
			
			if (videoChat.outgoingDisplay.numChildren == 0)
			{
				videoChat.activateCamera(  preferredCamera );
			}
		}
		
		public function sendChatNotification( type:String, recipient:Object ):void
		{
			this.lastAction = type;
			this.recipient = recipient;
			switch(type)
			{
				case VideoChatEvent.INVITE:
					if( null != client ) client.showCallingPopup();
					break;
				case VideoChatEvent.END_CHAT:
					this.recipient = null;
					break;
			}
			
			videoChat.sendChatNotification( type,	recipient );
		}
		
		public function login( userName:String ):void
		{
			videoChat.login( userName );
		}
		
		public function logoff():void
		{
			videoChat.logoff();
		}
		
		//local Event handlers
		protected function onCameraActivated(event:VideoChatEvent):void
		{
			videoChat.log( "Camera Activated\n" );
			client.onCameraActivated(event);
		}
		
		protected function onCameraDeactivated(event:VideoChatEvent):void
		{
			videoChat.log( "Camera Deactivated\n" );
			client.onCameraDeactivated(event);
		}
		
		
		protected function onInvitationReceived(event:VideoChatEvent):void
		{
			sender = event.sender;
			
			UtilityFunctions.AskMessage( sender.name + " has invited you to chat, do you want to connect?", onAcceptInvitation, null, onDeclineInvitation );
			
			videoChat.log( "Invitation Received from " + event.sender.name + "\n" );
			//client.onInvitationReceived(event);
		}
		
		protected function onInvitationDeclined(event:VideoChatEvent):void
		{
			videoChat.log( "Invitation Declined by " + event.sender.name + "\n" );
			UtilityFunctions.ShowMessage( event.sender.name + " declined your invitation", "invitation declined" );
			client.onInvitationDeclined(event);
		}
		
		
		protected function onUserUnavailable(event:VideoChatEvent ):void
		{
			videoChat.log( "The User is unavailable, may be already in a chat.\n" );
			UtilityFunctions.ShowMessage( "That user is already in a chat.", "user busy" );
			if( client )
				client.onUserUnavailable(event);
		}
		
		
		protected function onChatStart(event:VideoChatEvent):void
		{
			videoChat.log( "Chat Started\n" );
			client.onChatStart(event);
			
			videoChat.activateCamera(  preferredCamera );
		}
		
		protected function onChatEnded(event:VideoChatEvent):void
		{
			videoChat.log( "Chat Ended\n" );
			client.onChatEnded(event);
		}
		
		
		public function onAcceptInvitation():void
		{
			sendChatNotification( VideoChatEvent.INVITATION_ACCEPTED, this.sender );
			
			if( null == client )
			{
				callLaterPool.push( new CallbackHook( launch, sender ) );
				
				dispatchEvent( new Event("hookVideoUI", true ) );
			}
			else
			{
				this.launch( this.sender );
				dispatchEvent( new Event("startChatting", true) );
			}
		}
		
		public function onDeclineInvitation():void
		{
			this.sendChatNotification( VideoChatEvent.INVITATION_DECLINED, this.sender );
		}
		
	}
}

class CallbackHook
{
	private var callback:Function;
	private var param:Object = null;
	public function CallbackHook(callback:Function, param:Object)
	{
		this.callback = callback;
		this.param    = param;
	}
	
	public function call():void
	{
		if (param)
			callback.call(null, param );
		else
			callback.call(null);
	}
}

class Lock
{
	//Singlton Lock
}