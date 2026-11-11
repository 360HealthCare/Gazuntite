package com.gazuntite.input.view.inputsections.assessment.diagnosis
{
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.common.event.visit.LoadDiagnosisICDCodeEvent;
	import com.gazuntite.input.event.history.assessment.diagnosis.LoadAcuteDiagnosisByPatientIdPagedEvent;
	import com.gazuntite.input.event.history.assessment.diagnosis.LoadChronicDiagnosisByPatientIdPagedEvent;
	import com.gazuntite.input.event.history.assessment.diagnosis.LoadResolvedDiagnosisByPatientIdPagedEvent;
	import com.gazuntite.input.event.visit.assessment.diagnosis.LoadPatientDiagnosisByVisitIdEvent;
	import com.gazuntite.input.event.visit.assessment.diagnosis.ManagePatientDiagnosisEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.viewModel.PatientDictationNoteViewModel;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class PatientInputAssessmentDiagnosisViewModel
	{
		protected static var instance:PatientInputAssessmentDiagnosisViewModel;
		
		public var model:QIModelLocator = QIModelLocator.getInstance();
		
		public var dictationNoteViewModel:PatientDictationNoteViewModel;
		public var dictationNoteHistoryViewModel:PatientDictationNoteViewModel;
		public var inlineDictationNoteViewModel:PatientDictationNoteViewModel;
		
		public function PatientInputAssessmentDiagnosisViewModel(singleton:Number)
		{
			dictationNoteViewModel = new PatientDictationNoteViewModel();
			dictationNoteHistoryViewModel = new PatientDictationNoteViewModel();
			
			inlineDictationNoteViewModel = new PatientDictationNoteViewModel();
			inlineDictationNoteViewModel.inlineEditing = true;
		}
		
		public static function getInstance():PatientInputAssessmentDiagnosisViewModel
		{
			if (instance == null)
			{
				instance = new PatientInputAssessmentDiagnosisViewModel(1);
			}
			
			return instance;
		}
		
		public function loadPatientDiagnosis():void
		{
			var ev:LoadPatientDiagnosisByVisitIdEvent = new LoadPatientDiagnosisByVisitIdEvent();
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
		
		public function loadPatientAcuteDiagnosisHistory():void
		{
			var ev:LoadAcuteDiagnosisByPatientIdPagedEvent = new LoadAcuteDiagnosisByPatientIdPagedEvent();
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
		
		public function loadPatientChronicDiagnosisHistory():void
		{
			var ev:LoadChronicDiagnosisByPatientIdPagedEvent = new LoadChronicDiagnosisByPatientIdPagedEvent();
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
		
		public function loadPatientResolvedDiagnosisHistory():void
		{
			var ev:LoadResolvedDiagnosisByPatientIdPagedEvent = new LoadResolvedDiagnosisByPatientIdPagedEvent();
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
		
		public function clearPatientDiagnosis():void
		{
			if (model.diagnosisDTOList)
				model.diagnosisDTOList.removeAll();
			else
				model.diagnosisDTOList = new ArrayCollection();
			
			if (model.diagnosisDTOListTemp)
				model.diagnosisDTOListTemp.removeAll();
			else
				model.diagnosisDTOListTemp = new ArrayCollection();
			
			if (model.diagnosisDTOAcuteHistoryList)
				model.diagnosisDTOAcuteHistoryList.removeAll();
			else
				model.diagnosisDTOAcuteHistoryList = new ArrayCollection();
			
			if (model.diagnosisDTOChronicHistoryList)
				model.diagnosisDTOChronicHistoryList.removeAll();
			else
				model.diagnosisDTOChronicHistoryList = new ArrayCollection();
			
			if (model.diagnosisDTOResolvedHistoryList)
				model.diagnosisDTOResolvedHistoryList.removeAll();
			else
				model.diagnosisDTOResolvedHistoryList = new ArrayCollection();
		}
		
		public function managePatientDiagnosis(sectionName:String, associateType:String = 'This Visit'):void
		{
			var ev:ManagePatientDiagnosisEvent = new ManagePatientDiagnosisEvent(sectionName, associateType);
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
		
		public function loadPatientDiagnosisStaticData(searchTerm:String):void
		{
			var ev:LoadDiagnosisICDCodeEvent = new LoadDiagnosisICDCodeEvent(searchTerm,model.LoggedInUserSessionID,model.LoggedInUserId, ICDCodeloadResult);
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
		private function ICDCodeloadResult(icdCodeList:ArrayCollection):void
		{
			model.icdCodeDTOList = icdCodeList;
		}
	}
}