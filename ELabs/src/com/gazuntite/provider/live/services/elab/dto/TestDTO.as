package com.gazuntite.provider.live.services.elab.dto
{
	import com.gazuntite.common.dto.baseDTO.LiveProviderBaseDTO;
	import com.gazuntite.common.util.xml.XmlConstants;
	import com.gazuntite.common.util.xml.XmlUtils;

	[Bindable]
	public class TestDTO extends LiveProviderBaseDTO
	{
		private var m_sID:String;
		private var m_sType:String ;
		private var m_sCode:String; 
		private var m_sName:String;
		private var m_sNormalRange:String;
		
		private var m_sXmlNodeName:String;
		
		public function TestDTO()
		{
			m_sNormalRange = "00-00";
			XmlNodeName = "Test";
		}
		
		public function get NormalRange():String
		{
			return m_sNormalRange;
		}

		public function set NormalRange(value:String):void
		{
			m_sNormalRange = value;
		}

		public function get Type():String
		{
			return m_sType;
		}

		public function set Type(value:String):void
		{
			m_sType = value;
		}

		public function get ID():String
		{
			return m_sID;
		}
		
		public function set ID(value:String):void
		{
			m_sID = value;
		}
		
		public function get Code():String
		{
			return m_sCode;
		}

		public function set Code(value:String):void
		{
			m_sCode = value;
		}

		public function get Name():String
		{
			return m_sName;
		}

		public function set Name(value:String):void
		{
			m_sName = value;
		}

		public function get XmlNodeName():String
		{
			return m_sXmlNodeName;
		}
		
		public function set XmlNodeName(value:String):void
		{
			m_sXmlNodeName = value;
		}
		
		public function FromXML(x:XML):void
		{
			if (!x)
				return;
			
			ID 			= x.@[XmlConstants.ID];
			Name 		= x.@[XmlConstants.NAME];
			Code 		= x.@[XmlConstants.CODE];
			Type 		= x.@[XmlConstants.TYPE];
		}
		
		public function ToXML():XML
		{
			var xml:XML = XmlUtils.getNodeByTagName( XmlNodeName );
			xml.@[XmlConstants.ID]		= ID;
			xml.@[XmlConstants.NAME]	= Name;
			xml.@[XmlConstants.CODE]	= Code;
			xml.@[XmlConstants.TYPE]	= Type;
			
			return xml;
		}

	}
}