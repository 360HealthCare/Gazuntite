package com.gazuntite.input.event.visit.assessment.plan.labout
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class LoadLabSpecimenTypeStaticDataEvent extends CairngormEvent
	{
		public function LoadLabSpecimenTypeStaticDataEvent()
		{
			super(QIController.LOAD_LAB_SPECIMEN_TYPE_STATIC_DATA_EVENT);
		}
	}
}