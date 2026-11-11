package com.gazuntite.input.event.visit.assessment.plan.followup
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;
	
	public class LoadFollowUpPatientLabTestTypesByPatientIdEvent extends CairngormEvent
	{
		public function LoadFollowUpPatientLabTestTypesByPatientIdEvent()
		{
			super(QIController.LOAD_FOLLOW_UP_PATIENT_LAB_TEST_TYPES_BY_PATIENT_ID_EVENT);
		}
	}
}