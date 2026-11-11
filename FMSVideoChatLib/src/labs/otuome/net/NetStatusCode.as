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
package labs.otuome.net
{
	/**
	 * Constants for the relevant NetStatusEvent codes.
	 * @author Hasan Otuome
	 */
	public class NetStatusCode
	{
		///////////////////////////////////////////////////////////////////////////////////////////////
		// PRIVATE PROPERTIES
		///////////////////////////////////////////////////////////////////////////////////////////////
		
		///////////////////////////////////////////////////////////////////////////////////////////////
		// PUBLIC PROPERTIES
		///////////////////////////////////////////////////////////////////////////////////////////////
		public static const NETCONNECTION_CONNECT_SUCCESS:String 				= "NetConnection.Connect.Success";
		public static const NETCONNECTION_CONNECT_FAILED:String 				= "NetConnection.Connect.Failed";
		public static const NETCONNECTION_CONNECT_CLOSED:String 				= "NetConnection.Connect.Closed";
		public static const NETCONNECTION_CONNECT_REJECTED:String 				= "NetConnection.Connect.Rejected";
		public static const NETCONNECTION_CONNECT_APP_SHUTDOWN:String 			= "NetConnection.Connect.AppShutdown";
		public static const NETCONNECTION_CONNECT_INVALID_APP:String 			= "NetConnection.Connect.InvalidApp";
		public static const NETGROUP_CONNECT_SUCCESS:String 					= "NetGroup.Connect.Success";
		public static const NETGROUP_CONNECT_REJECTED:String 					= "NetGroup.Connect.Rejected";
		public static const NETGROUP_CONNECT_FAILED:String 						= "NetGroup.Connect.Failed";
		public static const NETGROUP_REPLICATION_FETCH_SENDNOTIFY:String		= "NetGroup.Replication.Fetch.SendNotify";
		public static const NETGROUP_REPLICATION_FETCH_FAILED:String 			= "NetGroup.Replication.Fetch.Failed";
		public static const NETGROUP_REPLICATION_FETCH_RESULT:String 			= "NetGroup.Replication.Fetch.Result";
		public static const NETGROUP_REPLICATION_FETCH_REQUEST:String 			= "NetGroup.Replication.Request";
		public static const NETGROUP_MULTICASTSTREAM_PUBLISH_NOTIFY:String 		= "NetGroup.MulticastStream.PublishNotify";
		public static const NETGROUP_MULTICASTSTREAM_UNPUBLISH_NOTIFY:String 	= "NetGroup.MulticastStream.UnpublishNotify";
		public static const NETGROUP_POSTING_NOTIFY:String 						= "NetGroup.Posting.Notify";
		public static const NETGROUP_SENDTO_NOTIFY:String 						= "NetGroup.SendTo.Notify";
		public static const NETGROUP_NEIGHBOUR_CONNECT:String 					= "NetGroup.Neighbor.Connect";
		public static const NETGROUP_NEIGHBOUR_DISCONNECT:String 				= "NetGroup.Neighbor.Disconnect"; 
		public static const NETSTREAM_CONNECT_SUCCESS:String 					= "NetStream.Connect.Success";
		public static const NETSTREAM_CONNECT_REJECTED:String 					= "NetStream.Connect.Rejected";
		public static const NETSTREAM_CONNECT_FAILED:String 					= "NetStream.Connect.Failed";
		public static const NETSTREAM_MULTICAST_STREAM_RESET:String 			= "NetStream.MulticastStream.Reset";
		public static const NETSTREAM_BUFFER_FULL:String 						= "NetStream.Buffer.Full";
		
		///////////////////////////////////////////////////////////////////////////////////////////////
		// PUBLIC METHODS
		///////////////////////////////////////////////////////////////////////////////////////////////
		
		///////////////////////////////////////////////////////////////////////////////////////////////
		// OVERRIDES
		///////////////////////////////////////////////////////////////////////////////////////////////
		
		///////////////////////////////////////////////////////////////////////////////////////////////
		// PRIVATE METHODS
		///////////////////////////////////////////////////////////////////////////////////////////////
	}
}