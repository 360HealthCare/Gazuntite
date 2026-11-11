package com.gazuntite.provider.live.services.billing.superBill.view.event.procedure
{
	import flash.events.Event;

	public class SuperBillProcedureSelectedEvent extends Event
	{
		public static const SUPER_BILL_PROCEDURE_SELECTED:String 		= "SuperBillProcedureSelected";
		public var selection:Object;
		
		public function SuperBillProcedureSelectedEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}