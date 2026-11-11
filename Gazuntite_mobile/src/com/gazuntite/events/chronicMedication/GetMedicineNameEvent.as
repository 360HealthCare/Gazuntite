package com.gazuntite.events.chronicMedication
{
	import flash.events.Event;
	
	public class GetMedicineNameEvent extends Event
	{
		public static var GET_MEDICINE_NAME:String = "getMedicineNameEvent";
		
		public function GetMedicineNameEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(GET_MEDICINE_NAME, bubbles, cancelable);
		}
		
		public override function clone():Event
		{
			return new GetMedicineNameEvent( this.bubbles, this.cancelable );
		}
	}
}