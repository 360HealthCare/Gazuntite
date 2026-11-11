package com.gazuntite.patient.visit.event.assessment.plan.followup
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class LoadFollowupInstructionDurationTypeEvent extends CairngormEvent
	{
		public function LoadFollowupInstructionDurationTypeEvent()
		{
			super(QIController.LOAD_INSTRUCTION_DURATION_TYPE_EVENT);
		}
	}
}