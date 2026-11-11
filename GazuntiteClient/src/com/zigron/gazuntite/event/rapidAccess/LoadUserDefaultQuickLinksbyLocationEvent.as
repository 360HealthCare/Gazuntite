package com.zigron.gazuntite.event.rapidAccess
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.zigron.gazuntite.controller.GazuntiteClientController;
	
	public class LoadUserDefaultQuickLinksbyLocationEvent extends CairngormEvent
	{
		public static const LOAD_USER_DEFAULT_QUICK_LINKS_BY_LOCATION:String = "LoadUserDefaultQuickLinksbyLocation";
		
		public function LoadUserDefaultQuickLinksbyLocationEvent()
		{
			super(GazuntiteClientController.LOAD_USER_DEFAULT_QUICK_LINKS_BY_LOCATION);
		}
	}
}