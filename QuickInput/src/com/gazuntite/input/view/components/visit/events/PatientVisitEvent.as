package com.gazuntite.input.view.components.visit.events
{
	import flash.events.Event;

	public class PatientVisitEvent extends Event
	{
		
			public static const PATIENT_VISIT_SAVED:String = "patientVisitSaved";
			public static const PATIENT_VISIT_SIGNED:String = "patientVisitSigned";
			public static const PATIENT_VISIT_COSIGNED:String = "patientVisitCosigned";
			
			public var visitId:int;
			
			public function PatientVisitEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
			{
				super(type, bubbles, cancelable);
			}
		
	}
}