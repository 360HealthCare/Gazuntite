package com.gazuntite.input.view.inputsections.assessment.plan.recommendation
{
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.input.event.history.assessment.plan.recommendation.LoadRecommendationByPatientIdPagedEvent;
	import com.gazuntite.input.event.visit.assessment.plan.recomendation.LoadAllRecommendationDurationTypesEvent;
	import com.gazuntite.input.event.visit.assessment.plan.recomendation.LoadAllRecommendationMethodTypesEvent;
	import com.gazuntite.input.event.visit.assessment.plan.recomendation.LoadAllRecommendationPlanTypesEvent;
	import com.gazuntite.input.event.visit.assessment.plan.recomendation.LoadPatientRecommendationByVisitIdEvent;
	import com.gazuntite.input.event.visit.assessment.plan.recomendation.LoadRecommendationLinksAutoCompleteEvent;
	import com.gazuntite.input.event.visit.assessment.plan.recomendation.ManagePatientRecommendationEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.viewModel.PatientDictationNoteViewModel;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class PatientInputAssessmentRecommendationViewModel
	{
		protected static var instance:PatientInputAssessmentRecommendationViewModel;
		
		public var model:QIModelLocator = QIModelLocator.getInstance();
		
		public var inlineDictationNoteViewModel:PatientDictationNoteViewModel;
		
		public function PatientInputAssessmentRecommendationViewModel(singleton:Number)
		{
			inlineDictationNoteViewModel = new PatientDictationNoteViewModel();
			inlineDictationNoteViewModel.inlineEditing = true;
		}
		
		public static function getInstance():PatientInputAssessmentRecommendationViewModel
		{
			if (instance == null)
				instance = new PatientInputAssessmentRecommendationViewModel(1);
			
			return instance;
		}
		
		public function loadRecommendationByVisitID():void
		{
			var ev:LoadPatientRecommendationByVisitIdEvent = new LoadPatientRecommendationByVisitIdEvent();
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
		
		public function loadRecommendationHistory():void
		{
			var ev:LoadRecommendationByPatientIdPagedEvent = new LoadRecommendationByPatientIdPagedEvent();
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
		
		public function loadRecommendationStaticData():void
		{
			if (!model.recommendationPlanTypeDTOList)
			{
				var planTypeEv:LoadAllRecommendationPlanTypesEvent = new LoadAllRecommendationPlanTypesEvent();
				CairngormEventDispatcher.getInstance().dispatchEvent(planTypeEv);
			}
			
			if (!model.recommendationMethodTypeDTOList)
			{
				var methodTypeEv:LoadAllRecommendationMethodTypesEvent = new LoadAllRecommendationMethodTypesEvent();
				CairngormEventDispatcher.getInstance().dispatchEvent(methodTypeEv);
			}
			
			if (!model.recommendationDurationTypeDTOList)
			{
				var durationTypeEv:LoadAllRecommendationDurationTypesEvent = new LoadAllRecommendationDurationTypesEvent();
				CairngormEventDispatcher.getInstance().dispatchEvent(durationTypeEv);
			}
		}
		
		public function clearRecommendation():void
		{
			if (model.recommendationDTOList)
				model.recommendationDTOList.removeAll();
			else
				model.recommendationDTOList = new ArrayCollection();
			
			if (model.recommendationDTOHistoryList)
				model.recommendationDTOHistoryList.removeAll();
			else
				model.recommendationDTOHistoryList = new ArrayCollection();
		}
		
		public function loadRecommendationWebLinks(searchTerm:String):void
		{
			var ev:LoadRecommendationLinksAutoCompleteEvent = new LoadRecommendationLinksAutoCompleteEvent(searchTerm);
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
		
		public function managePatientRecommendation(sectionName:String):void
		{
			var ev:ManagePatientRecommendationEvent = new ManagePatientRecommendationEvent(sectionName);
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
	}
}