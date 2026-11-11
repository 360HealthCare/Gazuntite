package com.gazuntite.common.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.appController.QSCommonController;
	
	public class LoadStateCodesOnlyEvent extends CairngormEvent
	{
		public var callBack:Function;
		
		public function LoadStateCodesOnlyEvent(_callBack:Function)
		{
			super(QSCommonController.LOAD_STATE_CODES_ONLY_EVENT);
			this.callBack = _callBack;
		}
	}
}