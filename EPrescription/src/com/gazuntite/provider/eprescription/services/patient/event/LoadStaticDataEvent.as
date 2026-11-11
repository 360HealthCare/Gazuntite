package com.gazuntite.provider.eprescription.services.patient.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.appController.EPrescriptionController;
	
	public class LoadStaticDataEvent extends CairngormEvent
	{
		
		public var resultHandlerFunction:Function;
		
		public function LoadStaticDataEvent(resultHandlerFunction:Function)
		{
			super(EPrescriptionController.GET_RX_STATIC_DATA);
			this.resultHandlerFunction = resultHandlerFunction;
		}
	}
}