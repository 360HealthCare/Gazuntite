package com.gazuntite.provider.eprescription.services.patient.event.rx
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.appController.EPrescriptionController;
	
	public class GetPatientHistoryMedEvent extends CairngormEvent
	{
		public var encounterID:int;
		public var gaxenID:int;
		public var callBack:Function;
		
		public function GetPatientHistoryMedEvent(_encounterID:int, _gaxenID:int, _callBack:Function)
		{
			super(EPrescriptionController.GET_PATIENT_HISTORY_MED);
			
			this.encounterID 	= _encounterID;
			this.gaxenID 		= _gaxenID;
			this.callBack 		= _callBack;
		}
	}
}