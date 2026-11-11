package com.gazuntite.common.event.comprehensive
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.appController.QSCommonController;

	public class LoadComhensiveHistoryStaticDataEvent extends CairngormEvent
	{
		public var sessionID			: String;		
		public var callBack				: Function;	
		
		public function LoadComhensiveHistoryStaticDataEvent(sessionID:String,callBack:Function  = null)
		{
			super(QSCommonController.COMHENSIVE_LOAD_HISTORY_STATIC_DATA);
			
			this.sessionID = sessionID;
			this.callBack  = callBack;
		}
	}
}