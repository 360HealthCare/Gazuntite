package com.gazuntite.provider.live.services.billing.superBill.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.billing.appController.BillingController;

	public class ManagePendingBillProceduresEvent extends CairngormEvent
	{
		public var ProcedureXml:XML;			
		public var callBack:Function;
		
		public function ManagePendingBillProceduresEvent(ProcedureXml:XML,callBack:Function = null)
		{
			super( BillingController.MANAGE_PENDING_BILL_PROCEDURES_EVENT );
			
			this.ProcedureXml  = ProcedureXml;XML				
			this.callBack        = callBack
		}
	}
}