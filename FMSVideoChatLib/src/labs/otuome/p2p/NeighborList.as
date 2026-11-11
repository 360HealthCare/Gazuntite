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
	import labs.otuome.p2p.events.NeighborListStatusEvent;
	
	import flash.events.Event;
	import flash.events.NetStatusEvent;
	import flash.events.TimerEvent;
	import flash.net.NetConnection;
	import flash.net.NetGroup;
	import flash.utils.Timer;
	import flash.utils.getTimer;
	import flash.utils.setTimeout;
	
	public class NeighborList extends NetGroup
	{		
		
		//--------------------------------------
		//  Members
		//--------------------------------------
		// near id
		private var m_nearID:String = "";
		// sequence number increment, ensures all posts sent to the group are unique
		private var m_sequenceNumber:uint = 0;
		// initialization flag to indicate participation in the group
		private var m_neighbored:Boolean = false;
		// user name assigned to this instance
		private var m_userName:String = "";
		// this peer's address in the group
		private var m_groupAddress:String = "";
		// list of all the known users in the group
		private var m_userList:Object = {};
		// handles announcement of user's presence to the group
		private var m_keepAliveTimer:Timer;
		// handles expiration of users who may have timed out or disconnected
		private var m_expireTimer:Timer;
		// time to grant users before expiring them
		private var m_expired:Number = DEFAULT_EXPIRE_TIMEOUT;
		// current factor to test for scaling up or down
		private var m_scaleFactor:int = 0;
		// percent to scale up or down
		private var m_scalePercent:Number = .25;
		
		//--------------------------------------
		//  Constants
		//--------------------------------------
		private const VERSION:String = "1.0";
		private const ANONYMOUS_USER_NAME:String = "lurker";
		
		//  defaults optimized for small groups
		private const DEFAULT_ANNOUNCE_TIME:Number = 60000;	// every minute
		private const DEFAULT_EXPIRE_CHECK:Number = 30000;		// every 30 seconds
		private const DEFAULT_EXPIRE_TIMEOUT:Number = 120000;	// 2 minutes
		
		//  defaults useful for groups of up to 100 members
//		private const DEFAULT_ANNOUNCE_TIME:Number = 120000;	// every 2 minutes
//		private const DEFAULT_EXPIRE_CHECK:Number = 60000;		// every minute
//		private const DEFAULT_EXPIRE_TIMEOUT:Number = 300000;	// 5 minutes
		
		/**
		 * Creates a new UserList object. 
		 * @param connection
		 * @param groupspec
		 * @param username
		 * 
		 */	
		public function NeighborList( connection:NetConnection, groupspec:String, 
								 username:String = null )
		{
			// create the base NetGroup and add an internal event listener
			super( connection, groupspec );
			
			// add event listener for NetGroup.Connect.Success which is 
			// sent on the NetConnection's status handler
			connection.addEventListener( NetStatusEvent.NET_STATUS, 
				this.connectionStatusHandler );
			
			// add local event listener for NetGroup status events
			addEventListener( NetStatusEvent.NET_STATUS, netStatusHandler );
			
			// capture the NetConnection which is used to access the nearID
			m_nearID = connection.nearID;
			
			// set announce timer and frequency
			m_keepAliveTimer = new Timer( DEFAULT_ANNOUNCE_TIME );
			m_keepAliveTimer.addEventListener( TimerEvent.TIMER, announceSelf );
			
			// set the expiration timer
			m_expireTimer = new Timer(DEFAULT_EXPIRE_CHECK);
			m_expireTimer.addEventListener( TimerEvent.TIMER, expireNames );
			
			// give it a default username in case the username is not set on creation
			if (username)
			{
				m_userName = username;
			}
			else
			{
				m_userName = ANONYMOUS_USER_NAME;
			}
			
		}
		
		/**
		 * The interval in which to check if users have expired. 
		 * @return 
		 * 
		 */
		public function get expireTimerDelay():Number
		{ 
			return m_expireTimer.delay; 
		}
		public function set expireTimerDelay( delay:Number ):void
		{
			m_expireTimer.delay = delay;
		}
		
		/**
		 * Returns the group address for this peer. 
		 * @return 
		 * 
		 */		
		public function get groupAddress():String
		{
			if (!m_groupAddress)
			{
				m_groupAddress = convertPeerIDToGroupAddress( m_nearID );
			}
			return m_groupAddress;
		}
		
		/**
		 * Time to send a keep-alive message to the group to inform them 
		 * you are still present. 
		 * @return 
		 * 
		 */		
		public function get keepAliveTimerDelay():Number
		{
			return m_keepAliveTimer.delay;
		}
		public function set keepAliveTimerDelay( delay:Number ):void
		{ 
			m_keepAliveTimer.delay = delay; 
		}
		
		/**
		 * User name for this instance. 
		 * @param name
		 * 
		 */		
		public function get userName():String
		{ 
			return m_userName;
		}
		public function set userName( name:String ):void
		{
			m_userName = name;
		}	
		
		/**
		 * Returns the object containing all of the known users in the group. 
		 * @return 
		 * 
		 */
		public function get userList():Object
		{ 
			return m_userList;
		}
		
		/**
		 * Returns the string representing the nearID for this instance. 
		 * @return 
		 * 
		 */		
		public function get userId():String
		{
			return m_nearID;
		}
		
		/**
		 * Override close function to stop timers and clean up members. 
		 * 
		 */		
		public override function close():void
		{
			m_userList = {};
			m_expireTimer.stop();
			m_keepAliveTimer.stop();
			m_userName = null;
		}
		
		/**
		 * Handles status events received for the NetConnection.
		 * Used to determine when the NetGroup.Connect.Success event is 
		 * dispatched. 
		 * @param evt
		 * 
		 */
		private function connectionStatusHandler( evt:NetStatusEvent ):void
		{
			switch (evt.info.code) 
			{
				
				case "NetGroup.Connect.Success":
				{
					// ok we're connected, create a new user list entry for self
					var uo:UserObject = new UserObject();
						uo.id = m_nearID;
						uo.name = m_userName;
						uo.stamp = getTimer();
					
					m_userList[m_nearID] = uo;
					
					// dispatch user added event for self
					dispatchEvent( new NeighborListStatusEvent(
						NeighborListStatusEvent.USER_ADDED, true, false, uo) );
					break;
				}
				case "NetConnection.Connect.Closed":
				{
					// stop timers in the event the NetConnection is lost
					m_keepAliveTimer.stop();
					m_expireTimer.stop();
					break;
				}
			}
		}
		
		/**
		 * Handles status events received to the NetGroup. 
		 * @param evt
		 * 
		 */		
		protected function netStatusHandler( evt:NetStatusEvent ):void 
		{
			
			switch (evt.info.code) 
			{
				
				case "NetGroup.Neighbor.Connect":
				{
					// don't start timers and attempt group calls until we 
					// have at least one neighbor
					if (!m_neighbored) 
					{					
						m_neighbored = true;
						
						// start timers
						m_keepAliveTimer.start();
						m_expireTimer.start();
						
						// immediately send a keep-alive to the group
						announceSelf();
						
						// announce one more keep-alive 30 seconds later
						var announceFollowUp:uint = 
							setTimeout( announceSelf, 30000 );
						
						// request a current snapshot of the known users 
						// from the first neighbor
						requestUsers( evt.info.neighbor );
						dispatchEvent( new NeighborListStatusEvent(
							NeighborListStatusEvent.CONNECTED, true, false) );
					}
					break;
				}
				case "NetGroup.Posting.Notify":
				{	
					// ignore any posts that are not relevant to updating 
					// users information
					var postObj:Object = evt.info.message;
					
					if (postObj.id && postObj.name) 
					{
						updateUser( postObj );
					}
					break;
				}
				case "NetGroup.SendTo.Notify":
				{	
					// process directed routing events 
					// (user list requests and replies)
					processRouting( evt.info );
					break;
				}
			}
		}
		
		/**
		 * Updates the time stamp for a user when acknowledgement is 
		 * received of their presence. 
		 * @param user
		 * 
		 */		
		protected function updateUser( user:Object ):void
		{
			// grab the current timestamp
			user.stamp = getTimer();
			
			// no record of the user
			if (!m_userList[user.id])
			{
				
				// create a new user object 
				// (so we're not wasting memory saving the sequence number)
				var uo:UserObject = new UserObject();
					uo.id = user.id;
					uo.name = user.name;
				
				m_userList[user.id] = uo;
				
				// dispatch user added event
				dispatchEvent( new NeighborListStatusEvent(
					NeighborListStatusEvent.USER_ADDED, true, false, uo) );
			}
			
			// update user list entry with a new timestamp
			m_userList[user.id].stamp = getTimer();
			
		}
		
		/**
		 * Timer event handler to announce your presence to the group. 
		 * @param te
		 * 
		 */		
		protected function announceSelf( te:TimerEvent = null ):void 
		{
			
			// create a new object to be sent to other participants
			// notifying them of your presence.
			var msg:KeepAlive = new KeepAlive();
				msg.seq = m_sequenceNumber++;
				msg.id = m_nearID;
				msg.name = m_userName;
			
			// NetGroup.post will return the messageID of the post if successful
			// otherwise it will return null on error
			// If this returns a null, then make sure you selected postingEnabled
			// on your GroupSpecifier object
			if (!post(msg))
			{
				throw new Error( "Your GroupSpecifier must have posting enabled " +
					"in order to use the UserList class." );
			}
			
			// update time stamp for self
			m_userList[m_nearID].stamp = getTimer();
		}
		
		/**
		 * Timer event handler to loop through the names and see who may no 
		 * longer be present in the group. 
		 * @param te
		 * 
		 */		
		protected function expireNames( te:TimerEvent = null ):void 
		{
			
			// get current time stamp so we can calculate the time elapased 
			// since last post
			var currentStamp:uint = getTimer();
			var age:Number = 0;
			
			// loop through the user list object
			for (var p:String in m_userList)
			{
				
				// no need to check yourself
				if (p == m_nearID)
				{
					continue;
				}
				
				// calculate age
				age = currentStamp - m_userList[p].stamp;
				
				// purge users who have expired
				if (age > m_expired) 
				{
					dispatchEvent( new NeighborListStatusEvent(
						NeighborListStatusEvent.USER_REMOVED, true, false, m_userList[p]) );
					delete m_userList[p];
					continue;
				}
			}
		}
		
		
		//--------------------------------------------------------------------------
		// Directed Routing User List Request
		// This is the process by which a new joiner would ask a
		// neighbor for a copy of their users list.
		//--------------------------------------------------------------------------
		
		protected function processRouting( info:Object ):void
		{
			
			// info properties...
			// message - object that was sent
			// from - group address of neighbor info was received from
			// fromLocal - if true, then from self and process, else pass along
			
			if (info.message.destination == groupAddress)
			{
				// neighbor has requested a copy of user list
				if (info.message.type == ListRoutingObject.REQEUST)
				{
					var response:ListRoutingObject = new ListRoutingObject();
						response.destination = info.message.sender;
						response.time = getTimer();
						response.users = m_userList;
						response.type = ListRoutingObject.RESPONSE;
					
					// send the requester a copy of user list
					sendToNearest( response, response.destination );
				} 
				
				// neighbor has responded with a copy of their user list
				if (info.message.type == ListRoutingObject.RESPONSE)
				{
					var users:Object = info.message.users;
					var neighborsTime:Number = info.message.time;
					var neighborsAge:Number = 0;
					var localAge:Number = 0;
					
					// loop through and calculate new stamp relative to known 
					// age and this system's clock
					for (var p:String in users) 
					{
						
						neighborsAge = neighborsTime - users[p].stamp + 1000;
						
						// dispatch new user added event
						if (!m_userList[p])
						{
							dispatchEvent( new NeighborListStatusEvent(
								NeighborListStatusEvent.USER_ADDED, true, false, users[p]) );
							
							// update entry in user list
							m_userList[p] = users[p];					
							
							// calculate age, relevant to neighbors clock, and 
							// subtract age from this clock
							// add one second to account for request and 
							// processing time
							m_userList[p].stamp = getTimer() - neighborsAge;
						}
						else
						{
							// calculate the age relative to this instance's clock
							localAge = getTimer() - m_userList[p].stamp;
							
							// if neighbor has a record with a more recent age, 
							// use their's
							if (neighborsAge < localAge)
							{
								m_userList[p].stamp = getTimer() - neighborsAge;
							}
						}
						
					} // for
					
				} // if RESPONSE
				
			}
			else if (!info.fromLocal)
			{
				// not from local, pass it along
				sendToNearest( info.message, info.message.destination );
			}
		}
		
		/**
		 * Sumits a request for a snapshot of the first neighbor's users list. 
		 * @param id
		 * 
		 */
		protected function requestUsers( id:String ):void
		{
			var request:ListRoutingObject = new ListRoutingObject();
				request.destination = id;
				request.sender = groupAddress;
				request.type = ListRoutingObject.REQEUST;
				sendToNearest(request, request.destination);
		}		
		
	} // UserList
} // com.adobe.fms


/**
 * Internal object used for sending presence data about a user.
 * 
 */
internal class KeepAlive extends Object
{
	
	public var seq:uint;
	public var id:String;
	public var name:String;
	
} // KeepAlive

/**
 * Internal object used for storing user information in the user list. 
 * 
 */
internal class UserObject extends Object
{
	
	public var id:String;
	public var name:String;
	public var stamp:Number;
	
} // UserObject


/**
 * Internal object used for requesting, and responding with, a snapshot of the users list.
 * 
 */
internal class ListRoutingObject extends Object
{
	public static const REQEUST:String = "request";
	public static const RESPONSE:String = "response";
	
	public var users:Object;
	public var time:uint;
	public var type:String;
	public var sender:String;
	public var destination:String;
	
} // ListRoutingObject

//}