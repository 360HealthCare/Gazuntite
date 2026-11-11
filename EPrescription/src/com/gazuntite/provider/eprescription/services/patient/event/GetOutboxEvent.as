package com.gazuntite.provider.eprescription.services.patient.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.appController.EPrescriptionController;
	
	public class GetOutboxEvent extends CairngormEvent
	{
		
		public var resultHandlerFunction:Function;
		public var SPI:String;
		
		public function GetOutboxEvent(SPI:String, resultHandlerFunction:Function)
		{
			super(EPrescriptionController.GET_OUTBOX);
			this.resultHandlerFunction = resultHandlerFunction;
			this.SPI = SPI;
		}
	}
}