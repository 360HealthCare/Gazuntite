package com.gazuntite.provider.eprescription.services.patient.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.appController.EPrescriptionController;	
	
	public class DeletePatientMedEvent extends CairngormEvent
	{
		
		public var resultHandlerFunction:Function;
		public var referenceNumber:String;
		
		public function DeletePatientMedEvent(referenceNumber:String, resultHandlerFunction:Function)
		{
			super(EPrescriptionController.REMOVE_PATIENT_MED);
			this.resultHandlerFunction = resultHandlerFunction;
			this.referenceNumber = referenceNumber;
		}
	}
}