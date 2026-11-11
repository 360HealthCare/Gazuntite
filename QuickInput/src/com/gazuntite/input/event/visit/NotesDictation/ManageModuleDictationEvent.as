package com.gazuntite.input.event.visit.NotesDictation
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.ModuleDictationDTO;
	import com.gazuntite.input.controller.QIController;
	
	public class ManageModuleDictationEvent extends CairngormEvent
	{
		
		public var DTO:ModuleDictationDTO;
		public var sectionName:String;
		public var loggedInUserId:int;
		public var loggedInUserSessionID:String;
		public var branchId:int;
		public var callBack:Function;
		
		public function ManageModuleDictationEvent(dto:ModuleDictationDTO, sectionName:String, loggedInUserId:int, loggedInUserSessionID:String, branchId:int, callBack:Function = null)
		{
			super(QIController.MANAGE_MODULE_DICTATION_BY_VISIT_ID_EVENT);
			
			this.DTO = dto;			
			this.sectionName = sectionName;
			this.loggedInUserId = loggedInUserId;
			this.loggedInUserSessionID = loggedInUserSessionID;
			this.branchId = branchId;
			this.callBack = callBack;
			
			dto = null;
		}
	}
}