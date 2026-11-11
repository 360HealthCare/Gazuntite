package com.gazuntite.provider.eprescription.services.patient.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.appController.EPrescriptionController;	
	
	public class DeleteOutBoxEvent extends CairngormEvent
	{
		
		public var resultHandlerFunction:Function;
		public var referenceNumber:String;
		
		public function DeleteOutBoxEvent(referenceNumber:String, resultHandlerFunction:Function)
		{
			super(EPrescriptionController.REMOVE_OUTBOX);
			this.resultHandlerFunction = resultHandlerFunction;
			this.referenceNumber = referenceNumber;
		}
	}
}