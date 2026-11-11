package com.gazuntite.provider.eprescription.services.patient.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.appController.EPrescriptionController;
	
	public class loadServicelevelsEvent extends CairngormEvent
	{
		
		public var resultHandlerFunction:Function;
		
		public function loadServicelevelsEvent(resultHandlerFunction:Function)
		{
			super(EPrescriptionController.LOAD_SERVICE_LEVELS);
			this.resultHandlerFunction = resultHandlerFunction;
		}
	}
}