package com.gazuntite.patient.visit.event.assessment.treatment.procedure
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class ManagePatientProcedureEvent extends CairngormEvent
	{
		public function ManagePatientProcedureEvent()
		{
			super(QIController.MANAGE_PATIENT_PROCEDURE_EVENT);
		}
	}
}