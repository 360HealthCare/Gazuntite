package com.gazuntite.input.view.inputsections.physical.chiefcomplaint
{
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.input.event.history.physical.ccHpi.LoadHPIByPatientIdPagedEvent;
	import com.gazuntite.input.command.visit.physical.cchpi.staticdata.LoadAllHPIDetailTypesCommand;
	import com.gazuntite.input.command.visit.physical.cchpi.staticdata.LoadHPIStaticDataCommand;
	import com.gazuntite.input.event.visit.physical.cchpi.LoadHPIStaticDataEvent;
	import com.gazuntite.input.event.visit.physical.cchpi.LoadPatientHPIByVisitEvent;
	import com.gazuntite.input.event.visit.physical.cchpi.ManagePatientHPIEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.viewModel.PatientDictationNoteViewModel;
	
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class PatientInputPhysicalChiefComplaintViewModel
	{
		protected static var instance:PatientInputPhysicalChiefComplaintViewModel;
		
		public var dictationNoteViewModel:PatientDictationNoteViewModel;
		public var dictationNoteHistoryViewModel:PatientDictationNoteViewModel;
		public var inlineDictationNoteViewModel:PatientDictationNoteViewModel;
		
		private var model:QIModelLocator = QIModelLocator.getInstance();
		
		public function PatientInputPhysicalChiefComplaintViewModel(singleton:Number)
		{
			dictationNoteViewModel = new PatientDictationNoteViewModel();
			
			dictationNoteHistoryViewModel = new PatientDictationNoteViewModel();
			
			inlineDictationNoteViewModel = new PatientDictationNoteViewModel();
			inlineDictationNoteViewModel.inlineEditing = true;
		}
		
		public static function getInstance():PatientInputPhysicalChiefComplaintViewModel
		{
			if (instance == null)
			{
				instance = new PatientInputPhysicalChiefComplaintViewModel(1);
			}
			return instance;
		}
		
		public function loadChiefComplaintHpi():void
		{
			loadChiefComplaintHpiByVisitId();
			loadChiefComplaintHpiHistory();
		}
		
		public function loadChiefComplaintHpiByVisitId():void
		{
			var ev:LoadPatientHPIByVisitEvent = new LoadPatientHPIByVisitEvent();
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
		
		public function loadChiefComplaintHpiHistory():void
		{
			var ev:LoadHPIByPatientIdPagedEvent = new LoadHPIByPatientIdPagedEvent();
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
		
		public function loadHpiStaticLists(sectionName:String, searchString:String):void
		{
			var ev:LoadHPIStaticDataEvent = new LoadHPIStaticDataEvent(sectionName, searchString);
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
		
		public function manageChiefComplaintHpi(sectionName:String):void
		{
			var ev:ManagePatientHPIEvent = new ManagePatientHPIEvent(sectionName);
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
		
		public function clearChiefComplaintHpi():void
		{
			if (model.chiefComplaintHpiDTOList)
				model.chiefComplaintHpiDTOList.removeAll();
			else
				model.chiefComplaintHpiDTOList = new ArrayCollection();
			
			if (model.chiefComplaintHpiDTOHistoryList)
				model.chiefComplaintHpiDTOHistoryList.removeAll();
			else
				model.chiefComplaintHpiDTOHistoryList = new ArrayCollection();
		}
	}
}