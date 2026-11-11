package com.gazuntite.patient.visit.event.assessment.plan.followup
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;

	
	public class LoadFollowupDataControlTypeEvent extends CairngormEvent
	{
		public var callback:Function;	
		
		public function LoadFollowupDataControlTypeEvent(callback:Function ) 
		{
			super( QIController.LOAD_FOLLOW_UP_DATE_CONTROL_TYPE_EVENT);	
			this.callback = callback;
		}
	}
}