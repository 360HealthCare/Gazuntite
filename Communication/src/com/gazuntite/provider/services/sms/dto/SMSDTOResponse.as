package com.gazuntite.provider.services.sms.dto
{
	import com.gazuntite.provider.services.sms.util.XmlConstants;
	
	[Bindable]
	public class SMSDTOResponse
	{
		
		private var _Message:String;
		private var _SendAt:String;
		private var _userID:String = '';
		private var _isSelected:Boolean;
		private var _currentPage:int;
		private var _totalPages:int;
		private var _smsID:int
		private var _smsRecieverList:SMSRecieverListDTO;
		
	
		public function get Message():String
		{
			return _Message;
		}

		public function set Message(value:String):void
		{
			_Message = value;
		}

		public function get SendAt():String
		{
			return _SendAt;
		}

		public function set SendAt(value:String):void
		{
			_SendAt = value;
		}

		public function get smsRecieverList():SMSRecieverListDTO
		{
			return _smsRecieverList;
		}

		public function set smsRecieverList(value:SMSRecieverListDTO):void
		{
			_smsRecieverList = value;
		}
		
		public function FromXML(x:XML):void
		{
			var recieverList:XMLList = x.RecieverList.Reciever;
			
			var xx:XML =recieverList[0];
			
			var i:int =0;
			for(i=0;i<recieverList.length();i++)
			{
				userID  += recieverList[i].@[XmlConstants.TO]+";";
			}
			//userId = recieverList.@[XmlConstants.USER_ID]
			
			
			Message = x.@[XmlConstants.TEXT];
			SendAt = x.@[XmlConstants.SEND_AT];
			smsID = x.@[XmlConstants.SMS_ID];
			//userID = xx.@[XmlConstants.USER_ID];
			isSelected = false;
			
			
		}

		public function get userID():String
		{
			return _userID;
		}

		public function set userID(value:String):void
		{
			_userID = value;
		}

		public function get isSelected():Boolean
		{
			return _isSelected;
		}

		public function set isSelected(value:Boolean):void
		{
			_isSelected = value;
		}

		public function get currentPage():int
		{
			return _currentPage;
		}

		public function set currentPage(value:int):void
		{
			_currentPage = value;
		}

		public function get totalPages():int
		{
			return _totalPages;
		}

		public function set totalPages(value:int):void
		{
			_totalPages = value;
		}

		public function get smsID():int
		{
			return _smsID;
		}

		public function set smsID(value:int):void
		{
			_smsID = value;
		}


	}
}