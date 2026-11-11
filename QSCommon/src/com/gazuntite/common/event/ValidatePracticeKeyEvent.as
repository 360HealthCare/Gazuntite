package com.gazuntite.common.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.appController.QSCommonController;

	public class ValidatePracticeKeyEvent extends CairngormEvent
	{
		public var practiceKey		:String;
		public var callBack			:Function;
		
		public function ValidatePracticeKeyEvent(practiceKey:String, callBack:Function)
		{
			super(QSCommonController.VALIDATE_PRACTICE_KEY);
			
			this.practiceKey 		= practiceKey;
			this.callBack 			= callBack;
		}
	}
}