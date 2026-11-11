package com.gazuntite.provider.eprescription.services.patient.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.appController.EPrescriptionController;	
	
	public class SendOutboxEvent extends CairngormEvent
	{
		
		public var resultHandlerFunction:Function;
		public var referenceNumber:String;
		
		public function SendOutboxEvent(referenceNumber:String, resultHandlerFunction:Function)
		{
			super(EPrescriptionController.SEND_OUTBOX);
			this.resultHandlerFunction = resultHandlerFunction;
			this.referenceNumber = referenceNumber;
		}
	}
}