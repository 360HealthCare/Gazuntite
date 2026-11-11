package com.gazuntite.provider.live.services.elab.dto
{
	import com.gazuntite.common.dto.baseDTO.LiveProviderBaseDTO;
	import com.gazuntite.common.util.xml.XmlConstants;
	import com.gazuntite.common.util.xml.XmlUtils;
	
	import mx.utils.XMLUtil;

	[Bindable]
	public class MethodDTO extends LiveProviderBaseDTO
	{
		public function MethodDTO()
		{
			
		}
		
		private var _m_sID:String;
		private var _m_sm_sName:String;

		public function get ID():String
		{
			return _m_sID;
		}

		public function set ID(value:String):void
		{
			_m_sID = value;
		}

		public function get Name():String
		{
			return _m_sm_sName;
		}

		public function set Name(value:String):void
		{
			_m_sm_sName = value;
		}
		
		public function FromXML(x:XML):void
		{
			ID 		= x.@[XmlConstants.ID];
			Name 	= x.@[XmlConstants.NAME];
		}
		
		public function ToXML():XML
		{
			var xml:XML = XmlUtils.getNodeByTagName( "Method" );
			xml.@[XmlConstants.ID]			= ID;
			xml.@[XmlConstants.NAME]		= Name;
			
			return xml;
		}


	}
}