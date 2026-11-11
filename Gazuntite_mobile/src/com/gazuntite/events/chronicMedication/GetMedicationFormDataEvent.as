package com.gazuntite.events.chronicMedication
{
	import flash.events.Event;

	public class GetMedicationFormDataEvent extends Event
	{
		public static const GET_MEDICATION_FORM_DATA:String = "getMedicationFormDataEvent";
		
		public function GetMedicationFormDataEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(GET_MEDICATION_FORM_DATA, bubbles, cancelable);
		}
		
		override public function clone():Event {
			return new  GetMedicationFormDataEvent(this.bubbles, this.cancelable);
		}
	}
}