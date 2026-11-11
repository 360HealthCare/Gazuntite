package com.gazuntite.provider.live.services.scheduler.dto
{
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerXmlConstants;
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerXmlUtils;

	[Bindable]
	public class RoomDTO
	{
			private var m_sID:String ='';
			private var m_sStation:String ='';
			private var m_sTitle:String ='';

			
// **************  Parser function for XML ***************************************************************	
			
			public function FromXML( x:XML ):void
			{
				ID 				= x.@[SchedulerXmlConstants.ID];
				Station 		= x.@[SchedulerXmlConstants.STATION];
				Title 			= x.@[SchedulerXmlConstants.TITLE];
			}
			
			public function ToXML(data:Object):XML
			{
				var xml:XML = SchedulerXmlUtils.getNodeByTagName( "Room" );
				xml.@[SchedulerXmlConstants.ID]					= data.Room.ID;
				xml.@[SchedulerXmlConstants.STATION]			= data.Room.Station;
				xml.@[SchedulerXmlConstants.TITLE]				= data.Room.Title;
				return xml;
			}
// Start ***************** GETTER and SETTER **************************//////////
	
			public function get ID():String
			{
				return m_sID;
			}

			public function set ID(value:String):void
			{
				m_sID = value;
			}

			public function get Station():String
			{
				return m_sStation;
			}

			public function set Station(value:String):void
			{
				m_sStation = value;
			}

			public function get Title():String
			{
				return m_sTitle;
			}

			public function set Title(value:String):void
			{
				m_sTitle = value;
			}

			
// END ***************** GETTER and SETTER **************************//////////

	}
	
}