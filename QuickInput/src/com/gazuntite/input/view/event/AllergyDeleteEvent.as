package com.gazuntite.input.view.event
{
	import flash.events.Event;
	
	public class AllergyDeleteEvent extends Event
	{
		public static const ALLERGY_DELETE_EVENT:String = "AllergyDeleteEvent";
		public var gaxenAllergyID:String;
		
		public function AllergyDeleteEvent(_gaxenAllergyID:String)
		{
			super (ALLERGY_DELETE_EVENT, true, true);
			this.gaxenAllergyID = _gaxenAllergyID;
		}
	}
}