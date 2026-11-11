package com.gazuntite.input.event.visit.assessment.plan.labout
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class LoadPatientLabsByVisitEvent extends CairngormEvent
	{
		public function LoadPatientLabsByVisitEvent()
		{
			super(QIController.LOAD_PATIENT_LABS_BY_VISIT_ID_EVENT)
		}
	}
}