package com.gazuntite.patient.visit.event.assessment.plan.followup
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class LoadFollowUpMergeByVisitIdEvent extends CairngormEvent
	{
		public function LoadFollowUpMergeByVisitIdEvent()
		{
			super(QIController.LOAD_FOLLOW_UP_MERGE_BY_VISIT_ID_EVENT);
		}
	}
}