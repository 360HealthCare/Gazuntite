package com.gazuntite.patient.visit.event.assessment.plan.followup
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class LoadFollowUpInstructionAgeTypesEvent extends CairngormEvent
	{
		public function LoadFollowUpInstructionAgeTypesEvent()
		{
			super( QIController.LOAD_INSTRUCTION_AGE_TYPE_EVENT);
		}
	}
}