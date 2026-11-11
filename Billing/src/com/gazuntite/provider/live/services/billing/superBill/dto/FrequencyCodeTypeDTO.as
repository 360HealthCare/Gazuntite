package com.gazuntite.provider.live.services.billing.superBill.dto
{
	import com.gazuntite.common.util.xml.XmlConstants;

	[Bindable]
	public class FrequencyCodeTypeDTO
	{
		private var m_sFrequencyTypeID:String;		
		private var m_sFrequencyCode:String;
		
		public function FromXML( x:XML ):void
		{
			FrequencyTypeID 					= x.@[XmlConstants.FREQUENCYTYPEID];			
			FrequencyCode 						= x.@[XmlConstants.FREQUENCYCODE];
			
		}
		
		public function get FrequencyTypeID():String
		{
			return m_sFrequencyTypeID;
		}
		
		public function set FrequencyTypeID(value:String):void
		{
			m_sFrequencyTypeID = value;
		}
		
		public function get FrequencyCode():String
		{
			return m_sFrequencyCode;
		}
		
		public function set FrequencyCode(value:String):void
		{
			m_sFrequencyCode = value;
		}
	}
}