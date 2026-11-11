package com.gazuntite.patient.visit.view.events
{
	import flash.events.Event;
	
	public class SyncPatientGaxenIDEvent extends Event
	{
		public static const SYNC_PATIENT_GAXEN_ID_EVENT:String = "SyncPatientGaxenIDEvent";
		
		public var GaxenID:String;
		
		public function SyncPatientGaxenIDEvent(_GaxenID:String)
		{
			super(SYNC_PATIENT_GAXEN_ID_EVENT, true, false);
			GaxenID 		= _GaxenID;
		}
	}
}