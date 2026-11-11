package com.gazuntite.input.event.history.assessment.plan.recommendation
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;
	
	public class LoadRecommendationByPatientIdPagedEvent extends CairngormEvent
	{
		public function LoadRecommendationByPatientIdPagedEvent()
		{
			super(QIController.LOAD_RECOMMENDATION_BY_PATIENT_ID_PAGED_EVENT);
		}
	}
}