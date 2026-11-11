package com.gazuntite.input.event.visit.assessment.plan.followup
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class ManagePatientFollowUpEvent extends CairngormEvent
	{
		public var sectionName:String;
		
		public function ManagePatientFollowUpEvent(_sectionName:String)
		{
			super (QIController.MANAGE_PATIENT_FOLLOW_UP_EVENT);
			
			sectionName = _sectionName;
		}
	}
}