package com.gazuntite.provider.eprescription.services.patient.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.appController.EPrescriptionController;
	
	/**
	 * @ Author - TA
	 * Zigron Inc
	 **/
	
	public class GetNDCByDRUGIDProductIDEvent extends CairngormEvent
	{
		
		public var resultHandlerFunction:Function;
		public var strengthID:String;
		public var productId:String;
		public var ndc:String;
		public var drugId:String;
		
		public function GetNDCByDRUGIDProductIDEvent(_strengthID:String, _productId:String, _ndc:String, _drugId:String, resultHandlerFunction:Function)
		{
			super(EPrescriptionController.GET_NDC_BY_DRUG_ID_PRODUCT_ID_EVENT);
			
			this.resultHandlerFunction = resultHandlerFunction;
			this.strengthID = _strengthID;
			this.drugId = _drugId;
			this.productId = _productId;
			this.ndc = _ndc;
		}
	}
}