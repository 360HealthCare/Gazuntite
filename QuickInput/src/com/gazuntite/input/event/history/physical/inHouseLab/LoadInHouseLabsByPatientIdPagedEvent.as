package com.gazuntite.input.event.history.physical.inHouseLab
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.gazuntite.skins.chrome.buttonSkins.superBillAddButton;
	import com.gazuntite.input.dto.PageDTO;
	import com.gazuntite.input.controller.QIController;
	
	public class LoadInHouseLabsByPatientIdPagedEvent extends CairngormEvent
	{
		public function LoadInHouseLabsByPatientIdPagedEvent()
		{
			super(QIController.LOAD_IN_HOUSE_LABS_BY_PATIENT_ID_PAGED_EVENT);
		}
	}
}