package com.gazuntite.input.event.visit.assessment.plan.followup
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;
	import com.gazuntite.input.model.QIModelLocator;

	public class LoadFollowUpServiceTypeEvent extends CairngormEvent
	{
		public var followupDataControlTypeID:int;
		public var searchTerm:String;
		
		public function LoadFollowUpServiceTypeEvent(followupDataControlTypeID:int, searchTerm:String)
		{
			super( QIController.LOAD_SERVICE_TYPE_EVENT);
			this.followupDataControlTypeID = followupDataControlTypeID;
			this.searchTerm = searchTerm;
		}
	}
}