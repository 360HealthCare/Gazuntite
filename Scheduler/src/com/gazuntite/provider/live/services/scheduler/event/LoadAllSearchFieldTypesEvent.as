package com.gazuntite.provider.live.services.scheduler.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.scheduler.appControllerSCH.SchedulerController;
	
	public class LoadAllSearchFieldTypesEvent extends CairngormEvent
	{
		public function LoadAllSearchFieldTypesEvent()
		{
			super(SchedulerController.LOAD_ALL_SEARCH_FIELDS_TYPES_EVENT);
		}
	}
}