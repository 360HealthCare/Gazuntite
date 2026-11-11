package com.gazuntite.provider.eprescription.services.patient.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.appController.EPrescriptionController;
	
	public class UpdateUserPasswordbyPostEvent extends CairngormEvent
	{
		
		public var resultHandlerFunction:Function;
		
		public function UpdateUserPasswordbyPostEvent(resultHandlerFunction:Function)
		{
			super(EPrescriptionController.CHANGE_PASSWORD);
			this.resultHandlerFunction = resultHandlerFunction;
		}
	}
}