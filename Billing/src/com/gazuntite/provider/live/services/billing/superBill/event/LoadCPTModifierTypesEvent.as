package com.gazuntite.provider.live.services.billing.superBill.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.billing.appController.BillingController;

	public class LoadCPTModifierTypesEvent extends CairngormEvent
	{
		public var modifierCode:String	;
		public var modifierNo:int	;
		public var callBack:  Function;
		
		public function LoadCPTModifierTypesEvent(modifierCode:String,modifierNo:int,callBack:Function = null)
		{
			super( BillingController.LOAD_CPT_MODIFIER_TYPES_EVENT);
			this.modifierCode = modifierCode;String
			this.modifierNo = modifierNo;int
			this.callBack = callBack;
		}
	}
}