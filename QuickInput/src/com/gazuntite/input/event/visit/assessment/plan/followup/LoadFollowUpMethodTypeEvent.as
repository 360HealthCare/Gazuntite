package com.gazuntite.input.event.visit.assessment.plan.followup
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class LoadFollowUpMethodTypeEvent extends CairngormEvent
	{
		public function LoadFollowUpMethodTypeEvent()
		{
			super(QIController.LOAD_FOLLOW_UP_METHOD_TYPE_EVENT);
		}
	}
}