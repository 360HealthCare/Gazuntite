package com.gazuntite.common.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.appController.QSCommonController;
	
	public class LoadAllInsuranceEvent extends CairngormEvent
	{
		public var callBack			: Function;
		public function LoadAllInsuranceEvent(callBack:Function)
		{
			super( QSCommonController.LOAD_ALL_INSURANCE_EVENT);
			
			this.callBack = callBack;
		}
	}
}