package com.gazuntite.provider.eprescription.services.patient.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.appController.EPrescriptionController;
	
	public class GetPatientVisitEvent extends CairngormEvent
	{
		
		public var resultHandlerFunction:Function;
		public var patientID:String;
		public var clinicID:String;
		
		public function GetPatientVisitEvent(patientID:String, clinicID:String, resultHandlerFunction:Function)
		{
			super(EPrescriptionController.GET_INSURANCE);
			this.resultHandlerFunction 	= resultHandlerFunction;
			this.patientID 				= patientID;
			this.clinicID 				= clinicID;
		}
	}
}