package com.gazuntite.provider.live.services.billing.superBill.view.event.diagnosis
{
	import flash.events.Event;

	public class SuperBillDiagnosisSelectedEvent extends Event
	{
		public static const SUPER_BILL_DIAGNOSIS_SELECTED:String 		= "SuperBillDiagnosisSelected";
		public var selection:Object;
		public function SuperBillDiagnosisSelectedEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}