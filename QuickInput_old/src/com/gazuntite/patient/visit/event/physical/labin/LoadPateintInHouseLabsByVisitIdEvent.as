package com.gazuntite.patient.visit.event.physical.labin
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class LoadPateintInHouseLabsByVisitIdEvent extends CairngormEvent
	{
		public function LoadPateintInHouseLabsByVisitIdEvent()
		{
			super(QIController.LOAD_LABIN_BY_VISIT_ID_EVENT)
		}
	}
}