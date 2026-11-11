package com.zigron.gazuntite.event.login
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.zigron.gazuntite.controller.GazuntiteClientController;

	public class ResetPasswordEvent extends CairngormEvent
	{
		public var email	 : String;
		public var callBack  : Function;
		
		public function ResetPasswordEvent(email:String , callBack:Function)
		{
			super(GazuntiteClientController.RESET_USER_PASSWORD_EVENT );
			this.email 		= email;
			this.callBack  = callBack;
		}
	}
}