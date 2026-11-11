package com.gazuntite.provider.eprescription.services.patient.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.appController.EPrescriptionController;
	

	public class SaveNewRXEvent extends CairngormEvent
	{
		public var functionName : Function;
		public var ShowSummary:Boolean;
		
		public function SaveNewRXEvent( functionName : Function, ShowSummary:Boolean)
		{
			super( EPrescriptionController.SAVE_NEW_RX);
			this.functionName = functionName;
			this.ShowSummary = ShowSummary;
			
		}
	}
}