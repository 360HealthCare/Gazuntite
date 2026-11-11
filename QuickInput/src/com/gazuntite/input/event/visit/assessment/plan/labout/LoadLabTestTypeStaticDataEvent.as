package com.gazuntite.input.event.visit.assessment.plan.labout
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class LoadLabTestTypeStaticDataEvent extends CairngormEvent
	{
		public function LoadLabTestTypeStaticDataEvent()
		{
			super(QIController.LOAD_LAB_TEST_TYPE_STATIC_DATA_EVENT);
		}
	}
}