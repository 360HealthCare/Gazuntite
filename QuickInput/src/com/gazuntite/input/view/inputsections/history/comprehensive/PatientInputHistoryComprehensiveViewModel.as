package com.gazuntite.input.view.inputsections.history.comprehensive
{
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.common.dto.ModuleDictationDTO;
	import com.gazuntite.common.dto.pmh.compHistory.FamilyHistoryDTO;
	import com.gazuntite.common.dto.pmh.compHistory.MedicalHistoryDTO;
	import com.gazuntite.common.dto.pmh.compHistory.SocialHistoryAddictionDTO;
	import com.gazuntite.input.event.visit.pmh.comphistory.LoadSocialHistoryByPatientIdEvent;
	import com.gazuntite.input.event.visit.pmh.comphistory.ManagePatientSocialHistoryEvent;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.input.view.viewmodel.tempmodel.TempBasicItemModel;
	import com.gazuntite.viewModel.PatientDictationNoteViewModel;
	
	import mx.collections.ArrayCollection;
	
	import spark.formatters.DateTimeFormatter;
	
	[Bindable]
	public class PatientInputHistoryComprehensiveViewModel
	{
		protected static var instance:PatientInputHistoryComprehensiveViewModel;
		
		public var model:QIModelLocator = QIModelLocator.getInstance();		
		public var newComprehensiveInputDictationNoteViewModel:PatientDictationNoteViewModel = new PatientDictationNoteViewModel();
		public var comprehensiveHistoryDictationNoteHistoryViewModel:PatientDictationNoteViewModel = new PatientDictationNoteViewModel();
		
		//[22/11/2013]sm
		public var dictationDTO:ModuleDictationDTO;
		
		public var currentTabState:String = "general";
				
		/*public var curNewFamilyDataModel:FamilyHistoryDTO;
		public var availableFamilyIcdCodeList:ArrayCollection; // list of ICDCodeDTO
		
		public var newFamilyHeartModel:FamilyHistoryDTO;
		public var newFamilyHypertensionModel:FamilyHistoryDTO;
		public var newFamilyDiabetesModel:FamilyHistoryDTO;
		public var newFamilyCancerModel:FamilyHistoryDTO;
		public var newFamilyOtherModel:FamilyHistoryDTO;
		
		public var newFamilyHeartIcdCodeList:ArrayCollection = new ArrayCollection();
		public var newFamilyHypertensionIcdCodeList:ArrayCollection = new ArrayCollection();
		public var newFamilyDiabetesIcdCodeList:ArrayCollection = new ArrayCollection();
		public var newFamilyCancerIcdCodeList:ArrayCollection = new ArrayCollection();
		public var newFamilyOtherIcdCodeList:ArrayCollection = new ArrayCollection();*/
		
		// Social
		
		public var curNewSocialDataModel:SocialHistoryAddictionDTO;
		public var availableSocialIcdCodeList:ArrayCollection; // list of ICDCodeDTO
		
		public var newSocialTobaccoModel:SocialHistoryAddictionDTO;
		public var newSocialAlcoholModel:SocialHistoryAddictionDTO;
		public var newSocialDrugsModel:SocialHistoryAddictionDTO;
		public var newSocialWorkModel:SocialHistoryAddictionDTO;
		public var newSocialMaritalModel:SocialHistoryAddictionDTO;
		public var newSocialOtherModel:SocialHistoryAddictionDTO;		
		
		
		public var newMedical:MedicalHistoryDTO;
		public var newFamily:FamilyHistoryDTO;
		public var newSocial:SocialHistoryAddictionDTO;
		
		public var selectedAllergyInputItem:TempBasicItemModel;
		public var inlineAllergyInputDictationNoteViewModel:PatientDictationNoteViewModel = new PatientDictationNoteViewModel();
		public var selectedAllergyHistoryItem:TempBasicItemModel;
		
		protected var formatDateTime:DateTimeFormatter = new DateTimeFormatter();
		
		public function PatientInputHistoryComprehensiveViewModel(useSingleton:Number = 1)
		{
			formatDateTime.dateTimePattern = "MM/DD/YYYY";
		}
		public static function getInstance():PatientInputHistoryComprehensiveViewModel
		{
			if (instance == null)
			{
				instance = new PatientInputHistoryComprehensiveViewModel();
			}
			return instance;
		}
		
		public function saveSocialHistory():void
		{
			model.socialHistoryDTO.PatientID  = model.patientDTO.ID;
			model.socialHistoryDTO.VisitID    = model.VisitID;
			model.socialHistoryDTO.CreatedAt  = new Date();
			model.socialHistoryDTO.CreatedBy  = model.LoggedInUserId;
			model.socialHistoryDTO.ModifiedAt = new Date();
			model.socialHistoryDTO.ModifiedBy = model.LoggedInUserId; 
			
			model.socialHistoryDTO.CreatedAt = new Date();
			
			var evt:ManagePatientSocialHistoryEvent = new ManagePatientSocialHistoryEvent( model.LoggedInUserSelectedBranchId, model.patientDTO.ID, model.LoggedInUserSessionID, clearSocialHistory );
			CairngormEventDispatcher.getInstance().dispatchEvent( evt );
		}
		
		public function clearSocialHistory():void
		{
			model.socialHistoryDTO = null;
			model.SocialHistoryAddictionTypeDTOList = null;
			loadSocialHistory();
		}
		
		public function loadSocialHistory():void
		{
			var loadSocialHistoryEvent : LoadSocialHistoryByPatientIdEvent = new LoadSocialHistoryByPatientIdEvent();
			CairngormEventDispatcher.getInstance().dispatchEvent( loadSocialHistoryEvent );
		}
	}
}