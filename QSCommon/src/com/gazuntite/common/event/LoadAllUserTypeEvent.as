package com.gazuntite.common.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.appController.QSCommonController;
	import com.gazuntite.common.util.QSCommonServiceMethods;

	public class LoadAllUserTypeEvent extends CairngormEvent
	{
		public var callBack:Function; 
		
		public function LoadAllUserTypeEvent(callBack:Function)
		{
			super(QSCommonController.LOAD_ALL_USER_TYPE_EVENT);
			
			this.callBack =callBack;
		}
	}
}