package com.gazuntite.input.event.visit.assessment.plan.labout
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class LoadLabTypeStaticDataEvent extends CairngormEvent
	{
		public function LoadLabTypeStaticDataEvent()
		{
			super(QIController.LOAD_LAB_LAB_TYPE_STATIC_DATA_EVENT);
		}
	}
}