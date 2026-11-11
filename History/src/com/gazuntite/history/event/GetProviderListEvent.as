package com.gazuntite.history.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.history.controller.HistoryController;
	
	public class GetProviderListEvent extends CairngormEvent
	{
		public function GetProviderListEvent()
		{
			super(HistoryController.LIST_PATIENT_VISIT_PROVIDER);
		}
	}
}