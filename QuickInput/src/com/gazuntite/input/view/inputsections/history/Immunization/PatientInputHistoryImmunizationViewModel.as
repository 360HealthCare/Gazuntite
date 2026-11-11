package com.gazuntite.input.view.inputsections.history.Immunization
{
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.common.dto.ModuleNoteDTO;
	import com.gazuntite.input.event.visit.pmh.immunization.LoadImmunizationByVisitIDEvent;
	import com.gazuntite.input.event.visit.pmh.immunization.ManagePatientImmunizationEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.viewModel.PatientDictationNoteViewModel;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class PatientInputHistoryImmunizationViewModel
	{
		protected static var instance:PatientInputHistoryImmunizationViewModel;
		
		private var model:QIModelLocator = QIModelLocator.getInstance();
		
		public var dictationNoteViewModel:PatientDictationNoteViewModel;
		public var dictationNoteHistoryViewModel:PatientDictationNoteViewModel;
		public var inLineDictationNoteViewModel:PatientDictationNoteViewModel;
		
		public var notesDTO:ModuleNoteDTO;
		
		public function PatientInputHistoryImmunizationViewModel(singleton:Number)
		{
			dictationNoteViewModel = new PatientDictationNoteViewModel();
			
			dictationNoteHistoryViewModel = new PatientDictationNoteViewModel();
			
			inLineDictationNoteViewModel = new PatientDictationNoteViewModel();
			inLineDictationNoteViewModel.inlineEditing = true;
		}
		
		public static function getInstance():PatientInputHistoryImmunizationViewModel
		{
			if (instance == null)
			{
				instance = new PatientInputHistoryImmunizationViewModel(0);
			}
			
			return instance;
		}
		
		public function managePatientImmunization():void
		{
			var mpiEvent:ManagePatientImmunizationEvent = new ManagePatientImmunizationEvent();
			CairngormEventDispatcher.getInstance().dispatchEvent(mpiEvent); 
		}
		
		public function loadPatientImmunizationByVisitId():void
		{
			var lpviEvent:LoadImmunizationByVisitIDEvent = new LoadImmunizationByVisitIDEvent(); 
			CairngormEventDispatcher.getInstance().dispatchEvent( lpviEvent );
		}
		
		public function clearImmunizations():void
		{
			if (model.immunizationDTOList)
				model.immunizationDTOList.removeAll();
			else
				model.immunizationDTOList = new ArrayCollection();
			
			clearImmunizationDictationNotes();
		}
		
		public function clearImmunizationDictationNotes():void
		{
			if (!notesDTO)
				return;
			
			notesDTO.Note = "";
		}
	}
}