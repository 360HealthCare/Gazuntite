package com.gazuntite.events.cpt
{
	import flash.events.Event;
	
	public class GetCPTProcedureEvent extends Event
	{
		public static const GET_CPT_PROCEDURE:String = "getCPTProcedureEvent";
		
		public function GetCPTProcedureEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(GET_CPT_PROCEDURE, bubbles, cancelable);
		}
		
		override public function clone():Event 
		{
			return new  GetCPTProcedureEvent(this.bubbles, this.cancelable);
		}
	}
}