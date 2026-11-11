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
package labs.otuome.p2p.events
{
	import flash.events.Event;
	import flash.media.Video;
	
	/**
	 * General application events.
	 * @author Hasan Otuome
	 */
	public class VideoChatEvent extends Event
	{
		///////////////////////////////////////////////////////////////////////////////////////////////
		// PRIVATE PROPERTIES
		///////////////////////////////////////////////////////////////////////////////////////////////
		
		///////////////////////////////////////////////////////////////////////////////////////////////
		// PUBLIC PROPERTIES
		///////////////////////////////////////////////////////////////////////////////////////////////
		public static const CAMERA_ACTIVATED:String 	= "cameraActivatedEvent";
		public static const CAMERA_DEACTIVATED:String 	= "cameraDeactivatedEvent";
		public static const DISPLAY_CAMERA:String 		= "displayCameraEvent";
		public static const RESET_CAMERA:String 		= "resetCameraEvent";
		
		public static const INVITE:String 				= "chatInvitationEvent";
		public static const INVITATION_RECEIVED:String 	= "chatInvitationReceivedEvent";
		public static const INVITATION_ACCEPTED:String 	= "chatInvitationAcceptedEvent";
		public static const INVITATION_DECLINED:String 	= "chatInvitationDeclinedEvent";
		public static const USER_UNAVAILABLE:String		= "userUnavailableEvent";
		public static const START_CHAT:String 			= "startChatEvent";
		public static const END_CHAT:String 			= "endChatEvent";
		
		public var video:Video;
		
		public var sender:Object;
		
		public var peer:String;
		///////////////////////////////////////////////////////////////////////////////////////////////
		// PUBLIC METHODS
		///////////////////////////////////////////////////////////////////////////////////////////////
		public function VideoChatEvent( type:String, 
										bubbles:Boolean=false, 
										cancelable:Boolean=false )
		{
			super( type, bubbles, cancelable );
		}
		
		///////////////////////////////////////////////////////////////////////////////////////////////
		// OVERRIDES
		///////////////////////////////////////////////////////////////////////////////////////////////
		
		///////////////////////////////////////////////////////////////////////////////////////////////
		// PRIVATE METHODS
		///////////////////////////////////////////////////////////////////////////////////////////////
	}
}