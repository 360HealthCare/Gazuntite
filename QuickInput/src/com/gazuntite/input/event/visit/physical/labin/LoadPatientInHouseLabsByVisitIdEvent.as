package com.gazuntite.input.event.visit.physical.labin
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class LoadPatientInHouseLabsByVisitIdEvent extends CairngormEvent
	{
		public var onInHouseLabLoadCallBack:Function;
		
		public function LoadPatientInHouseLabsByVisitIdEvent()
		{
			super(QIController.LOAD_LABIN_BY_VISIT_ID_EVENT)
		}
	}
}