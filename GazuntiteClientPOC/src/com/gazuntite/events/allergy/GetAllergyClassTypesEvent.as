package com.gazuntite.events.allergy
{
	import flash.events.Event;
	
	public class GetAllergyClassTypesEvent extends Event
	{
		public static const GET_ALLERGY_CLASS_TYPES:String = "getAllergyClassTypesEvent";
		
		public function GetAllergyClassTypesEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(GET_ALLERGY_CLASS_TYPES, bubbles, cancelable);
		}
		
		override public function clone():Event {
			return new  GetAllergyClassTypesEvent(this.bubbles, this.cancelable);
		}
	}
}