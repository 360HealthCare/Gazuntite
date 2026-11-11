package com.gazuntite.input.view.inputsections.assessment.treatment.procedure
{
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.common.dto.assessment.procedure.ProcedureDTO;
	import com.gazuntite.common.dto.typeDTO.CPTMedicalTypeDTO;
	import com.gazuntite.common.event.visit.LoadCPTMedicalTypesEvent;
	import com.gazuntite.input.event.history.assessment.treatment.LoadProcedureByPatientIdPagedEvent;
	import com.gazuntite.input.event.visit.assessment.treatment.procedure.LoadProcedureByVisitIDEvent;
	import com.gazuntite.input.event.visit.assessment.treatment.procedure.ManagePatientProcedureEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.viewModel.PatientDictationNoteViewModel;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class PatientInputAssessmentProcedureViewModel
	{
		public static const PROCEDURE_CODE:int = 0;
		public static const PROCEDURE_NAME:int = 1;
		
		protected static var instance:PatientInputAssessmentProcedureViewModel;
		
		public var model:QIModelLocator = QIModelLocator.getInstance();
		
		public var dictationNoteViewModel:PatientDictationNoteViewModel;
		public var inlineDictationNoteViewModel:PatientDictationNoteViewModel;
		
		public function PatientInputAssessmentProcedureViewModel(singleton:Number)
		{
			dictationNoteViewModel = new PatientDictationNoteViewModel();
			
			inlineDictationNoteViewModel = new PatientDictationNoteViewModel();
			inlineDictationNoteViewModel.inlineEditing = true;
		}
		
		public static function getInstance():PatientInputAssessmentProcedureViewModel
		{
			if (instance == null)
			{
				instance = new PatientInputAssessmentProcedureViewModel(1);
			}
			
			return instance;
		}
		
		public function loadPatientProcedureByVisitID():void
		{
			var ev:LoadProcedureByVisitIDEvent = new LoadProcedureByVisitIDEvent();
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
		
		public function loadPatientProcedureByPatientID():void
		{
			var ev:LoadProcedureByPatientIdPagedEvent = new LoadProcedureByPatientIdPagedEvent();
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
		
		public function clearPatientProcedure():void
		{
			if (model.procedureDTOList)
				model.procedureDTOList.removeAll();
			else
				model.procedureDTOList = new ArrayCollection();
			
			if (model.procedureDTOHistoryList)
				model.procedureDTOHistoryList.removeAll();
			else
				model.procedureDTOHistoryList = new ArrayCollection();
		}
		
		/*public function loadPatientProcedureStaticData(searchTerm:String):void
		{
			var ev:LoadCPTMedicalTypesEvent = new LoadCPTMedicalTypesEvent(searchTerm);
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}*/
		
		public function loadMedicalCPTCodeForInputView(searchTerm:String, searchType:int):void
		{
			var ev:LoadCPTMedicalTypesEvent = new LoadCPTMedicalTypesEvent(searchTerm, searchType,model.LoggedInUserSessionID,model.LoggedInUserId, loadMedicalCPTCodeForInputViewCallback);
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
		
		public function loadMedicalCPTCodeForHistoryView(searchTerm:String, searchType:int):void
		{
			var ev:LoadCPTMedicalTypesEvent = new LoadCPTMedicalTypesEvent(searchTerm, searchType,model.LoggedInUserSessionID,model.LoggedInUserId, loadMedicalCPTCodeForHistoryViewCallback);
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
		
		public function managePatientProcedure(sectionName:String):void
		{
			var ev:ManagePatientProcedureEvent = new ManagePatientProcedureEvent(sectionName);
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}	
		
		public function loadMedicalCPTCodeForInputViewCallback(searchTerm:String, searchType:int, cptMedicalTypeDTOList:ArrayCollection):void
		{
			model.CptMedicalTypeDTOList = cptMedicalTypeDTOList;
			filterMedicalCPTCodes(model.procedureDTOList, searchTerm, searchType);
		}
		
		public function loadMedicalCPTCodeForHistoryViewCallback(searchTerm:String, searchType:int, cptMedicalTypeDTOList:ArrayCollection):void
		{
			model.CptMedicalTypeDTOList = cptMedicalTypeDTOList;
			filterMedicalCPTCodes(model.procedureDTOHistoryList, searchTerm, searchType);
		}
		
		private function filterMedicalCPTCodes(arrCol:ArrayCollection, searchTerm:String, searchType:int):void
		{
			var cptList:ArrayCollection;
			
			if (model.CptMedicalTypeDTOList != null)
			{
				if (model.CptMedicalTypeDTOList.length)
				{
					if (cptList == null)
						cptList = new ArrayCollection();
					
					for (var i:uint = 0; i < model.CptMedicalTypeDTOList.length; i++)
					{
						var obj:CPTMedicalTypeDTO = new CPTMedicalTypeDTO();
						obj = model.CptMedicalTypeDTOList[i];
						
						if (doesSearchTermMatchedWithLoadedData(obj, searchTerm, searchType))
						{
							if (arrCol != null && arrCol.length > 0)
							{
								var cptCode:CPTMedicalTypeDTO = obj as CPTMedicalTypeDTO;
								
								if (hasDuplicateValues(arrCol, cptCode))
									continue;
								else
									cptList.addItem(obj);
							}
							else
							{
								cptList.addItem(obj);
							}
						}
					}
					
					model.CptMedicalTypeDTOList = cptList;
				}
			}
		}
			
		private function doesSearchTermMatchedWithLoadedData(value:CPTMedicalTypeDTO, searchTerm:String, searchType:int):Boolean
		{
			switch (searchType)
			{
				case PROCEDURE_CODE:
					
					if (value.ProcedureCode.toLocaleLowerCase().indexOf(searchTerm.toLocaleLowerCase()) != -1)
						return true;
					
					return false;
					
				case PROCEDURE_NAME:
					
					if (value.ProcedureDescription.toLocaleLowerCase().indexOf(searchTerm.toLocaleLowerCase()) != -1)
						return true;
					
					return false;
					
				default:
					
					return false;
			}
		}
		
		private function hasDuplicateValues(arrCol:ArrayCollection, dto:CPTMedicalTypeDTO):Boolean
		{
			if (!arrCol)
				return false;
			
			for (var j:uint = 0; j < arrCol.length; j++)
			{
				var procedureDTO:ProcedureDTO = arrCol[j] as ProcedureDTO;
				
				if (dto.ProcedureCode == procedureDTO.cptmedicalDTO.ProcedureCode)
					return true;
			}
			
			return false;
		}
	}
}