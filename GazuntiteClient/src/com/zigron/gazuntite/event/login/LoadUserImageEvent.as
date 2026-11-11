package com.zigron.gazuntite.event.login
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.zigron.gazuntite.controller.GazuntiteClientController;
	
	public class LoadUserImageEvent extends CairngormEvent
	{
		
		public function LoadUserImageEvent()
		{
			super(GazuntiteClientController.LOAD_USER_IMAGE_EVENT);
			
		}
	}
}