package com.gazuntite.provider.live.services.elab.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.elab.appController.ELabsController;
	
	public class LoadeLabsStaticDataEvent extends CairngormEvent
	{
		public function LoadeLabsStaticDataEvent()
		{
			super(ELabsController.LOAD_SEARCH_FIELDS_EVENT);
		}
	}
}