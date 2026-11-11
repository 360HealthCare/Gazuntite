package com.gazuntite.provider.eprescription.services.patient.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.appController.EPrescriptionController;
	
	public class GetDenialCodesEvent extends CairngormEvent
	{
		
		public var resultHandlerFunction:Function;
		public var SPI:String;
		
		public function GetDenialCodesEvent( resultHandlerFunction:Function)
		{
			super(EPrescriptionController.GET_DENIAL_CODES);
			this.resultHandlerFunction = resultHandlerFunction;			
		}
	}
}