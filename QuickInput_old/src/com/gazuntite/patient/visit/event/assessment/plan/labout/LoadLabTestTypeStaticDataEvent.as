package com.gazuntite.patient.visit.event.assessment.plan.labout
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class LoadLabTestTypeStaticDataEvent extends CairngormEvent
	{
		public function LoadLabTestTypeStaticDataEvent()
		{
			super(QIController.LOAD_LAB_TEST_TYPE_STATIC_DATA_EVENT);
		}
	}
}