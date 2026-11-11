package com.gazuntite.provider.live.services.diabetes.view.event
{
	import flash.events.Event;
	
	public class DiabeticSelectionEvent extends Event
	{
		public static const  EYE_CLICKED:String = 'EYE_CLICKED';
		public static const  LUNG_CLICKED:String = 'LUNG_CLICKED';
		public static const  FOOT_CLICKED:String = 'FOOT_CLICKED';
		
		public function DiabeticSelectionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}