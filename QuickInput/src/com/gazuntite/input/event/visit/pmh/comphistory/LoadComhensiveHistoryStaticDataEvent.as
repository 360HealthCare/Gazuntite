package com.gazuntite.input.event.visit.pmh.comphistory
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;
	
	public class LoadComhensiveHistoryStaticDataEvent extends CairngormEvent
	{
		public function LoadComhensiveHistoryStaticDataEvent()
		{			
			super(QIController.LOAD_COMHENSIVE_HISTORY_STATIC_DATA);
		}
	}
}