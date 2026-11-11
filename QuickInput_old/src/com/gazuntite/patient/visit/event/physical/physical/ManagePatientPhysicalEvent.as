package com.gazuntite.patient.visit.event.physical.physical
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;
	
	public class ManagePatientPhysicalEvent extends CairngormEvent
	{
		public function ManagePatientPhysicalEvent()
		{
			super(QIController.MANAGE_PHYSICAL);
		}
	}
}