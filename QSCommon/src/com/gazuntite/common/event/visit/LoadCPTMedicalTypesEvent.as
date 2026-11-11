package com.gazuntite.common.event.visit
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.appController.QSCommonController;
	
	public class LoadCPTMedicalTypesEvent extends CairngormEvent 
	{
		public var searchTerm:String;
		public var searchType:int;
		public var func:Function;
		public var sessionID:String;
		public var loggenInUserId:int;
		
		public function LoadCPTMedicalTypesEvent(searchTerm:String, searchType:int,sessionID:String,loggenInUserId:int, _func:Function = null) 
		{
			super (QSCommonController.LOAD_CPT_MEDICAL_TYPES_EVENT);
			this.searchTerm = searchTerm;
			this.searchType = searchType;
			this.sessionID = sessionID;
			this.loggenInUserId = loggenInUserId;
			this.func 		= _func;
		}
	}
}