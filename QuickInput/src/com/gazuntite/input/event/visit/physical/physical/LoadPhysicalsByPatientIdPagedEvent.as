package com.gazuntite.input.event.visit.physical.physical
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;
	
	public class LoadPhysicalsByPatientIdPagedEvent extends CairngormEvent
	{
		public function LoadPhysicalsByPatientIdPagedEvent()
		{
			super(QIController.LOAD_PHYSICALS_BY_PATIENT_ID_PAGED_EVENT);
		}
	}
}