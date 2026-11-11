package com.gazuntite.input.event.visit.assessment.treatment.procedure
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class LoadProcedureByVisitIDEvent extends CairngormEvent
	{
		
		
		public function LoadProcedureByVisitIDEvent()
		{
			super(QIController.LOAD_PROCEDURE_BY_VISIT_ID_EVENT);
		}
	}
}