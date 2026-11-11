package com.gazuntite.provider.eprescription.services.patient.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.appController.EPrescriptionController;	
	
	public class PendingRefillResponseEvent extends CairngormEvent
	{
		
		public var resultHandlerFunction:Function;
		public var referenceNumber:String;
		
		public function PendingRefillResponseEvent(resultHandlerFunction:Function)
		{
			super(EPrescriptionController.PENDING_REFILL_RESPONSE);
			this.resultHandlerFunction = resultHandlerFunction;
			this.referenceNumber = referenceNumber;
		}
	}
}