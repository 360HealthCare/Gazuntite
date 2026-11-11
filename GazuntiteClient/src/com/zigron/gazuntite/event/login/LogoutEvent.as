package com.zigron.gazuntite.event.login
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.zigron.gazuntite.controller.GazuntiteClientController;

	public class LogoutEvent extends CairngormEvent
	{
		public var Callback:Function;
		
		public function LogoutEvent(callback:Function)
		{
			super(GazuntiteClientController.LOGOUT_EVENT);
			this.Callback = callback;
		}
	}
}