package com.gazuntite.provider.live.services.diabetes.view.event
{
	import flash.events.Event;

	public class DiabeticDetailEvent extends Event
	{
		
		public var selectedOrganIndex:int;
		public static const  DIABETIC_DETAIL_EVENT:String = 'DIABETIC_DETAIL_EVENT';
		
		
		public function DiabeticDetailEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}