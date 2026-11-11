package com.gazuntite.input.view.inputsections.assessment.plan.followUp
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.input.event.history.assessment.plan.followUp.LoadFollowUpByPatientIdPagedEvent;
	import com.gazuntite.input.delegate.visit.assessment.plan.followup.LoadFollowUpByVisitIdDelegate;
	import com.gazuntite.input.event.visit.assessment.plan.followup.GetPatientAllMedEvent;
	import com.gazuntite.input.event.visit.assessment.plan.followup.LoadFollowUpByVisitIdEvent;
	import com.gazuntite.input.event.visit.assessment.plan.followup.LoadFollowUpInstructionAgeTypeEvent;
	import com.gazuntite.input.event.visit.assessment.plan.followup.LoadFollowUpInstructionAgeValueTypeEvent;
	import com.gazuntite.input.event.visit.assessment.plan.followup.LoadFollowUpInstructionDurationTypeEvents;
	import com.gazuntite.input.event.visit.assessment.plan.followup.LoadFollowUpMethodTypeEvent;
	import com.gazuntite.input.event.visit.assessment.plan.followup.LoadFollowUpPatientLabTestTypesByPatientIdEvent;
	import com.gazuntite.input.event.visit.assessment.plan.followup.LoadFollowUpServiceTypeEvent;
	import com.gazuntite.input.event.visit.assessment.plan.followup.ManagePatientFollowUpEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.viewModel.PatientDictationNoteViewModel;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class PatientInputAssessmentFollowUpViewModel
	{
		protected static var instance:PatientInputAssessmentFollowUpViewModel;
		
		public var model:QIModelLocator = QIModelLocator.getInstance();
		
		public var inlineDictationNoteViewModel:PatientDictationNoteViewModel;
		
		public function PatientInputAssessmentFollowUpViewModel(singleton:Number)
		{
			inlineDictationNoteViewModel = new PatientDictationNoteViewModel();
			inlineDictationNoteViewModel.inlineEditing = true;
		}
		
		public static function getInstance():PatientInputAssessmentFollowUpViewModel
		{
			if (instance == null)
				instance = new PatientInputAssessmentFollowUpViewModel(1);
			
			return instance;
		}
		
		public function loadFollowUpByVisitID():void
		{
			//var ev:LoadFollowUpByVisitIdEvent = new LoadFollowUpByVisitIdEvent();
			//CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
		
		public function loadFollowUpHistory():void
		{
			//var ev:LoadFollowUpByPatientIdPagedEvent = new LoadFollowUpByPatientIdPagedEvent();
			//CairngormEventDispatcher.getInstance().dispatchEvent(ev);
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
		}
	}
}