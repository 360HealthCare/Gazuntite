package com.gazuntite.patient.visit.event.NotesDictation
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;
	import com.gazuntite.patient.visit.dto.ModuleDictationDTO;

	public class ManageModuleDictationEvent extends CairngormEvent
	{
		
		public var DTO:ModuleDictationDTO;
		
		public function ManageModuleDictationEvent(dto:ModuleDictationDTO)
		{
			super(QIController.MANAGE_MODULE_DICTATION_BY_VISIT_ID_EVENT);
			this.DTO = dto;
		}
	}
}