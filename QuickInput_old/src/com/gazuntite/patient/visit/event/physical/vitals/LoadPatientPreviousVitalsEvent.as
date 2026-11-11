package com.gazuntite.patient.visit.event.physical.vitals
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	public class LoadPatientPreviousVitalsEvent extends CairngormEvent
	{
		public var func:Function;
		public function LoadPatientPreviousVitalsEvent(_func:Function)
		{
			super(QIController.LOAD_PATIENT_PREVIOUS_VITALS_EVENT)
			this.func = _func;
		}
	}
}