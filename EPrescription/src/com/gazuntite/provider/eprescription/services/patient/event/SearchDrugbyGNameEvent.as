package com.gazuntite.provider.eprescription.services.patient.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.appController.EPrescriptionController;
	
	public class SearchDrugbyGNameEvent extends CairngormEvent
	{
		
		public var resultHandlerFunction:Function;
		public var drugName:String;
		public var tradeName:String;
		public var ndc:String;
		public var startno:String;
		
		//{GENERICNAME}/{StartNumber}/{productGenName}/{NDC}
		public function SearchDrugbyGNameEvent(drugName:String, startno:String, tradeName:String, ndc:String, resultHandlerFunction:Function)
		{
			super(EPrescriptionController.MEDICINE_SEARCH);
			this.resultHandlerFunction = resultHandlerFunction;
			
			this.drugName 	= drugName;
		
			this.startno 	= startno;
			this.tradeName 	= tradeName;
			this.ndc 		= ndc;
			
		}
	}
}