package com.gazuntite.provider.eprescription.services.patient.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.appController.EPrescriptionController;
	/*import com.adobe.Quivus.appController.AppController;
	import com.adobe.cairngorm.control.CairngormEvent;*/
	
	public class GetRXStaticDataEvent extends CairngormEvent
	{
		
		public var resultHandlerFunction:Function;
		
		public function GetRXStaticDataEvent(resultHandlerFunction:Function)
		{
			super(EPrescriptionController.GET_RX_STATIC_DATA);
			//super(AppController.LOAD_CLINIC_USER_BASIC_INFO);			
			this.resultHandlerFunction = resultHandlerFunction;
		}
	}
}