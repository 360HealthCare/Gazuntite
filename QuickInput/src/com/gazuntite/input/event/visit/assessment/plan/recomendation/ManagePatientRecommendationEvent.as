package com.gazuntite.input.event.visit.assessment.plan.recomendation
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class ManagePatientRecommendationEvent extends CairngormEvent
	{
		public var sectionName:String;
		
		public function ManagePatientRecommendationEvent(_sectionName:String)
		{
			super(QIController.MANAGE_PATIENT_RECOMMANDATION_EVENT);
			
			sectionName = _sectionName;
		}
	}
}