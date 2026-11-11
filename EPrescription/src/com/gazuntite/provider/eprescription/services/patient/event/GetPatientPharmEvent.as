package com.gazuntite.provider.eprescription.services.patient.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.appController.EPrescriptionController;
	
	public class GetPatientPharmEvent extends CairngormEvent
	{
		
		public var resultHandlerFunction:Function;
		public var patientID:int;
		
		public function GetPatientPharmEvent(patientID:int, resultHandlerFunction:Function)
		{
			super(EPrescriptionController.GET_FAVORITE_PHARMACY);
			this.resultHandlerFunction = resultHandlerFunction;
			this.patientID = patientID;
		}
	}
}