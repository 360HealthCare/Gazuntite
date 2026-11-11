package com.gazuntite.input.event.visit.assessment.treatment.procedure
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class ManagePatientProcedureEvent extends CairngormEvent
	{
		public var sectioName:String;
		
		public function ManagePatientProcedureEvent(_sectionName:String)
		{
			super (QIController.MANAGE_PATIENT_PROCEDURE_EVENT);
			
			this.sectioName = _sectionName;
		}
	}
}