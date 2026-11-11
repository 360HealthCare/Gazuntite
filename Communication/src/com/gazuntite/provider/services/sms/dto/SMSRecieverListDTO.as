package com.gazuntite.provider.services.sms.dto
{
	import com.gazuntite.provider.services.sms.util.XMLUtil;
	import com.gazuntite.provider.services.sms.util.XmlConstants;

	[Bindable]
	public class SMSRecieverListDTO
	{
		private 	var _userId:int;
		private var _phoneNumber:String;
		public function SMSRecieverListDTO()
		{
		}

		public function get userId():int
		{
			return _userId;
		}

		public function set userId(value:int):void
		{
			_userId = value;
		}

		public function get phoneNumber():String
		{
			return _phoneNumber;
		}

		public function set phoneNumber(value:String):void
		{
			_phoneNumber = value;
		}

		public function ToXML(userID:int,phoneNumber:String):XML
		{
			var xml:XML = XMLUtil.getNodeByTagName( "SMSRecieverList" );
			xml.@[XmlConstants.USER_ID]					= userID;
			xml.@[XmlConstants.PHONE_NUMBER]			= phoneNumber;
			return xml;
		}

	}
}