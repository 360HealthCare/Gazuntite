package com.gazuntite.provider.search.services.patient.view.events
{
	
	import flash.events.Event;
	
	
	public class PatientSelectedEvent extends Event
	{
		public static const PATIENT_SELECTED:String 		= "PatientSelected";
		public var selection:Object;
		
		public function PatientSelectedEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			var clon:PatientSelectedEvent = new PatientSelectedEvent( type, bubbles, cancelable );
			clon.selection = this.selection;
			
			return clon;
		}
	}
}