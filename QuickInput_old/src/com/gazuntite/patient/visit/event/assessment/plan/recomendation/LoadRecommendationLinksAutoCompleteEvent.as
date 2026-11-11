package com.gazuntite.patient.visit.event.assessment.plan.recomendation
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class LoadRecommendationLinksAutoCompleteEvent extends CairngormEvent 
	{
		public var searchString:String;
		
		public function LoadRecommendationLinksAutoCompleteEvent(searchString:String)
		{
			super(QIController.LOAD_RECOMMENDATION_LINK_AUTO_COMPLETE_EVENT);
			this.searchString = searchString;
		}
	}
}