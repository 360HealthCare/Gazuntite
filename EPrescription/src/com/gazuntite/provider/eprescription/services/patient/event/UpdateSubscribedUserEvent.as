package com.gazuntite.provider.eprescription.services.patient.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.appController.EPrescriptionController;
	

	public class UpdateSubscribedUserEvent extends CairngormEvent
	{
		public var functionName : Function;
		
		public var purpose		: String;
		public var updateAdd	: String;
	
		public function UpdateSubscribedUserEvent(purpose : String, updateAdd:String, functionName : Function)
		{
			super( EPrescriptionController.SUBSCRIBE_PATIENT_EVENT);
			this.functionName = functionName;
			this.purpose = purpose;
			this.updateAdd = updateAdd;
		}
	}
}