package com.gazuntite.provider.live.services.billing.superBill.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.billing.appController.BillingController;

	public class LoadENMCodeTypesEvent extends CairngormEvent
	{
		public var callBack			: Function;
		public function LoadENMCodeTypesEvent(callBack:Function = null)
		{
			super( BillingController.LOAD_ENM_CODE_TYPES_EVENT);
			this.callBack = callBack;
		}
	}
}