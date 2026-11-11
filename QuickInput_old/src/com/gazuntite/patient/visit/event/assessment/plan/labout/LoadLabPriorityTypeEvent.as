package com.gazuntite.patient.visit.event.assessment.plan.labout
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class LoadLabPriorityTypeEvent extends CairngormEvent
	{
		public function LoadLabPriorityTypeEvent()
		{
			super(QIController.LOAD_LAB_PRIORITY_STATIC_DATA_EVENT);
		}
	}
}