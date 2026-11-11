package com.gazuntite.provider.eprescription.services.patient.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.appController.EPrescriptionController;
	
	public class GetPendingRefillsEvent extends CairngormEvent
	{
		public function GetPendingRefillsEvent()
		{
			super(EPrescriptionController.GET_PENDING_REFILLS);
		}
	}
}