package com.gazuntite.provider.live.services.scheduler.dto.staticData
{
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerXmlConstants;
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerXmlUtils;
	
	import mx.utils.StringUtil;

	[Bindable]
	public class ProviderDTO
	{
		private var m_sFirstName:String;
		private var m_sLastName:String;
		private var m_sUserID:String;
		private var m_sStationID:String;
		private var m_sID:String;
		
		private var m_sProviderName:String;

	// Parser function for XML - come IN XML	
		public function FromXML( x:XML ):void
		{
			FirstName 		= x.@[SchedulerXmlConstants.FIRSTNAME];
			LastName 		= x.@[SchedulerXmlConstants.LASTNAME];
			UserID          = x.@[SchedulerXmlConstants.USERID];
			StationID       = x.@[SchedulerXmlConstants.STATIONID];	
			ID				= x.@[SchedulerXmlConstants.ID];
			
			ProviderName  = StringUtil.trim(FirstName) +' '+ StringUtil.trim(LastName);
		}
	
	// GETTER & SETTER	
		public function get FirstName():String
		{
			return m_sFirstName;
		}

		public function set FirstName(value:String):void
		{
			m_sFirstName = value;
		}

		public function get LastName():String
		{
			return m_sLastName;
		}

		public function set LastName(value:String):void
		{
			m_sLastName = value;
		}
		
		public function get UserID():String
		{
			return m_sUserID;
		}
		
		public function set UserID(value:String):void
		{
			m_sUserID = value;
		}
		
		public function get StationID():String
		{
			return m_sStationID;
		}
		
		public function set StationID(value:String):void
		{
			m_sStationID = value;
		}

		public function get ProviderName():String
		{
			return m_sProviderName;
		}

		public function set ProviderName(value:String):void
		{
			m_sProviderName= value;
		}

		public function get ID():String
		{
			return m_sID;
		}

		public function set ID(value:String):void
		{
			m_sID = value;
		}


	}
}