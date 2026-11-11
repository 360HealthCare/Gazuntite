package com.gazuntite.common.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.appController.QSCommonController;
	
	public class SavePatientGaxenIdEvent extends CairngormEvent
	{
		public var userId		: String;
		public var gaxenId		: String;
		public var func			: Function;
		
		public function SavePatientGaxenIdEvent(userId : String, gaxenId:String, _func:Function)
		{
			super(QSCommonController.SAVE_PATIENT_GAXENID_EVENT);
			
			this.userId 	= userId;
			this.gaxenId 	= gaxenId;
			this.func 		= _func;
		}
	}
}