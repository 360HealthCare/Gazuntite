package com.gazuntite.input.event.visit.assessment.plan.recomendation
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class LoadAllRecommendationDurationTypesEvent extends CairngormEvent
	{
		public function LoadAllRecommendationDurationTypesEvent()
		{
			super( QIController.LOAD_ALL_DURATION_TYPES_EVENT);
		}
	}
}