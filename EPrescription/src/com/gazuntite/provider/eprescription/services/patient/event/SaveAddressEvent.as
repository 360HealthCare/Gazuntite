package com.gazuntite.provider.eprescription.services.patient.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.appController.EPrescriptionController;
	

	public class SaveAddressEvent extends CairngormEvent
	{
		public var functionName : Function;
		
		public var purpose		: String;
		public var userID		: String;
	
		public function SaveAddressEvent(purpose : String, userID:String, functionName : Function)
		{
			super( EPrescriptionController.SAVE_ADDRESS);
			this.functionName = functionName;
			this.purpose = purpose;
			this.userID = userID;
		}
	}
}