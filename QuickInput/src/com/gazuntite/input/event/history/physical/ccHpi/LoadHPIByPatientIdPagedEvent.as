package com.gazuntite.input.event.history.physical.ccHpi
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.input.controller.QIController;
	
	public class LoadHPIByPatientIdPagedEvent extends CairngormEvent
	{
		public function LoadHPIByPatientIdPagedEvent()
		{
			super (QIController.LOAD_HPI_BY_PATIENT_ID_PAGED_EVENT);
		}
	}
}