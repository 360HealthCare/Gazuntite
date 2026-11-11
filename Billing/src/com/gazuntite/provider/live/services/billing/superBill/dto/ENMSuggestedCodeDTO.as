package com.gazuntite.provider.live.services.billing.superBill.dto
{
	import com.gazuntite.common.util.xml.XmlConstants;

	[Bindable]
	public class ENMSuggestedCodeDTO
	{
		private var m_sENMCodeTypeID:String;		
		private var m_sENMProcCode:String;
		private var m_sENMProcDescription:String;
		private var m_sPrice:String;
		private var m_sEncounterType:String;
		
		public function FromXML( x:XML ):void
		{
			ENMCodeTypeID 						= x.@[XmlConstants.ENMCODETYPEID];			
			ENMProcCode 						= x.@[XmlConstants.ENMPROCCODE];
			ENMProcDescription					= x.@[XmlConstants.ENMPROCDESCRIPTION];
			Price								= x.@[XmlConstants.PRICE];
			EncounterType						= x.@[XmlConstants.ENCOUNTERTYPE];
		}
		
		public function get ENMCodeTypeID():String
		{
			return m_sENMCodeTypeID;
		}
		
		public function set ENMCodeTypeID(value:String):void
		{
			m_sENMCodeTypeID = value;
		}
		
		public function get ENMProcCode():String
		{
			return m_sENMProcCode;
		}
		
		public function set ENMProcCode(value:String):void
		{
			m_sENMProcCode = value;
		}
		
		public function get ENMProcDescription():String
		{
			return m_sENMProcDescription;
		}
		
		public function set ENMProcDescription(value:String):void
		{
			m_sENMProcDescription = value;
		}
		
		public function get Price():String
		{
			return m_sPrice;
		}
		
		public function set Price(value:String):void
		{
			m_sPrice = value;
		}
		
		public function get EncounterType():String
		{
			return m_sEncounterType;
		}
		
		public function set EncounterType(value:String):void
		{
			m_sEncounterType = value;
		}
	}
}