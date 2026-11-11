package com.gazuntite.input.event.visit.physical.vitals
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class LoadPatientVitalByVisitEvent extends CairngormEvent
	{
		public var  fun:Function;
		public function LoadPatientVitalByVisitEvent(fun:Function = null)
		{
			this.fun = fun;
			super(QIController.LOAD_PATIENT_MOST_RECENT_VITALS_EVENT);
		}
	}
}