package com.gazuntite.patient.visit.event.assessment.plan.followup
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class LoadFollowUpInstructionAgeValueTypesEvents extends CairngormEvent
	{
		public function LoadFollowUpInstructionAgeValueTypesEvents()
		{
			super(QIController.LOAD_INSTRUCTION_AGE_VALUE_TYPE_EVENT);
		}
	}
}