package com.gazuntite.provider.eprescription.services.patient.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.appController.EPrescriptionController;	
	
	public class RemoveFavoritePharmaciesEvent extends CairngormEvent
	{
		
		public var resultHandlerFunction:Function;
		public var patientID:int;
		public var ncpdid:String;
		
		public function RemoveFavoritePharmaciesEvent(patientID:int, ncpdid:String, resultHandlerFunction:Function)
		{
			super(EPrescriptionController.REMOVE_FAVORITE_PHARMACY);
			this.resultHandlerFunction = resultHandlerFunction;
			this.patientID = patientID;
			this.ncpdid = ncpdid;
		}
	}
}