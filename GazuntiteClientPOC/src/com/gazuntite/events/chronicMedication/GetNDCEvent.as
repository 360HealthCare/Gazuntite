package com.gazuntite.events.chronicMedication
{
	import flash.events.Event;
	
	public class GetNDCEvent extends Event
	{
		public static const GET_NDC:String = "getNDCEvent"
		public function GetNDCEvent( bubbles:Boolean=false, cancelable:Boolean=false )
		{
			super(GET_NDC, bubbles, cancelable);
		}
		
		public override function clone():Event
		{
			return new GetNDCEvent( this.bubbles, this.cancelable );
		}
	}
}