package com.gazuntite.input.event.visit.assessment.plan.followup
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class LoadFollowUpInstructionAgeTypeEvent extends CairngormEvent
	{
		public function LoadFollowUpInstructionAgeTypeEvent()
		{
			super( QIController.LOAD_INSTRUCTION_AGE_TYPE_EVENT);
		}
	}
}