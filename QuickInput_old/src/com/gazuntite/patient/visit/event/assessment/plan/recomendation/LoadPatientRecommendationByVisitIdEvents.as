package com.gazuntite.patient.visit.event.assessment.plan.recomendation
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class LoadPatientRecommendationByVisitIdEvents extends CairngormEvent
	{
		public function LoadPatientRecommendationByVisitIdEvents()
		{
			super(QIController.LOAD_PATIENT_RECOMMENDATION_BY_VISIT_ID_EVENT);
		}
	}
}