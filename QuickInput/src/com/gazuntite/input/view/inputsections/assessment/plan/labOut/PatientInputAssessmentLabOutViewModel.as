package com.gazuntite.input.view.inputsections.assessment.plan.labOut
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.common.dto.assessment.labOut.LabDTO;
	import com.gazuntite.common.dto.assessment.labOut.LabOutLIONICLabTestDTO;
	import com.gazuntite.dictation.view.dictation.PatientDictationNoteViewEvent;
	import com.gazuntite.input.event.history.assessment.plan.labOut.LoadLabsByPatientIdPagedEvent;
	import com.gazuntite.input.event.history.assessment.treatment.LoadProcedureByPatientIdPagedEvent;
	import com.gazuntite.input.command.visit.assessment.plan.labout.LoadLabTestTypeStaticDataCommand;
	import com.gazuntite.input.event.visit.assessment.plan.labout.LoadLIONICLabTestTypeEvent;
	import com.gazuntite.input.event.visit.assessment.plan.labout.LoadLabPriorityTypeEvent;
	import com.gazuntite.input.event.visit.assessment.plan.labout.LoadLabSpecimenTypeStaticDataEvent;
	import com.gazuntite.input.event.visit.assessment.plan.labout.LoadLabTestOrderMethodTypeEvent;
	import com.gazuntite.input.event.visit.assessment.plan.labout.LoadLabTestTypeStaticDataEvent;
	import com.gazuntite.input.event.visit.assessment.plan.labout.LoadLabTypeStaticDataEvent;
	import com.gazuntite.input.event.visit.assessment.plan.labout.LoadPatientLabsByVisitEvent;
	import com.gazuntite.input.event.visit.assessment.plan.labout.ManagePatientLabsEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.viewModel.PatientDictationNoteViewModel;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class PatientInputAssessmentLabOutViewModel
	{
		public static const LAB_TEST_CODE:int = 0;
		public static const LAB_TEST_NAME:int = 1;
		
		protected static var instance:PatientInputAssessmentLabOutViewModel;
		
		public var model:QIModelLocator = QIModelLocator.getInstance();
		
		public var dictationNoteViewModel:PatientDictationNoteViewModel;
		public var inlineDictationNoteViewModel:PatientDictationNoteViewModel;
		
		public function PatientInputAssessmentLabOutViewModel(singleton:Number)
		{
			dictationNoteViewModel = new PatientDictationNoteViewModel();
			
			inlineDictationNoteViewModel = new PatientDictationNoteViewModel();
			inlineDictationNoteViewModel.inlineEditing = true;
		}
		
		public static function getInstance():PatientInputAssessmentLabOutViewModel
		{
			if (instance == null)
				instance = new PatientInputAssessmentLabOutViewModel(1);
			
			return instance;
		}
		
		public function loadPatientLabOutByVisitID():void
		{
			var ev:LoadPatientLabsByVisitEvent = new LoadPatientLabsByVisitEvent();
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
		
		public function loadPatientLabOutHistory():void
		{
			var ev:LoadLabsByPatientIdPagedEvent = new LoadLabsByPatientIdPagedEvent();
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
		
		public function loadLabOutStaticData():void
		{
			if (!model.labTestTypeDTOList)
			{
				var loadLabTestTypeEv:LoadLabTestTypeStaticDataEvent = new LoadLabTestTypeStaticDataEvent();
				CairngormEventDispatcher.getInstance().dispatchEvent(loadLabTestTypeEv);
			}
			
			if (!model.labTestOrderMethodTypeDTOList)
			{
				var loadOrderMethodEv:LoadLabTestOrderMethodTypeEvent = new LoadLabTestOrderMethodTypeEvent();
				CairngormEventDispatcher.getInstance().dispatchEvent(loadOrderMethodEv);
			}
			
			if (!model.labPriorityTypeDTOList)
			{
				var loadPriorityEv:LoadLabPriorityTypeEvent = new LoadLabPriorityTypeEvent();
				CairngormEventDispatcher.getInstance().dispatchEvent(loadPriorityEv);
			}
			
			if (!model.labTestSpecimenTypeDTOList)
			{
				var loadSpecimenEv:LoadLabSpecimenTypeStaticDataEvent = new LoadLabSpecimenTypeStaticDataEvent();
				CairngormEventDispatcher.getInstance().dispatchEvent(loadSpecimenEv);
			}
			
			if (!model.labTypeDTOList)
			{
				var loadLabTypes:LoadLabTypeStaticDataEvent = new LoadLabTypeStaticDataEvent();
				CairngormEventDispatcher.getInstance().dispatchEvent(loadLabTypes);
			}
		}
		
		public function loadLabTestForInputView(searchTerm:String, testTypeID:int, searchType:int):void
		{
			var ev:LoadLIONICLabTestTypeEvent = new LoadLIONICLabTestTypeEvent(searchTerm, testTypeID, searchType);
			ev.callback = loadLabTestForInputViewCallBack;
			
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
		
		public function loadLabTestForHistoryView(searchTerm:String, testTypeID:int, searchType:int):void
		{
			var ev:LoadLIONICLabTestTypeEvent = new LoadLIONICLabTestTypeEvent(searchTerm, testTypeID, searchType);
			ev.callback = loadLabTestForHistoryViewCallBack;
			
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
		
		public function managePatientLab(sectionName:String):void
		{
			var ev:ManagePatientLabsEvent = new ManagePatientLabsEvent(sectionName);
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
		
		public function clearPatientLabs():void
		{
			if (model.laboutDTOList)
				model.laboutDTOList.removeAll();
			else
				model.laboutDTOList = new ArrayCollection();
			
			if (model.labDTOHistoryList)
				model.labDTOHistoryList.removeAll();
			else
				model.labDTOHistoryList = new ArrayCollection();
		}
		
		public function loadLabTestForInputViewCallBack(searchTerm:String, searchType:int):void
		{
			filterLabTests(model.laboutDTOList, searchTerm, searchType);
		}
		
		public function loadLabTestForHistoryViewCallBack(searchTerm:String, searchType:int):void
		{
			filterLabTests(model.labDTOHistoryList, searchTerm, searchType);
		}
		
		private function filterLabTests(arrCol:ArrayCollection, searchTerm:String, searchType:int):void
		{
			var testTypeList:ArrayCollection;
			
			if (model.lionicLabTestTypeDTOList != null)
			{
				if (model.lionicLabTestTypeDTOList.length)
				{
					if (testTypeList == null)
						testTypeList = new ArrayCollection();
					
					for (var i:uint = 0; i < model.lionicLabTestTypeDTOList.length; i++)
					{
						var obj:LabOutLIONICLabTestDTO = new LabOutLIONICLabTestDTO();
						obj = model.lionicLabTestTypeDTOList[i];
						
						if (doesSearchTermMatchedWithLoadedData(obj, searchTerm, searchType))
						{
							if (arrCol != null && arrCol.length > 0)
							{
								var labTestDTO:LabOutLIONICLabTestDTO = obj as LabOutLIONICLabTestDTO;
								
								if (hasDuplicateValues(arrCol, labTestDTO))
									continue;
								else
									testTypeList.addItem(obj);
							}
							else
							{
								testTypeList.addItem(obj);
							}
						}
					}
					
					model.lionicLabTestTypeDTOList = testTypeList;
				}
			}
		}
		
		private function doesSearchTermMatchedWithLoadedData(value:LabOutLIONICLabTestDTO, searchTerm:String, searchType:int):Boolean
		{
			switch (searchType)
			{
				case LAB_TEST_CODE:
					
					if (value.testNum.toLocaleLowerCase().indexOf(searchTerm.toLocaleLowerCase()) != -1)
						return true;
					
					return false;
					
				case LAB_TEST_NAME:
					
					if (value.Name.toLocaleLowerCase().indexOf(searchTerm.toLocaleLowerCase()) != -1)
						return true;
					
					return false;
					
				default:
					
					return false;
			}
		}
		
		private function hasDuplicateValues(arrCol:ArrayCollection, dto:LabOutLIONICLabTestDTO):Boolean
		{
			if (!arrCol)
				return false;
			
			for (var j:uint = 0; j < arrCol.length; j++)
			{
				var labDTO:LabDTO = arrCol[j] as LabDTO;
				
				if (dto.testNum == labDTO.LIONICLabTestType.testNum)
					return true;
			}
			
			return false;
		}
	}
}