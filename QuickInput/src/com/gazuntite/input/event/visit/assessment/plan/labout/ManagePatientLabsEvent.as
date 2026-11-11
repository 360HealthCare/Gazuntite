package com.gazuntite.input.event.visit.assessment.plan.labout
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class ManagePatientLabsEvent extends CairngormEvent
	{
		public var sectionName:String;
		
		public function ManagePatientLabsEvent(_sectionName:String)
		{
			super (QIController.MANAGE_PATIENT_LABOUT_EVENT);
			
			sectionName = _sectionName;
		}
	}
}