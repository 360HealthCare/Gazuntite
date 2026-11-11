package com.gazuntite.input.event.visit.assessment.plan.labout
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class LoadLabTestOrderMethodTypeEvent extends CairngormEvent
	{
		public function LoadLabTestOrderMethodTypeEvent()
		{
			super(QIController.LOAD_LAB_LAB_TEST_ORDER_METHOD_TYPE_STATIC_DATA_EVENT);
		}
	}
}