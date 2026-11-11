/**
 *  Latest information on this project can be found at http://labs.otuome.com/
 * 
 *  Copyright (c) 2008 - 2011 Otuome Labs, LLC. All Rights Reserved.
 * 
 *  ANY ACCESS AND/OR MODIFICATION TO THIS SOFTWARE BY ANYONE OTHER THAN THE
 *  AUTHOR IS EXPRESSLY PROHIBITED AND IS UNDER DIRECT VIOLATION OF THE INCLUDED LICENSE   
 *  LICENSE AGREEMENT FOUND HERE: /legal/License.txt.  
 * -------------------------------------------------------------------------------------------
 **/
package labs.otuome.p2p
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.events.NetStatusEvent;
	import flash.media.Camera;
	import flash.media.Microphone;
	import flash.media.SoundCodec;
	import flash.media.Video;
	import flash.net.GroupSpecifier;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.utils.Timer;
	
	import labs.otuome.net.NetStatusCode;
	import labs.otuome.p2p.events.NeighborListStatusEvent;
	import labs.otuome.p2p.events.VideoChatEvent;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IViewCursor;
	import mx.core.UIComponent;
	import mx.events.FlexEvent;
	import mx.logging.ILogger;
	import mx.logging.Log;
	
	/**
	 * Handles basic P2P video functionality.
	 * @author Hasan Otuome
	 */
	public class VideoChat extends EventDispatcher
	{
		///////////////////////////////////////////////////////////////////////////////////////////////
		// PRIVATE PROPERTIES
		///////////////////////////////////////////////////////////////////////////////////////////////
		private var logger : ILogger = Log.getLogger("VideoChat");
		
		private const SERVER:String = "rtmfp://Quivus.com/multicast/maxmobvidchat";//"rtmfp://192.168.0.140/multicast/maxmobvidchat";
		
		private var netConnection:NetConnection;
		private var netGroup:NeighborList;
		private var inboundStream:NetStream;
		private var outboundStream:NetStream;
		private var groupSpec:GroupSpecifier;
		
		[Bindable] private var connected:Boolean = false;
		[Bindable] private var joinedGroup:Boolean = false;
		
		[Bindable] private var numCams:int;
		[Bindable] private var outgoingVideo:Video;
		[Bindable] private var incomingVideo:Video;
		
		private var camera:Camera;
		private var cameras:Array;
		
		private var selectedNeighbors:Array;
		
		protected var activeCamera:String = "0";
		
		private var microphone:Microphone;
		
		private var isFrontCameraActive:Boolean;
		
		[Bindable]
		public var isAvailable:Boolean = true;
		
		private var logRefreshTimer:Timer;
		
		private var chatSequence:uint = 0;
		
		private var padding:uint = 5;
		
		private var currentPeer:Object;
		
		/*private const VIDEO_WIDTH:Number	= 320;
		private const VIDEO_HEIGHT:Number	= 240;*/
		///////////////////////////////////////////////////////////////////////////////////////////////
		// PUBLIC PROPERTIES
		///////////////////////////////////////////////////////////////////////////////////////////////
		
		public var username:String;
		public var groupname:String 		= "Gazuntite_Providers_Group";
		
		public var debugLog:String			= "Debug Log\n";
		public var outgoingDisplay:UIComponent;
		public var incomingDisplay:UIComponent;
		
		[Bindable] public var neighbors:ArrayCollection;
		///////////////////////////////////////////////////////////////////////////////////////////////
		// PUBLIC METHODS
		///////////////////////////////////////////////////////////////////////////////////////////////
		public function VideoChat(){}
		
		public function checkDeviceCapabilities():void
		{
			/*
			On Android, only one camera is supported, even 
			if the device has more than one camera devices. 
			The name of the camera is always, "Default."
			
			AIR 3.0 will support accessing of front camera 
			on Android. It now have all the functionalities 
			which the back camera have and will support all 
			the flash.media.camera APIs. Couple of important 
			things to note here are:
			- Front camera would work on the android devices 
			which have firmware version 2.3 or above(>= [GingerBread] ) 
			and the hardware support for the front camera.
			- The front camera recording/preview will be un-mirrored 
			on android unlike the mirrored for the iOS.
			*/
			if (Camera.isSupported)
			{
				cameras = Camera.names;
				numCams = cameras.length;
			}
			else
			{
				// notify user that they can't use video chat!!!
			}
		}
		
		public function login( user:String ):void
		{
			log( "Connecting to \"" + SERVER + "\" ...\n" );
			
			username = user;
			
			netConnection = new NetConnection();
			netConnection.addEventListener( NetStatusEvent.NET_STATUS, onNetStatusEvent );
			netConnection.connect( SERVER );
		}
		
		public function logoff():void
		{
			deactivateCamera();
			onDisconnection()
		}
		
		public function log( message:String ):void
		{
			logger.debug( message );
			debugLog += message;
		}
		
		public function launch( sender:Object ):void
		{
			acquireAndDisplayPeerStream( sender );
		}
		
		public function stopChatting():void
		{
			resetPeerDisplayAndStream();
			
			if (outgoingDisplay.numChildren > 0)
			{
				outgoingDisplay.removeChild(outgoingVideo);
				outgoingVideo.attachCamera(null);
				outboundStream.attachCamera( null );
				outboundStream.attachAudio( null );
				camera = null;
				microphone = null ;
			}
		}
		
		public function sendChatNotification( type:String, recipient:Object ):void
		{
			var myNearId:String = netGroup.userId;
			var message:Object = new Object();
				message.username = username;
				message.type = type;
				message.sequence = chatSequence;
				message.sender = netGroup.userList[myNearId];
				
			if (type == VideoChatEvent.INVITATION_ACCEPTED)
				isAvailable = false;
			
			if (type == VideoChatEvent.END_CHAT)
				isAvailable = true;
				
			if( null != recipient )
				log( "Chat notification status: " + netGroup.sendToNearest(message, netGroup.convertPeerIDToGroupAddress(recipient.id)) + " by " + username + "\n" );
		}
		///////////////////////////////////////////////////////////////////////////////////////////////
		// OVERRIDES
		///////////////////////////////////////////////////////////////////////////////////////////////
		
		///////////////////////////////////////////////////////////////////////////////////////////////
		// PRIVATE METHODS
		///////////////////////////////////////////////////////////////////////////////////////////////
		public function activateCamera( selectedCamera:String ):void
		{
			if (outgoingDisplay.numChildren > 0)
			{
				outgoingDisplay.removeChild( outgoingVideo );
				
				outgoingVideo 	= null;
				camera 	= null;
			}
			
			//send minimum size accroding to current view i.e. incomingDisplay
			//other wise video quality suffers
			var VIDEO_WIDTH:int = incomingDisplay.width - padding;
			var VIDEO_HEIGHT:int = incomingDisplay.height - padding;
			
			camera = Camera.getCamera( selectedCamera );
			camera.setMode( VIDEO_WIDTH, VIDEO_HEIGHT, 10 );
			camera.setQuality( 30000, 0 );
			camera.setKeyFrameInterval( 15 );
			
			outgoingVideo = new Video( VIDEO_WIDTH, VIDEO_HEIGHT );
			outgoingVideo.attachCamera( camera );
			
			//see createOutboundStream();
			/*outboundStream = new NetStream( netConnection, NetStream.DIRECT_CONNECTIONS );
			outboundStream.addEventListener( NetStatusEvent.NET_STATUS, onNetStatusEvent );
			outboundStream.client = this;*/
			
			outgoingDisplay.addChild( outgoingVideo );
			
			outboundStream.attachCamera( camera );
			
			outgoingVideo.width = outgoingDisplay.width;
			outgoingVideo.height = outgoingDisplay.height;
			
			microphone = Microphone.getEnhancedMicrophone();
			
			if (microphone != null)
			{
				microphone.setUseEchoSuppression( false );
				microphone.setLoopBack( false );
				microphone.setSilenceLevel( 0, 20000 );
				microphone.codec = SoundCodec.SPEEX;
				microphone.gain = 60;
				microphone.framesPerPacket = 1;
				microphone.rate = 16; 
				
				
				outboundStream.attachAudio( microphone );
			}
			
			//outboundStream.publish( username ); // don't forget to enforce unique names!!!
			
			dispatchEvent( new VideoChatEvent(VideoChatEvent.CAMERA_ACTIVATED) );
		}
		
		private function createOutboundStream():void
		{
			outboundStream = new NetStream( netConnection, NetStream.DIRECT_CONNECTIONS );
			outboundStream.addEventListener( NetStatusEvent.NET_STATUS, onNetStatusEvent );
			outboundStream.client = this;
			
			outboundStream.publish( username ); // don't forget to enforce unique names!!!
			
			//dispatchEvent( new VideoChatEvent(VideoChatEvent.USER_PUBLISHED) );
		}
		
		public function deactivateCamera():void
		{		
			try
			{
				outgoingDisplay.removeChild(outgoingVideo);
				
				outgoingVideo.attachCamera(null);
				outboundStream.attachCamera( null );
				outboundStream.attachAudio( null );
				
				netConnection.close();
				
				camera = null;
				
				outboundStream.close();
				outboundStream = null;
				
				microphone = null ;
				
				dispatchEvent( new VideoChatEvent(VideoChatEvent.CAMERA_DEACTIVATED) );
			}
			catch(e:*)
			{
				log("error on deactivateCamera, may be views were not created or camera was not activated previously ...")
			}
		}
		
		private function acquireAndDisplayPeerStream( peer:Object ):void
		{
			log( "Acquiring peer stream...\n" );
			log( "Displaying peer stream!!\n" );
			log( "peer name: " + peer.name + "\n" );
			log( "peer ID: " + peer.id + "\n" );
			
			currentPeer = peer;
			
			var VIDEO_WIDTH:int = incomingDisplay.width - padding;
			var VIDEO_HEIGHT:int = incomingDisplay.height - padding;
			
			
			incomingVideo = new Video( VIDEO_WIDTH, VIDEO_HEIGHT );
			
			incomingDisplay.addChild( incomingVideo );
			
			inboundStream = new NetStream( netConnection, currentPeer.id );
			inboundStream.addEventListener( NetStatusEvent.NET_STATUS, onNetStatusEvent );
			
			inboundStream.play( currentPeer.name );
			incomingVideo.attachNetStream( inboundStream );
			
			
			dispatchEvent( new VideoChatEvent(VideoChatEvent.START_CHAT) );
		}
		
		private function resetPeerDisplayAndStream():void
		{
			if( null != incomingVideo && incomingDisplay.contains( incomingVideo ) )
				incomingDisplay.removeChild( incomingVideo );
			
			incomingVideo = null;
			
			inboundStream = null;
			
			currentPeer = null;
		}
		
		private function onNetConnection():void
		{
			groupSpec = new GroupSpecifier( "max2011ab/" + groupname );
			groupSpec.multicastEnabled = true; // required for announcing presence
			groupSpec.postingEnabled = true; // required for acquiring the list via directed routing
			groupSpec.routingEnabled = true; // required for acquiring the list via directed routing
			groupSpec.serverChannelEnabled = true; // instructs server to introduce new neighbors to a random set of neighbors in the group
			groupSpec.ipMulticastMemberUpdatesEnabled = true; // boosts performance
			groupSpec.addIPMulticastAddress( "239.255.255.254:30000" ); // use for local P2P
			
			outboundStream = new NetStream( netConnection, NetStream.DIRECT_CONNECTIONS );
			outboundStream.addEventListener( NetStatusEvent.NET_STATUS, onNetStatusEvent );
			
			neighbors = new ArrayCollection();
			
			netGroup = new NeighborList( netConnection, groupSpec.groupspecWithAuthorizations(), username );
			netGroup.addEventListener( NetStatusEvent.NET_STATUS, onNetStatusEvent );
			netGroup.addEventListener( NeighborListStatusEvent.CONNECTED, onNetGroupNeighborhoodPopulationChange );
			netGroup.addEventListener( NeighborListStatusEvent.USER_ADDED, onNetGroupNeighborhoodPopulationChange );
			netGroup.addEventListener( NeighborListStatusEvent.USER_REMOVED, onNetGroupNeighborhoodPopulationChange );
			
			connected = true;
			
			log( "Connected\n" );
			log( "Join \"" + groupSpec.groupspecWithAuthorizations() + "\"\n" );
		}
		
		private function onNetStreamConnection( stream:NetStream=null ):void
		{
			if (stream)
			{
				if (stream == outboundStream)
				{
					// handle the outbound stream coming thru FMS
				}
				else
				{
					// handle the peer stream coming thru FMS
				}
			}
		}
		
		private function onNetGroupConnection():void
		{
			joinedGroup = true;
			
			//activateCamera( preferredCamera );
			
			createOutboundStream();
		}
		
		private function onDisconnection():void
		{
			log( "Disconnected\n" );
			if( null!= netConnection )
				netConnection.close();
			
			netConnection = null;
			netGroup = null;
			outboundStream = null;
			connected = false;
			joinedGroup = false;
		}
		
		private function onNetGroupNeighborhoodPopulationChange( e:NeighborListStatusEvent=null ):void
		{
			log( "Neighborhood Population Changed\n" );
			
			if (e)
			{
				log( "User List Event: " + e.type + "\n" );
				
				switch (e.type)
				{
					case NeighborListStatusEvent.USER_ADDED:
						neighbors.addItem( e.info );
						log( "User Added: " + e.info.name + "\n" );
						break;
					case NeighborListStatusEvent.USER_REMOVED:
						removeUserFromNeighborhood( e.info );
						break;
					case NeighborListStatusEvent.CONNECTED:
						break;
				}
			}
		}
		
		private function onNetGroupSendToNotification( info:Object ):void
		{
			log( "SendTo Notification Received\n" );
			
			if (info.message.type 
				&& info.message.type != "request" 
				&& info.message.type != "response")
			{
				// not a user list function
				switch (info.message.type)
				{
					case VideoChatEvent.INVITE:
						/*
						process the invitation
						- accept
						- reject
						- unavailable if isAvailable == false
						*/
						processChatInvitation( info.message );
						break;
					case VideoChatEvent.INVITATION_ACCEPTED:
						// connect both parties
						onChatInvitationAccepted( info.message );
						break;
					case VideoChatEvent.INVITATION_DECLINED:
						// notify user their invitation was declined
						onChatInvitationDeclined( info.message );
						break;
					case VideoChatEvent.USER_UNAVAILABLE:
						// notify user their invitation was cancelled 
						// because the invitee is already in a session
						onChatInvitationCancelled( info.message );
						break;
					case VideoChatEvent.END_CHAT:
						/*
						- either party can end
						- returns user to "lobby"
						- clears incoming stream + video objects
						*/
						onEndChat( info.message );
						break;
				}
			}
		}
		
		private function onNetGroupNetStreamPublishNotification( streamName:String ):void
		{
			log( "NetGroup NetStream Publish Notification for stream: " + streamName + "\n" );
		}
		
		private function onNetGroupNetStreamUnpublishNotification( streamName:String ):void
		{
			log( "NetGroup NetStream Unpublish Notification for stream: " + streamName + "\n" );
		}
		
		private function onNetStatusEvent( e:NetStatusEvent ):void
		{
			switch (e.info.code)
			{
				case NetStatusCode.NETCONNECTION_CONNECT_SUCCESS:
					onNetConnection();
					break;
				case NetStatusCode.NETGROUP_CONNECT_SUCCESS:
					onNetGroupConnection();
					break;
				case NetStatusCode.NETSTREAM_CONNECT_SUCCESS:
					onNetStreamConnection( e.info.stream );
					break;
				case NetStatusCode.NETCONNECTION_CONNECT_CLOSED:
				case NetStatusCode.NETCONNECTION_CONNECT_FAILED:
				case NetStatusCode.NETCONNECTION_CONNECT_REJECTED:
					onDisconnection();
					break;
				case NetStatusCode.NETSTREAM_CONNECT_REJECTED:
				case NetStatusCode.NETSTREAM_CONNECT_FAILED:
					onDisconnection();
					break;
				case NetStatusCode.NETGROUP_NEIGHBOUR_CONNECT:
				case NetStatusCode.NETGROUP_NEIGHBOUR_DISCONNECT:
					onNetGroupNeighborhoodPopulationChange();
					break;
				case NetStatusCode.NETGROUP_SENDTO_NOTIFY:
					onNetGroupSendToNotification( e.info );
					break;
				case NetStatusCode.NETGROUP_MULTICASTSTREAM_PUBLISH_NOTIFY:
					onNetGroupNetStreamPublishNotification( e.info.name );
					break;
				case NetStatusCode.NETGROUP_MULTICASTSTREAM_UNPUBLISH_NOTIFY:
					onNetGroupNetStreamUnpublishNotification( e.info.name );
					break;
			}
		}
		
		private function validateAccessAllowed( isAlreadyConnected:Boolean, groupName:String ):Boolean
		{
			return (!isAlreadyConnected) && (groupName.length > 0);
		}
		
		private function removeUserFromNeighborhood( user:Object ):void
		{
			var neighborCursor:IViewCursor;
			var neighborIndex:int;
			var neighbor:Object;
			
			neighborCursor = neighbors.createCursor();
			
			while (!neighborCursor.afterLast)
			{
				neighbor = neighborCursor.current;
				
				if (neighbor == user)
				{
					neighborIndex = neighbors.getItemIndex( neighbor );
					neighbors.removeItemAt( neighborIndex );
				}
				
				neighborCursor.moveNext();
			}
			
			log( "User Removed: " + user.name  + "\n" );
		}
		
		private function processChatInvitation( invitation:Object ):void
		{
			if (isAvailable)
			{
				var evt:VideoChatEvent = new VideoChatEvent( VideoChatEvent.INVITATION_RECEIVED, true );
					evt.sender = invitation.sender;
					
				dispatchEvent( evt );
			}
			else
			{
				sendChatNotification( VideoChatEvent.USER_UNAVAILABLE, invitation.sender );
			}
		}
		
		private function onChatInvitationAccepted( message:Object ):void
		{
			log( "Chat invitation accepted\n" );
			
			isAvailable = false;
			
			acquireAndDisplayPeerStream( message.sender );
		}
		
		private function onChatInvitationDeclined( message:Object ):void
		{
			log( "Chat invitation declined\n" );
			
			var evt:VideoChatEvent = new VideoChatEvent( VideoChatEvent.INVITATION_DECLINED, true );
				evt.sender = message.sender;
				
			dispatchEvent( evt );
		}
		
		private function onChatInvitationCancelled( message:Object ):void
		{
			log( "User unavailable\n" );
				
			dispatchEvent( new VideoChatEvent(VideoChatEvent.USER_UNAVAILABLE, true) );
		}
		
		private function onEndChat( message:Object ):void
		{
			log( "All things must come to an end...\n" );
			
			isAvailable = true;
			stopChatting();
			dispatchEvent( new VideoChatEvent(VideoChatEvent.END_CHAT, true) );
		}
	}
}
/**
 * Internal object used for sharing user information from the user list. 
 */
internal class UserObject extends Object
{
	
	public var id:String;
	public var name:String;
	public var stamp:Number;
	
} // UserObject