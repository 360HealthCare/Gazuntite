package com.gazuntite.provider.live.services.billing.superBill.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.billing.appController.BillingController;

	public class SaveSuperBillEvent extends CairngormEvent
	{
		public var SuperBillXml:XML;
		public var GenerateBill:String;
		public var callBack:Function;
		
		public function SaveSuperBillEvent(SuperBillXml:XML, GenerateBill:String = "",callBack:Function = null)
		{ 
			super( BillingController.SAVE_SUPER_BILL_EVENT );
			
			this.SuperBillXml  = SuperBillXml;XML	
			this.GenerateBill  = GenerateBill;String
			this.callBack        = callBack
		}
	}
}