package com.gazuntite.common.dto
{
	import com.gazuntite.common.util.xml.XmlConstants;
	import com.gazuntite.common.util.xml.XmlUtils;

	public class ErrorReportDTO
	{
		public function ErrorReportDTO()
		{
		}
		
		
		private var _EmailTemplateID		:int;

		private var _Subject 				:String;
		private var _Message 				:String;
		private var _SenderID 			:int;
		
		public function get EmailTemplateID():int
		{
			return _EmailTemplateID;
		}

		public function set EmailTemplateID(value:int):void
		{
			_EmailTemplateID = value;
		}

		public function get Subject():String
		{
			return _Subject;
		}

		public function set Subject(value:String):void
		{
			_Subject = value;
		}

		public function get Message():String
		{
			return _Message;
		}

		public function set Message(value:String):void
		{
			_Message = value;
		}

		public function get SenderID():int
		{
			return _SenderID;
		}

		public function set SenderID(value:int):void
		{
			_SenderID = value;
		}

	
		
		
		public function ToXML():XML
		{
			var xml:XML = XmlUtils.getNodeByTagName("Email");
			xml.@[XmlConstants.EMAIL_TEMPLATE_ID] = EmailTemplateID;
			xml.@[XmlConstants.MESSAGE] = Message;
			xml.@[XmlConstants.SUBJECT] = Subject;
			xml.@[XmlConstants.SENDER_ID] = SenderID;
			
			return xml;
		}
		
	}
}