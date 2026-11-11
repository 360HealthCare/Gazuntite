package com.gazuntite.input.view.inputsections.assessment.plan.advanceCare
{
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.viewModel.PatientDictationNoteViewModel;
	
	[Bindable]
	public class PatientInputAssessmentAdvanceCareViewModel
	{
		protected static var instance:PatientInputAssessmentAdvanceCareViewModel;
		
		public var model:QIModelLocator = QIModelLocator.getInstance();
		
		public var inlineDictationNoteViewModel:PatientDictationNoteViewModel;
		
		public function PatientInputAssessmentAdvanceCareViewModel(singleton:Number)
		{
			inlineDictationNoteViewModel = new PatientDictationNoteViewModel();
			inlineDictationNoteViewModel.inlineEditing = true;
		}
		
		public static function getInstance():PatientInputAssessmentAdvanceCareViewModel
		{
			if (instance == null)
				instance = new PatientInputAssessmentAdvanceCareViewModel(1);
			
			return instance;
		}
		
		/*public function loadFollowUpByVisitID():void
		{
		var ev:LoadFollowUpByVisitIdEvent = new LoadFollowUpByVisitIdEvent();
		CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
		
		public function loadFollowUpHistory():void
		{
		var ev:LoadFollowUpByPatientIdPagedEvent = new LoadFollowUpByPatientIdPagedEvent();
		CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
		
		public function manageFollowUp(sectionName:String):void
		{
		var ev:ManagePatientFollowUpEvent = new ManagePatientFollowUpEvent(sectionName);
		CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
		
		public function loadFollowUpStaticData():void
		{
		if (!model.followUpMethodTypeList)
		{
		var loadMethodEv:LoadFollowUpMethodTypeEvent = new LoadFollowUpMethodTypeEvent();
		CairngormEventDispatcher.getInstance().dispatchEvent(loadMethodEv);
		}
		
		if (!model.followUpDurationTypeList)
		{
		var loadDurationTypeEv:LoadFollowUpInstructionDurationTypeEvents = new LoadFollowUpInstructionDurationTypeEvents();
		CairngormEventDispatcher.getInstance().dispatchEvent(loadDurationTypeEv);
		}
		
		if (!model.followUpInstructionAgeTypeDTOList)
		{
		var loadInstructionAgeEv:LoadFollowUpInstructionAgeTypeEvent = new LoadFollowUpInstructionAgeTypeEvent();
		CairngormEventDispatcher.getInstance().dispatchEvent(loadInstructionAgeEv);
		}
		
		if (!model.followUpInstructionAgeValueTypeDTOList)
		{
		var loadInstructionAgeValueEv:LoadFollowUpInstructionAgeValueTypeEvent = new LoadFollowUpInstructionAgeValueTypeEvent();
		CairngormEventDispatcher.getInstance().dispatchEvent(loadInstructionAgeValueEv);
		}
		
		loadFollowUpLabs();
		loadPatientDrugs();
		}
		
		public function loadFollowUpLabs():void
		{
		var labsEv:LoadFollowUpPatientLabTestTypesByPatientIdEvent = new LoadFollowUpPatientLabTestTypesByPatientIdEvent();
		CairngormEventDispatcher.getInstance().dispatchEvent(labsEv);
		}
		
		public function loadPatientDrugs():void
		{
		var medEv:GetPatientAllMedEvent = new GetPatientAllMedEvent();
		CairngormEventDispatcher.getInstance().dispatchEvent(medEv);
		}
		
		public function loadFollowUpServiceType(followUpDataControlType:int, searchTerm:String):void
		{
		var ev:LoadFollowUpServiceTypeEvent = new LoadFollowUpServiceTypeEvent(followUpDataControlType, searchTerm);
		CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
		
		public function clearFollowUp():void
		{
		if (model.followUpDTOList)
		model.followUpDTOList.removeAll();
		else
		model.followUpDTOList = new ArrayCollection();
		
		if (model.followUpDTOHistoryList)
		model.followUpDTOHistoryList.removeAll();
		else
		model.followUpDTOHistoryList = new ArrayCollection();
		
		if (model.followUpLabsList)
		model.followUpLabsList.removeAll();
		else
		model.followUpLabsList = new ArrayCollection();
		
		if (model.followUpPatientMedicationlist)
		model.followUpPatientMedicationlist.removeAll();
		else
		model.followUpPatientMedicationlist = new ArrayCollection();
		}*/
	}
}