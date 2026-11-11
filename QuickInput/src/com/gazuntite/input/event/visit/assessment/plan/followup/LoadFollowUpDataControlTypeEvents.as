package com.gazuntite.input.event.visit.assessment.plan.followup
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	
	public class LoadFollowUpDataControlTypeEvents extends CairngormEvent
	{
		public var callback:Function;	
		
		public function LoadFollowUpDataControlTypeEvents(callback:Function ) 
		{
			super( QIController.LOAD_FOLLOW_UP_DATE_CONTROL_TYPE_EVENT);	
			this.callback = callback;
		}
	}
}