package com.gazuntite.input.event.visit.assessment.plan.followup
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class LoadFollowUpInstructionDurationTypeEvents extends CairngormEvent
	{
		public function LoadFollowUpInstructionDurationTypeEvents()
		{
			super(QIController.LOAD_INSTRUCTION_DURATION_TYPE_EVENT);
		}
	}
}