package com.gazuntite.patient.visit.event.assessment.plan.recomendation
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class LoadAllRecommendationMethodTypesEvent extends CairngormEvent
	{
		public function LoadAllRecommendationMethodTypesEvent()
		{
			super(QIController.LOAD_ALL_RECOMMENDATION_METHOD_TYPES_EVENT);
		}
	}
}