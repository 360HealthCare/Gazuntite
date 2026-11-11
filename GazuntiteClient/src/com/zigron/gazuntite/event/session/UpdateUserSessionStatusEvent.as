package com.zigron.gazuntite.event.session
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.zigron.gazuntite.controller.GazuntiteClientController;
	
	import mx.containers.ApplicationControlBar;

	public class UpdateUserSessionStatusEvent extends CairngormEvent
	{
		public function UpdateUserSessionStatusEvent()
		{
			super(GazuntiteClientController.UPDATE_USER_SESSION_STATUS);
		}
	}
}