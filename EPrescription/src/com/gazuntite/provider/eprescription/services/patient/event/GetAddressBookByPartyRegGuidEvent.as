package com.gazuntite.provider.eprescription.services.patient.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.appController.EPrescriptionController;
	
	public class GetAddressBookByPartyRegGuidEvent extends CairngormEvent
	{
		
		public var resultHandlerFunction:Function;

		public var rec:String;
		
		public function GetAddressBookByPartyRegGuidEvent(rec:String, resultHandlerFunction:Function)
		{
			super(EPrescriptionController.PATIENT_ADDRESS);
			this.resultHandlerFunction = resultHandlerFunction;
			
			this.rec 	= rec;
	
			
		}
	}
}