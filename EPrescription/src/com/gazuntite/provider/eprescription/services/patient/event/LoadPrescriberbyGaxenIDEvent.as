package com.gazuntite.provider.eprescription.services.patient.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.appController.EPrescriptionController;
	

	public class LoadPrescriberbyGaxenIDEvent extends CairngormEvent
	{
		public var functionName : Function;
		
		public var gaxenId		: String;
	
		public function LoadPrescriberbyGaxenIDEvent(gaxenId : String,functionName : Function = null)
		{
			super( EPrescriptionController.LOAD_PRESCRIBER);
			this.functionName = functionName;
			this.gaxenId = gaxenId;
		}
	}
}