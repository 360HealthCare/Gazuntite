package com.gazuntite.provider.eprescription.services.patient.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.appController.EPrescriptionController;
	

	public class UpdateGaxenIDEvent extends CairngormEvent
	{
		public var functionName : Function;
		
		public var userId		: String;
		public var gaxenId		: String;
	
		public function UpdateGaxenIDEvent(userId : String, gaxenId:String, functionName : Function = null)
		{
			super( EPrescriptionController.SAVE_GAXEN_ID);
			this.functionName = functionName;
			this.userId = userId;
			this.gaxenId = gaxenId;
		}
	}
}