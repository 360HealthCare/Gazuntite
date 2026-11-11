package com.gazuntite.patient.visit.event.assessment.plan.followup
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class LoadFollowUpMethodTypeEvent extends CairngormEvent
	{
		public function LoadFollowUpMethodTypeEvent()
		{
			super(QIController.LOAD_FOLLOW_UP_METHOD_TYPE_EVENT);
		}
	}
}