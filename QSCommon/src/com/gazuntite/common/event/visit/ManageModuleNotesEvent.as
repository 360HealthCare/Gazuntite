package com.gazuntite.common.event.visit
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.appController.QSCommonController;
	import com.gazuntite.common.dto.ModuleNoteDTO;
	
	public class ManageModuleNotesEvent extends CairngormEvent
	{
		public var notesDTO:ModuleNoteDTO;
		public var sectionName:String;
		public var loggedInUserId:int;
		public var loggedInUserSessionID:String;
		public var callBack:Function;
		
		public function ManageModuleNotesEvent(note:ModuleNoteDTO, sectionName:String, loggedInUserId:int, loggedInUserSessionID:String, callBack:Function = null)
		{
			super (QSCommonController.MANAGE_MODULE_NOTES_BY_VISIT_ID_EVENT);
			
			this.notesDTO = note;
			this.sectionName = sectionName;
			this.loggedInUserId = loggedInUserId;
			this.loggedInUserSessionID = loggedInUserSessionID;
			this.callBack = callBack;
			
			note = null;
		}
	}
}