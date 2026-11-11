package com.zigron.gazuntite.event.login
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.zigron.gazuntite.model.valueObjects.login.LoginRequestDTO;
	
	public class LoginEvent extends CairngormEvent
	{
		public static const LOGIN_REQUEST:String = "loginEvent";
		
		private var _request:LoginRequestDTO;
		public var  callback:Function;

		public function get request():LoginRequestDTO
		{
			return _request;
		}

			
		public function LoginEvent(request:LoginRequestDTO, logInResponse:Function)
		{
			super(LOGIN_REQUEST);
			callback = logInResponse;
			_request = request;
		}
	}
}