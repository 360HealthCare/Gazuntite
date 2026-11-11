package com.gazuntite.provider.live.services.diabetes.view.event
{
	import flash.events.Event;
	
	public class DiabetesSearchEvent extends Event
	{
		public var SearchString:String;
		public static const  DIABETIC_SEARCH_EVENT:String = 'DIABETIC_SEARCH_EVENT';
		public var callback:Function; 
		
		public function DiabetesSearchEvent(type:String ,bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}