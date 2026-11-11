package com.gazuntite.patient.visit.event.assessment.treatment.procedure
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class LoadProcedureByVisitIDEvent extends CairngormEvent
	{
		
		
		public function LoadProcedureByVisitIDEvent()
		{
			super(QIController.LOAD_PROCEDURE_BY_VISIT_ID_EVENT);
		}
	}
}