package com.gazuntite.patient.visit.event.visit
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;
	
	import mx.collections.ArrayCollection;

	public class GenerateSoapNotePreviewEvent extends CairngormEvent
	{
		
		//userSession:UserSessionDTO, 
		public var clinicbranchId:int, 
		isAllSelected:Boolean,
		isPatientMale:Boolean,
		callback:Function = null ;
		
		public function GenerateSoapNotePreviewEvent(isAllSelected:Boolean,isMale:Boolean, callback:Function)
		{
			super( QIController.GENERATE_SOAP_NOTE_PREVIEW_EVENT );
			this.isAllSelected			= isAllSelected;
			this.isPatientMale			= isMale;
			this.callback				= callback ;
		}
		
		
	}
}