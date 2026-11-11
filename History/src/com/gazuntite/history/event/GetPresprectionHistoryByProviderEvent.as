package com.gazuntite.history.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.history.controller.HistoryController;

	public class GetPresprectionHistoryByProviderEvent extends CairngormEvent
	{
		
		public var callback:Function;
		public var sectionID:int;
		public var GaxenID:String;
		public var PatientGaxenID:String;
		
		public function GetPresprectionHistoryByProviderEvent()
		{
			super(HistoryController.PRESPRECTION_HISTORY_LIST_BY_PROVIDER_ID);
		}
	}
}