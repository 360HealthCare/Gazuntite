package com.gazuntite.input.view.inputsections.physical.inhouselab
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.common.dto.physical.inHouseLab.InHouseLabDTO;
	import com.gazuntite.common.dto.physical.inHouseLab.InHouseLabTestTypeDTO;
	import com.gazuntite.input.event.history.physical.inHouseLab.LoadInHouseLabsByPatientIdPagedEvent;
	import com.gazuntite.input.command.visit.physical.labin.staticData.LoadLabInStaticDataCommand;
	import com.gazuntite.input.event.visit.assessment.plan.followup.LoadFollowUpPatientLabTestTypesByPatientIdEvent;
	import com.gazuntite.input.event.visit.physical.labin.LoadPatientInHouseLabsByVisitIdEvent;
	import com.gazuntite.input.event.visit.physical.labin.ManagePatientInHouseLabsEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.input.utils.SortType;
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.input.utils.QIUtilityFunctions;
	import com.gazuntite.input.view.components.visit.events.LoadInHouseLabTestTypeByClinicIdEvent;
	import com.gazuntite.skins.controls.container.PatientDictationNoteViewSkin;
	import com.gazuntite.viewModel.PatientDictationNoteViewModel;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	import spark.collections.Sort;
	import spark.collections.SortField;
	
	[Bindable]
	public class PatientInputPhysicalInHouseLabViewModel
	{
		public static const IN_HOUSE_LAB_TEST_CODE:int = 0;
		public static const IN_HOUSE_LAB_TEST_NAME:int = 1;
		
		protected static var instance:PatientInputPhysicalInHouseLabViewModel;
		
		public var dictationNoteViewModel:PatientDictationNoteViewModel;
		public var dictationNoteHistoryViewModel:PatientDictationNoteViewModel;
		public var inlineDictationNoteViewModel:PatientDictationNoteViewModel;
		
		public var model:QIModelLocator = QIModelLocator.getInstance();
		
		private var _inputListSortType:String;
		private var _historyListSortType:String;
		
		public function PatientInputPhysicalInHouseLabViewModel(singleton:Number)
		{
			dictationNoteViewModel = new PatientDictationNoteViewModel();
			dictationNoteHistoryViewModel = new PatientDictationNoteViewModel();
			
			inlineDictationNoteViewModel = new PatientDictationNoteViewModel();singleton;
			inlineDictationNoteViewModel.inlineEditing = true;
		}
		
		public static function getInstance():PatientInputPhysicalInHouseLabViewModel
		{
			if (instance == null)
			{
				instance = new PatientInputPhysicalInHouseLabViewModel(1);
			}
			return instance;
		}
		
		public function loadInHouseLabs():void
		{
			var ev:LoadPatientInHouseLabsByVisitIdEvent = new LoadPatientInHouseLabsByVisitIdEvent();
			ev.onInHouseLabLoadCallBack = onInHouseLabsLoadComplete;
			
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
			
			var loadInHouseHistoryEv:LoadInHouseLabsByPatientIdPagedEvent = new LoadInHouseLabsByPatientIdPagedEvent();
			CairngormEventDispatcher.getInstance().dispatchEvent(loadInHouseHistoryEv);
		}
		
		public function clearInHouseLabs():void
		{
			if (model.inHouseLabDTOList)
				model.inHouseLabDTOList.removeAll();
			else
				model.inHouseLabDTOList = new ArrayCollection();
			
			if (model.inHouseLabDTOHistoryList)
				model.inHouseLabDTOHistoryList.removeAll();
			else
				model.inHouseLabDTOHistoryList = new ArrayCollection();
		}
		
		public function manageInHouseLab(sectionName:String, callback:Function = null):void
		{
			var ev:ManagePatientInHouseLabsEvent = new ManagePatientInHouseLabsEvent(sectionName, callback);
			ev.callBack = onInHouseLabsLoadComplete;
			
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
		
		public function loadInHouseLabTestForInputView(searchTerm:String, searchType:int):void
		{
			var ev:LoadInHouseLabTestTypeByClinicIdEvent = new LoadInHouseLabTestTypeByClinicIdEvent(searchTerm, 
						searchType, onLoadInHouseLabTestForInput);
			
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}

		public function loadInHouseLabTestForHistoryView(searchTerm:String, searchType:int):void
		{
			var ev:LoadInHouseLabTestTypeByClinicIdEvent = new LoadInHouseLabTestTypeByClinicIdEvent(searchTerm,
						searchType, onLoadInHouseLabTestForHistory);
			
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
		
		public function onLoadInHouseLabTestForInput(searchTerm:String, searchType:int):void
		{
			filterInHouseLabTests(model.inHouseLabDTOList, searchTerm, searchType);
		}
		
		public function onLoadInHouseLabTestForHistory(searchTerm:String,searchType:int):void
		{
			filterInHouseLabTests(model.inHouseLabDTOHistoryList, searchTerm, searchType);
		}
		
		private function filterInHouseLabTests(arrCol:ArrayCollection, searchTerm:String, searchType:int):void
		{
			var labTestList:ArrayCollection;
			
			if (model.inHouseLabTestTypeDTOList != null)
			{
				if (model.inHouseLabTestTypeDTOList.length)
				{
					if (labTestList == null)
						labTestList = new ArrayCollection();
					
					for (var i:uint = 0; i < model.inHouseLabTestTypeDTOList.length; i++)
					{
						var obj:InHouseLabTestTypeDTO = new InHouseLabTestTypeDTO();
						obj = model.inHouseLabTestTypeDTOList[i];
						
						if (doesSearchTermMatchedWithLoadedData(obj, searchTerm, searchType))
						{
							if (arrCol != null && arrCol.length > 0)
							{
								var labTest:InHouseLabTestTypeDTO = obj as InHouseLabTestTypeDTO;
								
								if (hasDuplicateValues(arrCol, labTest))
									continue;
								else
									labTestList.addItem(obj);
							}
							else
							{
								labTestList.addItem(obj);
							}
						}
					}
					
					model.inHouseLabTestTypeDTOList = labTestList;
				}
			}
		}
		
		private function doesSearchTermMatchedWithLoadedData(value:InHouseLabTestTypeDTO, searchTerm:String, searchType:int):Boolean
		{
			switch (searchType)
			{
				case IN_HOUSE_LAB_TEST_CODE:
					
					if (value.Code.toLocaleLowerCase().indexOf(searchTerm.toLocaleLowerCase()) != -1)
						return true;
					
					return false;
					
				case IN_HOUSE_LAB_TEST_NAME:
					
					if (value.Name.toLocaleLowerCase().indexOf(searchTerm.toLocaleLowerCase()) != -1)
						return true;
					
					return false;
					
				default:
					
					return false;
			}
		}
		
		private function hasDuplicateValues(arrCol:ArrayCollection, dto:InHouseLabTestTypeDTO):Boolean
		{
			if (!arrCol)
				return false;
			
			for (var j:uint = 0; j < arrCol.length; j++)
			{
				var labDTO:InHouseLabDTO = arrCol[j] as InHouseLabDTO;
				
				if (dto.Code == labDTO.InHouseLabTestType.Code)
					return true;
			}
			
			return false;
		}
		
		public function onInHouseLabsLoadComplete(sectionName:String):void
		{
			sortInHouseLabList(inputListSortType, sectionName);
			
			//[08/29/2013]Shahid Munir #3953 load list for followup			
			var evt:LoadFollowUpPatientLabTestTypesByPatientIdEvent = new LoadFollowUpPatientLabTestTypesByPatientIdEvent();
			CairngormEventDispatcher.getInstance().dispatchEvent(evt);
		}
		
		public function sortInHouseLabList(sortType:String, sectionName:String):void
		{
			var fieldName:String = null;
			
			switch (sortType)
			{
				case SortType.RECENTLY_ADDED:
					
					fieldName = "PatientInHouseLabTestID";
					break;
				
				case SortType.IN_HOUSE_LAB_TEST_NAME:
					
					fieldName = "InHouseLabTestType.Name";
					break;
				
				default:
					
					break;
			}
			
			if (!fieldName)
				return;
			
			if (fieldName.indexOf(".") == -1)
			{
				var dataSortField:SortField = new SortField();
				dataSortField.name = fieldName;
				dataSortField.numeric = false;
				dataSortField.descending = true;
				
				var dataSort:Sort = new Sort();
				dataSort.fields = [dataSortField];
				
				switch (sectionName)
				{
					case QIConstants.INPUT_VIEW:
						
						model.inHouseLabDTOList.sort = dataSort;
						model.inHouseLabDTOList.refresh();
						
						QIUtilityFunctions.reAssignSerialNumbers(model.inHouseLabDTOList);
						
						break;
					
					case QIConstants.HISTORY_VIEW:
						
						model.inHouseLabDTOHistoryList.sort = dataSort;
						model.inHouseLabDTOHistoryList.refresh();
						
						QIUtilityFunctions.reAssignSerialNumbers(model.inHouseLabDTOHistoryList);
						
						break;
				}
				
			}
			else
			{
				switch (sectionName)
				{
					case QIConstants.INPUT_VIEW:
						
						model.inHouseLabDTOList = QIUtilityFunctions.sortOnComplexDataFields(model.inHouseLabDTOList, fieldName);
						
						break;
					
					case QIConstants.HISTORY_VIEW:
						
						model.inHouseLabDTOHistoryList = QIUtilityFunctions.sortOnComplexDataFields(model.inHouseLabDTOHistoryList, fieldName);
						
						break;
				}
			}
		}

		public function get inputListSortType():String
		{
			return _inputListSortType;
		}

		public function set inputListSortType(value:String):void
		{
			_inputListSortType = value;
		}

		public function get historyListSortType():String
		{
			return _historyListSortType;
		}

		public function set historyListSortType(value:String):void
		{
			_historyListSortType = value;
		}
	}
}