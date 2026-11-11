package com.gazuntite.input.event.visit.assessment.plan.recomendation
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class LoadAllRecommendationPlanTypesEvent extends CairngormEvent
	{
		public function LoadAllRecommendationPlanTypesEvent()
		{
			super(QIController.LOAD_ALL_RECOMMENDATION_PLAN_TYPES_EVENT);
		}
	}
}