package com.gazuntite.input.event.visit.assessment.plan.recomendation
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class LoadPatientRecommendationByVisitIdEvent extends CairngormEvent
	{
		public function LoadPatientRecommendationByVisitIdEvent()
		{
			super(QIController.LOAD_PATIENT_RECOMMENDATION_BY_VISIT_ID_EVENT);
		}
	}
}