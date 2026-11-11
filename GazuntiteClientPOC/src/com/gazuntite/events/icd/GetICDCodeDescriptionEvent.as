package com.gazuntite.events.icd
{
	import flash.events.Event;
	
	public class GetICDCodeDescriptionEvent extends Event
	{
		public static const GET_ICD_CODE_DESCRIPTION:String = "getICDCodeDescriptionEvent";
		
		public function GetICDCodeDescriptionEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(GET_ICD_CODE_DESCRIPTION, bubbles, cancelable);
		}
		
		override public function clone():Event 
		{
			return new  GetICDCodeDescriptionEvent(this.bubbles, this.cancelable);
		}
	}
}