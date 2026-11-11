package com.gazuntite.provider.eprescription.services.patient.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.appController.EPrescriptionController;
	

	public class ManagePatientFavPharmEvent extends CairngormEvent
	{
		public var functionName : Function;
		
		public var purpose		: String;
		public var updateAdd	: String;
	
		public function ManagePatientFavPharmEvent(functionName : Function)
		{
			super( EPrescriptionController.MANAGE_PATIENT_FAV_PHARM);
			this.functionName = functionName;
		}
	}
}