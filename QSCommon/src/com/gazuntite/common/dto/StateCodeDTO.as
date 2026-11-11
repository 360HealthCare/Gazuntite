package com.gazuntite.common.dto
{
	import com.gazuntite.common.util.xml.XmlConstants;

	[Bindable]
	public class StateCodeDTO
	{
		private var m_sStateID:String;		
		private var m_sStateName:String;
		private var m_sStateCode:String;
		private var m_sCountryID:String;
		
		
		public function FromXML( x:XML ):void
		{
			StateID 					= x.@[XmlConstants.STATEID];			
			StateName 					= x.@[XmlConstants.STATENAME];
			StateCode					= x.@[XmlConstants.STATECODE];
			CountryID					= x.@[XmlConstants.COUNTRYID];
			
		}
		
		public function get CountryID():String
		{
			return m_sCountryID;
		}
		
		public function set CountryID(value:String):void
		{
			m_sCountryID = value;
		}
		
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
	}
}