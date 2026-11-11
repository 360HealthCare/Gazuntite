package com.gazuntite.patient.visit.event.pmh.comphistory
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;
	
	public class LoadComhensiveHistoryStaticDataEvent extends CairngormEvent
	{
		public function LoadComhensiveHistoryStaticDataEvent()
		{
			super(QIController.LOAD_COMHENSIVE_HISTORY_STATIC_DATA);
		}
	}
}