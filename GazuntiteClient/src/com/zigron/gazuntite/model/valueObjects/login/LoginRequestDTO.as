package com.zigron.gazuntite.model.valueObjects.login
{
	import com.gazuntite.common.util.xml.XmlUtils;

	[Bindable]
	public class LoginRequestDTO
	{
		
		private var _userID:String;

		public function get userID():String
		{
			return _userID;
		}

		public function set userID(value:String):void
		{
			_userID = value;
		}

		private var _password:String;

		public function get password():String
		{
			return _password;
		}

		public function set password(value:String):void
		{
			_password = value;
		}

		private var _kickOutOldSession:Boolean;

		public function get kickOutOldSession():Boolean
		{
			return _kickOutOldSession;
		}

		public function set kickOutOldSession(value:Boolean):void
		{
			_kickOutOldSession = value;
		}

		
		public function LoginRequestDTO(userID:String, password:String)
		{
			this.userID 	= userID;
			this.password 	= password;
		}
		
		public function ToXML():XML
		{
			var x:XML = XmlUtils.getNodeByTagName("LoginRequestDTO");
			
			x.@UserID 				= userID;
			x.@Password 			= password;
			x.@KickOutOldSession 	= kickOutOldSession;
			
			return x;
		}
	}
}