package com.gazuntite.patient.visit.event.assessment.plan.recomendation
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class ManagePatientRecommendationEvent extends CairngormEvent
	{
		public function ManagePatientRecommendationEvent()
		{
			super(QIController.MANAGE_PATIENT_RECOMMANDATION_EVENT);
		}
	}
}