package com.gazuntite.patient.visit.event.assessment.plan.labout
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class LoadLabTestOrderMethodTypeEvent extends CairngormEvent
	{
		public function LoadLabTestOrderMethodTypeEvent()
		{
			super(QIController.LOAD_LAB_LAB_TEST_ORDER_METHOD_TYPE_STATIC_DATA_EVENT);
		}
	}
}