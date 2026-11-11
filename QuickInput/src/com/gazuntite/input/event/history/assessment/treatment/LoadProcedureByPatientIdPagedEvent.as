package com.gazuntite.input.event.history.assessment.treatment
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;
	
	public class LoadProcedureByPatientIdPagedEvent extends CairngormEvent
	{
		public function LoadProcedureByPatientIdPagedEvent()
		{
			super(QIController.LOAD_PROCEDURE_BY_PATIENT_ID_PAGED_EVENT);
		}
	}
}