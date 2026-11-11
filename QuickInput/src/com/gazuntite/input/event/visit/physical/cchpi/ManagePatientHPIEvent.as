package com.gazuntite.input.event.visit.physical.cchpi
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;

	public class ManagePatientHPIEvent extends CairngormEvent
	{
		public var sectionName:String;
		
		public function ManagePatientHPIEvent(_sectionName:String)
		{
			super (QIController.MANAGE_PATIENT_HPI_EVENT);
			
			sectionName = _sectionName;
		}
	}
}