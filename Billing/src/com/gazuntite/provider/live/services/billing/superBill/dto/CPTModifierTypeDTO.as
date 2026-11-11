package com.gazuntite.provider.live.services.billing.superBill.dto
{
	import com.gazuntite.common.util.xml.XmlConstants;

	[Bindable]
	public class CPTModifierTypeDTO
	{
		private var m_sModifierTypeId:String;		
		private var m_sModifierDescription:String;
		
		public function CPTModifierTypeDTO()
		{
		}
		
		public function FromXML( x:XML ):void
		{
			ModifierTypeId 								= x.@[XmlConstants.MODIFIERTYPEID];			
			ModifierDescription 						= x.@[XmlConstants.MODIFIERDESCRIPTION];			
		}
		
		public function get ModifierTypeId():String
		{
			return m_sModifierTypeId;
		}
		
		public function set ModifierTypeId(value:String):void
		{
			m_sModifierTypeId = value;
		}
		
		public function get ModifierDescription():String
		{
			return m_sModifierDescription;
		}
		
		public function set ModifierDescription(value:String):void
		{
			m_sModifierDescription = value;
		}
	}
}