package com.gazuntite.common.event.visit
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.appController.QSCommonController;
	
	import mx.collections.ArrayCollection;

	public class LoadDiagnosisICDCodeEvent extends CairngormEvent
	{
		public var icdCode:String;
		public var sessionID:String;
		public var loggedInUserId:int;
		public var func:Function;
		
		public function LoadDiagnosisICDCodeEvent(icdCode:String, sessionID:String, loggedInUserId:int, _func:Function = null)
		{
			super( QSCommonController.LOAD_ICD_CODE_EVENT);
			this.icdCode 	= icdCode;
			this.sessionID 	= sessionID;
			this.loggedInUserId 	= loggedInUserId;
			this.func 		= _func;
		}
	}
}