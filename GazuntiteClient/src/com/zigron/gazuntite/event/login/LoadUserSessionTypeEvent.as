package com.zigron.gazuntite.event.login
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.zigron.gazuntite.controller.GazuntiteClientController;
	
	import mx.containers.ApplicationControlBar;

	public class LoadUserSessionTypeEvent extends CairngormEvent
	{
		public function LoadUserSessionTypeEvent()
		{
			super(GazuntiteClientController.Load_USER_SESSION_TYPES);
		}
	}
}