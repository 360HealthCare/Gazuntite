package com.gazuntite.history.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.history.controller.HistoryController;
	
	public class GetHistoryByProviderEvent extends CairngormEvent
	{
		
		public var callback:Function;
		public var sectionID:int;
		public var providerID:int;
		
		public function GetHistoryByProviderEvent()
		{
			super(HistoryController.HISTORY_LIST_BY_PROVIDER_ID);
		}
	}
}