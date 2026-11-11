package com.gazuntite.common.dto
{
	public class ProviderDTO extends PersonDTO
	{
		private var m_iUserID				:int;
		
		public function ProviderDTO()
		{
			XmlNodeName = "Provider";
		}
		
		public function get UserID():int
		{
			return m_iUserID;
		}

		public function set UserID(value:int):void
		{
			m_iUserID = value;
		}

		override public function FromXML(x:XML):void
		{
			super.FromXML( x );
		}
		
		override public function ToXML():XML
		{
			var xml:XML = super.ToXML();
			
			return xml;
		}
	}
}