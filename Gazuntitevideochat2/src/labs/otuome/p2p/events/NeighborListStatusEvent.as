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
	
	public class NeighborListStatusEvent extends Event
	{
		//--------------------------------------
		//  Constants
		//--------------------------------------
		// connected	
		public static const CONNECTED:String 		= "connected";
		
		// user added
		public static const USER_ADDED:String		= "userAdded";
		
		// user removed
		public static const USER_REMOVED:String		= "userRemoved";
		
		//--------------------------------------
		//  Members
		//--------------------------------------
		private var m_info:Object;
		
		/**
		 * UserListStatus Event.
		 * @param type
		 * @param bubbles
		 * @param cancelable
		 * @param info
		 * 
		 */		
		public function NeighborListStatusEvent( type:String, 
											bubbles:Boolean=false, 
											cancelable:Boolean=false, 
											info:Object=null )
		{
			super( type, bubbles, cancelable );
			m_info = info;
		}
		
		/**
		 * 
		 * @return 
		 * 
		 */		
		public override function clone():Event
		{
			return new NeighborListStatusEvent( type, bubbles, cancelable, m_info );
		}
		
		/**
		 *
		 * @return 
		 * 
		 */		
		public override function toString():String
		{
			return formatToString( "PeerStatusEvent", "type", "bubbles", "cancelable", "eventPhase", "info" );
		}
		
		/**
		 * Info property.
		 * @return 
		 * 
		 */		
		public function get info():Object				{ return m_info; }
		public function set info( value:Object ):void	{ m_info=value; }
	}
}