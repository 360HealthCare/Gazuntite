package com.gazuntite.provider.live.services.elab.dto
{
	import com.gazuntite.common.util.xml.XmlConstants;
	import com.gazuntite.common.util.xml.XmlUtils;

	[Bindable]
	public class ResultDTO
	{
		private var m_sStatus:String;
		private var m_sComments:String;
		private var m_sFile:String;
		private var m_sRanage:String;
		
		public function ResultDTO()
		{
		}

		public function get Status():String
		{
			return m_sStatus;
		}

		public function set Status(value:String):void
		{
			m_sStatus = value;
		}

		public function get Comments():String
		{
			return m_sComments;
		}

		public function set Comments(value:String):void
		{
			m_sComments = value;
		}

		public function get File():String
		{
			return m_sFile;
		}

		public function set File(value:String):void
		{
			m_sFile = value;
		}

		public function get Ranage():String
		{
			return m_sRanage;
		}

		public function set Ranage(value:String):void
		{
			m_sRanage = value;
		}

		public function FromXML(x:XML):void
		{
			Status 		= x.@[XmlConstants.STATUS];
			Comments	= x.@[XmlConstants.COMMENTS];
			File 		= x.@[XmlConstants.FILE];
			Ranage		= x.@[XmlConstants.RANAGE];
			
		}
		
		public function ToXML():XML
		{
			var xml:XML = XmlUtils.getNodeByTagName( "Result" );
			xml.@[XmlConstants.STATUS]		= Status;
			xml.@[XmlConstants.COMMENTS]	= Comments;
			xml.@[XmlConstants.FILE]		= File;
			xml.@[XmlConstants.RANAGE]		= Ranage;
			
			return xml;
		}

	}
}