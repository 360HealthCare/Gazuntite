package com.gazuntite.input.event.visit.pmh.immunization
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class ManagePatientImmunizationEvent extends CairngormEvent
	{
		public function ManagePatientImmunizationEvent()
		{
			super (QIController.MANAGE_PATIENT_IMMUNIZATION_EVENT);
		}
	}
}