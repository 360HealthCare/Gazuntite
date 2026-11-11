package com.gazuntite.common.dto
{
	import com.gazuntite.common.util.xml.XmlConstants;

	[Bindable]
	public class StatesDTO
	{
		public function StatesDTO()
		{
		}
		
		private var m_sStateID:String;		
		private var m_sStateName:String;
		private var m_sStateCode:String;
		private var m_sName:String;
		//private var m_sCountryID:String;
		
		public function FromXML( x:XML ):void
		{
			StateID 					= x.@[XmlConstants.STATEID];			
			StateName 					= x.@[XmlConstants.STATENAME];
			StateCode					= x.@[XmlConstants.STATECODE];
			Name						= x.@[XmlConstants.NAME];
		}
		
		//**** GETTER and SETTER *************
		
		/*public function get CountryID():String
		{
			return m_sCountryID;
		}
		
		public function set CountryID(value:String):void
		{
			m_sCountryID = value;
		}*/
		
		public function get StateCode():String
		{
			return m_sStateCode;
		}
		
		public function set StateCode(value:String):void
		{
			m_sStateCode = value;
		}
		
		public function get StateName():String
		{
			return m_sStateName;
		}
		
		public function set StateName(value:String):void
		{
			m_sStateName = value;
		}
		
		public function get StateID():String
		{
			return m_sStateID;
		}
		
		public function set StateID(value:String):void
		{
			m_sStateID = value;
		}

		public function get Name():String
		{
			return m_sName;
		}

		public function set Name(value:String):void
		{
			m_sName = value;
		}

	}
}