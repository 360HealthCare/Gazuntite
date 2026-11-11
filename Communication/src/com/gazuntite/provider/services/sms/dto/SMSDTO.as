package com.gazuntite.provider.services.sms.dto
{
	import com.gazuntite.provider.services.sms.util.CommunicationConstant;
	import com.gazuntite.provider.services.sms.util.XMLUtil;
	import com.gazuntite.provider.services.sms.util.XmlConstants;
	
	import mx.utils.XMLUtil;
	
	[Bindable]
	public class SMSDTO
	{
	 private var _clinicBranchID:int;
	 private 	var _userId:int;
	 private var _phoneNumber:String;
	 private var _Text:String;
	 private var _sendAt:String;
	 private var _smsTemplateID:int;
	 private var _isDeleted:Boolean;
	 private var _modifiedBy:int;
	 private var _ModifiedAt:String;
	 private var _createdBy:int;
	 private var _smsRecieverListDTO:SMSRecieverListDTO;
		
		public function SMSDTO()
		{
		}
		public function FromXML(x:XML):void
		{
			var recieverList:XMLList = x.RecieverList.Reciever;
			
			userId = recieverList.@[XmlConstants.USER_ID]
			
			
			Text = x.@[XmlConstants.TEXT];
			sendAt = x.@[XmlConstants.SEND_AT];
		//	userId = x.@[XmlConstants.USER_ID];
			
			/*
			for(var recivers:int =0; recivers<recieverList.length();recivers++)
			{
				var smsDTO:SMSDTOResponse = new SMSDTOResponse();
				userId = recieverList.@[XmlConstants.USER_ID]
				smsDTO.FromXML(SmsList[i]);
				ALLSentSMS.addItem(smsDTO);
			}
			
			*/
		}
		
		public function ToXML():XML
		{
			var xml:XML = com.gazuntite.provider.services.sms.util.XMLUtil.getNodeByTagName("SMS");
			xml.@[XmlConstants.CLINIC_BRANCH_ID] = clinicBranchID;
			xml.@[XmlConstants.PHONE_NUMBER] = phoneNumber;
			xml.@[XmlConstants.IS_DELETED] = isDeleted;
			xml.@[XmlConstants.SEND_AT] = sendAt;
			xml.@[XmlConstants.SMS_TEMPLATE_ID] = smsTemplateID;
			xml.@[XmlConstants.TEXT] = Text;
			xml.@[XmlConstants.USER_ID] = userId;
			xml.@[XmlConstants.CREATED_BY] = createdBy;
			return xml;
		}

	 public function get clinicBranchID():int
	 {
		 return _clinicBranchID;
	 }

	 public function set clinicBranchID(value:int):void
	 {
		 _clinicBranchID = value;
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

	 public function get Text():String
	 {
		 return _Text;
	 }

	 public function set Text(value:String):void
	 {
		 _Text = value;
	 }

	 public function get sendAt():String
	 {
		 return _sendAt;
	 }

	 public function set sendAt(value:String):void
	 {
		 _sendAt = value;
	 }

	 public function get smsTemplateID():int
	 {
		 return _smsTemplateID;
	 }

	 public function set smsTemplateID(value:int):void
	 {
		 _smsTemplateID = value;
	 }

	 public function get isDeleted():Boolean
	 {
		 return _isDeleted;
	 }

	 public function set isDeleted(value:Boolean):void
	 {
		 _isDeleted = value;
	 }

	 public function get modifiedBy():int
	 {
		 return _modifiedBy;
	 }

	 public function set modifiedBy(value:int):void
	 {
		 _modifiedBy = value;
	 }

	 public function get ModifiedAt():String
	 {
		 return _ModifiedAt;
	 }

	 public function set ModifiedAt(value:String):void
	 {
		 _ModifiedAt = value;
	 }

	 public function get smsRecieverListDTO():SMSRecieverListDTO
	 {
		 return _smsRecieverListDTO;
	 }

	 public function set smsRecieverListDTO(value:SMSRecieverListDTO):void
	 {
		 _smsRecieverListDTO = value;
	 }

	 public function get createdBy():int
	 {
		 return _createdBy;
	 }

	 public function set createdBy(value:int):void
	 {
		 _createdBy = value;
	 }


	}
}