package com.gazuntite.provider.eprescription.services.patient.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.appController.EPrescriptionController;

	public class UpdateUserEvent extends CairngormEvent
	{
		public var purpose		: String;
		public var xml			: XML;
		public var functionName : Function;
	
		public function UpdateUserEvent(purpose:String, _xml:XML, functionName : Function)
		{
			super( EPrescriptionController.SAVE_QUIVUS_MANAGER);
			this.xml = _xml;
			this.purpose = purpose;
			this.functionName = functionName;
		}
	}
}