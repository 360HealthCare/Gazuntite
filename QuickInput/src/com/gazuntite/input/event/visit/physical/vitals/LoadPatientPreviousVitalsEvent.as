package com.gazuntite.input.event.visit.physical.vitals
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class LoadPatientPreviousVitalsEvent extends CairngormEvent
	{
		public var func:Function;
		public function LoadPatientPreviousVitalsEvent(_func:Function = null)
		{
			super(QIController.LOAD_PATIENT_PREVIOUS_VITALS_EVENT)
			this.func = _func;
		}
	}
}