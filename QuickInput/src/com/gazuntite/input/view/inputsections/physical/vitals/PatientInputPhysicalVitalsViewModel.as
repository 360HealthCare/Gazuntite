package com.gazuntite.input.view.inputsections.physical.vitals
{
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.common.dto.VitalsDTO;
	import com.gazuntite.common.event.ManagePatientVitalEvent;
	import com.gazuntite.input.event.visit.physical.vitals.LoadPatientPreviousVitalsEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.viewModel.PatientDictationNoteViewModel;
	
	[Bindable]
	public class PatientInputPhysicalVitalsViewModel
	{
		protected static var instance:PatientInputPhysicalVitalsViewModel;
		
		private var model:QIModelLocator = QIModelLocator.getInstance();
		
		public var dictationNoteViewModel:PatientDictationNoteViewModel;
		public var dictationNoteHistoryViewModel:PatientDictationNoteViewModel;
		public var inlineDictationNoteViewModel:PatientDictationNoteViewModel;
		
		public function PatientInputPhysicalVitalsViewModel(singleton:Number)
		{
			dictationNoteViewModel = new PatientDictationNoteViewModel();
			
			dictationNoteHistoryViewModel = new PatientDictationNoteViewModel();
			
			inlineDictationNoteViewModel = new PatientDictationNoteViewModel();
			
			inlineDictationNoteViewModel.inlineEditing = true;
		}
		
		public static function getInstance():PatientInputPhysicalVitalsViewModel
		{
			if (instance == null)
			{
				instance = new PatientInputPhysicalVitalsViewModel(1);
			}
			return instance;
		}
		
		//[06/13/2013] Shahid Munir
		public function loadPatientVitals():void
		{
			var ev:LoadPatientPreviousVitalsEvent = new LoadPatientPreviousVitalsEvent();
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
		
		public function managePatientVitals(vitalsDTO:VitalsDTO, callback:Function = null):void
		{
			var mpve1:ManagePatientVitalEvent = new ManagePatientVitalEvent(vitalsDTO, model.LoggedInUserId, vitalsDTO.VisitID, model.LoggedInUserSessionID, callback);
			CairngormEventDispatcher.getInstance().dispatchEvent(mpve1);
		}
		
		public function clearVitals():void
		{
			if (model.patientVitalsInputList)
				model.patientVitalsInputList.removeAll();
			
			if (model.patientPreviousVitalsList)
				model.patientPreviousVitalsList.removeAll();
		}
	}
}