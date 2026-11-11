package com.gazuntite.common.dto
{
	import com.gazuntite.common.util.xml.XmlConstants;

	[Bindable]
	public class PlaceOfServiceTypeDTO
	{
		private var m_sServiceTypeID:String;		
		private var m_sPOSCode:String;
		private var m_sPOSDescription:String;
		
		public function PlaceOfServiceTypeDTO()
		{
		}
		
		public function get POSCode():String
		{
			return m_sPOSCode;
		}
		
		public function set POSCode(value:String):void
		{
			m_sPOSCode = value;
		}
		
		public function get ServiceTypeID():String
		{
			return m_sServiceTypeID;
		}
		
		public function set ServiceTypeID(value:String):void
		{
			m_sServiceTypeID = value;
		}
		
		public function get POSDescription():String
		{
			return m_sPOSDescription;
		}
		
		public function set POSDescription(value:String):void
		{
			m_sPOSDescription = value;
		}
		
		public function FromXML( x:XML ):void
		{
			ServiceTypeID 								= x.@[XmlConstants.SERVICETYPEID];			
			POSDescription 								= x.@[XmlConstants.POSDESCRIPTION];	
			POSCode										= x.@[XmlConstants.POSCODE];
		}
	}
}