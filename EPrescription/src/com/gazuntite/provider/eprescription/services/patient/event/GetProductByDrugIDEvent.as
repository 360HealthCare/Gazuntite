package com.gazuntite.provider.eprescription.services.patient.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.appController.EPrescriptionController;
	
	public class GetProductByDrugIDEvent extends CairngormEvent
	{
		
		public var resultHandlerFunction:Function;
		public var drugId:String;
		public var tradeName:String;
		public var code:String;
		public var ndc:String;
		
		
		public function GetProductByDrugIDEvent(drugId:String, tradeName:String, ndc:String, resultHandlerFunction:Function)
		{
			super(EPrescriptionController.MEDICINE_PRODUCT_SEARCH);
			this.resultHandlerFunction = resultHandlerFunction;
			
			this.drugId 	= drugId;
			this.tradeName 	= tradeName;
			this.ndc 		= ndc;
		
			
		}
	}
}