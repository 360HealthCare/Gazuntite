package com.gazuntite.input.event.visit.assessment.plan.followup
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class LoadFollowUpInstructionAgeValueTypeEvent extends CairngormEvent
	{
		public function LoadFollowUpInstructionAgeValueTypeEvent()
		{
			super(QIController.LOAD_INSTRUCTION_AGE_VALUE_TYPE_EVENT);
		}
	}
}