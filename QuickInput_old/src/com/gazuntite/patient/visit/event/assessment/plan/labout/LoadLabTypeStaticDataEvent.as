package com.gazuntite.patient.visit.event.assessment.plan.labout
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class LoadLabTypeStaticDataEvent extends CairngormEvent
	{
		public function LoadLabTypeStaticDataEvent()
		{
			super(QIController.LOAD_LAB_LAB_TYPE_STATIC_DATA_EVENT);
		}
	}
}