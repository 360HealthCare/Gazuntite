package com.gazuntite.patient.visit.event.assessment.plan.recomendation
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class LoadAllRecommendationPlanTypesEvent extends CairngormEvent
	{
		public function LoadAllRecommendationPlanTypesEvent()
		{
			super(QIController.LOAD_ALL_RECOMMENDATION_PLAN_TYPES_EVENT);
		}
	}
}