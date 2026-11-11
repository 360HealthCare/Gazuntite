package com.gazuntite.input.event.visit.assessment.plan.recomendation
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class LoadAllRecommendationMethodTypesEvent extends CairngormEvent
	{
		public function LoadAllRecommendationMethodTypesEvent()
		{
			super(QIController.LOAD_ALL_RECOMMENDATION_METHOD_TYPES_EVENT);
		}
	}
}