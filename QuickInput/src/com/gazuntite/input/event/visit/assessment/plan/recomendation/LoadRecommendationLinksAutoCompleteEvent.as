package com.gazuntite.input.event.visit.assessment.plan.recomendation
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

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