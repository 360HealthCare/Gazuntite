package com.gazuntite.provider.eprescription.services.patient.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.appController.EPrescriptionController;
	
	public class GetStrengthByGenericProductIDEvent extends CairngormEvent
	{
		
		public var resultHandlerFunction:Function;
		public var prodName:String;
		public var ndc:String;
		
		
		public function GetStrengthByGenericProductIDEvent(prodName:String, ndc:String, resultHandlerFunction:Function)
		{
			super(EPrescriptionController.MEDICINE_STRENGTH);
			this.resultHandlerFunction = resultHandlerFunction;
			
			this.prodName 	= prodName;			
			this.ndc 		= ndc;			
			
		}
	}
}