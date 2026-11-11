package com.gazuntite.patient.visit.model
{
	import com.adobe.cairngorm.model.ModelLocator;
	import com.gazuntite.patient.visit.dto.AssociatedVisit;
	import com.gazuntite.patient.visit.dto.FamilyHistroyDTO;
	import com.gazuntite.patient.visit.dto.SocialHistoryDTO;
	import com.gazuntite.patient.visit.dto.VitalsDTO;
	import com.gazuntite.patient.visit.view.reviewcomponents.ReviewAllXML;
	import com.gazuntite.common.dto.PatientDTO;
	
	import mx.collections.ArrayCollection;
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.utils.ObjectProxy;
	
	[Bindable]
	public class QIModelLocator  implements ModelLocator
	{
		
		////////////// singlton impl start /////////////
		
		private var logger:ILogger = Log.getLogger("com.gazuntite.patient.visit.model.QIModelLocator");
		private static var model 							:QIModelLocator;
		//public var loadedPatientId						:int=0 ;
		
		
		public var updateVBVisiList:Boolean = false;//for update encouner list in VB
		//Associated Visit Section;
		
		private var _CHistoryAssociatedVisit:AssociatedVisit;
		private var _ImmonizationAssociatedVisit:AssociatedVisit;
		private var _DiagnosisAssociatedVisit:AssociatedVisit;
		
		public function QIModelLocator() : void 
		{
			if ( model != null )
				throw new Error( "Only one QIModelLocator instance should be instantiated. use getInstance() method instead." );
		}
		
		
		public function get NotesDictationFlag():Boolean
		{
			return _NotesDictationFlag;
		}

		public function set NotesDictationFlag(value:Boolean):void
		{
			_NotesDictationFlag = value;
		}

		public function get checkNotesExsist():Boolean
		{
			return _checkNotesExsist;
		}

		public function set checkNotesExsist(value:Boolean):void
		{
			_checkNotesExsist = value;
		}

		public function get dictationUploadInProcessCount():int
		{
			return _dictationUploadInProcessCount;
		}
		
		public function set dictationUploadInProcessCount(value:int):void
		{
			_dictationUploadInProcessCount = value;
		}
		
		public function get canCoSign():Boolean
		{
			return _canCoSign;
		}
		
		public function set canCoSign(value:Boolean):void
		{
			_canCoSign = value;
		}
		
		public function get newRegGaxenID():String
		{
			return _newRegGaxenID;
		}
		
		public function set newRegGaxenID(value:String):void
		{
			_newRegGaxenID = value;
		}
		
		public function get gaxenIDSaved():Boolean
		{
			return _gaxenIDSaved;
		}
		
		public function set gaxenIDSaved(value:Boolean):void
		{
			_gaxenIDSaved = value;
		}
		
		public function get isAtRegGaxenID():Boolean
		{
			return _isAtRegGaxenID;
		}
		
		public function set isAtRegGaxenID(value:Boolean):void
		{
			_isAtRegGaxenID = value;
		}
		
		public function get reviewHistroy():ReviewAllXML
		{
			return _reviewHistroy;
		}
		
		public function set reviewHistroy(value:ReviewAllXML):void
		{
			_reviewHistroy = value;
		}
		
		public function get signCoSignBtnLabel():String
		{
			return _signCoSignBtnLabel;
		}
		
		public function set signCoSignBtnLabel(value:String):void
		{
			_signCoSignBtnLabel = value;
		}
		
		public function get DiagnosisAssociatedVisit():AssociatedVisit
		{
			return _DiagnosisAssociatedVisit;
		}
		
		public function set DiagnosisAssociatedVisit(value:AssociatedVisit):void
		{
			_DiagnosisAssociatedVisit = value;
		}
		
		public function get CHistoryAssociatedVisit():AssociatedVisit
		{
			return _CHistoryAssociatedVisit;
		}
		
		public function set CHistoryAssociatedVisit(value:AssociatedVisit):void
		{
			_CHistoryAssociatedVisit = value;
		}
		
		public function get ImmonizationAssociatedVisit():AssociatedVisit
		{
			return _ImmonizationAssociatedVisit;
		}
		
		public function set ImmonizationAssociatedVisit(value:AssociatedVisit):void
		{
			_ImmonizationAssociatedVisit = value;
		}
		
		public function get ClinicBranchIdSeq():int
		{
			return _ClinicBranchIdSeq;
		}
		
		public function set ClinicBranchIdSeq(value:int):void
		{
			_ClinicBranchIdSeq = value;
		}
		
		public function get isAllStationSelected():Boolean
		{
			return _isAllStationSelected;
		}
		
		public function set isAllStationSelected(value:Boolean):void
		{
			_isAllStationSelected = value;
		}
		
		public static function getInstance() : QIModelLocator 
		{
			if ( model == null )
				model = new QIModelLocator();
			return model;
		}
		
		// used only in signing-out from the application...
		public static function reSetModelInstance() : void 
		{
			
			model = null;
			
		}
		
		
		////////////// singlton impl end /////////////
		
		////////////// Logged In User Info START /////////////
		
		
		//Logged In User info members...
		private var m_iLoggedInUserId:int, 
		m_iLoggedInUserSelectedBranchId:int, 
		m_iLoggedInUserProviderId:int, 
		m_iLoggedInUserProviderTypeId:int,
		m_sUserSelectedPracticeName:String, 
		m_sStationName:String,
		m_iStationID:int,
		m_bIsloggedInUserProvider:Boolean,
		m_bIsloggedInUserFemale:Boolean,
		m_sLoggedInUserSessionID:String,_ClinicBranchIdSeq:int = 7;   // temp id
		
		
		private var _signCosignBtnEnabled:Boolean;
		private var _signCoSignBtnLabel:String;
		private var _canSign:Boolean;
		private var _canCoSign:Boolean;
		public var patientDTO:PatientDTO;
		
		private var _reviewHistroy       :ReviewAllXML = new ReviewAllXML();
		
		private var _dictationUploadInProcessCount:int;
		private var _checkNotesExsist:Boolean;
		private var _NotesDictationFlag:Boolean;
		
		
		private var _patientID:int,_VisitDate : Date,
		_VisitID : int , _gaxenID:String = '' , _isAtRegGaxenID:Boolean ,_gaxenIDSaved:Boolean ,_newRegGaxenID:String ,_isAllStationSelected:Boolean = false;
		
		
		
		
		public function updateModel(loggedInUserId:int, loggedInUserProviderId:int, loggedInUserProviderTypeId:int, loggedInUserSelectedBranchId:int, userSelectedPracticeName:String, stationName:String, stationId:int, authentication:ObjectProxy, IsloggedInUserProvider:Boolean, IsloggedInUserFemale:Boolean, loggedInUserSessionID:String):void
		{
			this.LoggedInUserId						= loggedInUserId;
			this.LoggedInUserProviderId				= loggedInUserProviderId;
			this.LoggedInUserProviderTypeId			= loggedInUserProviderTypeId;
			this.LoggedInUserSelectedBranchId		= loggedInUserSelectedBranchId;
			this.LoggedInUserSelectedPracticeName	= userSelectedPracticeName; 
			this.LoggedInUserSelectedStationName 	= stationName; 
			this.LoggedInUserSelectedStationID		= stationId;
			this.IsloggedInUserProvider				= IsloggedInUserProvider;
			this.IsloggedInUserFemale				= IsloggedInUserFemale;
			this.LoggedInUserSessionID				= loggedInUserSessionID;
		}
		
		public function resetModel():void
		{
			this.LoggedInUserId						= undefined;
			this.LoggedInUserProviderId				= undefined;
			this.LoggedInUserProviderTypeId			= undefined;
			this.LoggedInUserSelectedBranchId		= undefined;
			this.LoggedInUserSelectedPracticeName	= undefined; 
			this.LoggedInUserSelectedStationName 	= undefined; 
			this.LoggedInUserSelectedStationID		= undefined;
			
		}
		
		public function get LoggedInUserSelectedBranchId():int
		{
			return m_iLoggedInUserSelectedBranchId;
		}
		
		public function set LoggedInUserSelectedBranchId(value:int):void
		{
			m_iLoggedInUserSelectedBranchId = value;
		}
		
		public function get LoggedInUserSessionID():String
		{
			return m_sLoggedInUserSessionID;
		}
		
		public function set LoggedInUserSessionID(value:String):void
		{
			m_sLoggedInUserSessionID = value;
		}
		
		
		public function get LoggedInUserId():int
		{
			return m_iLoggedInUserId;
		}
		
		public function set LoggedInUserId(value:int):void
		{
			m_iLoggedInUserId = value;
		}
		
		public function get LoggedInUserProviderId():int
		{
			return m_iLoggedInUserProviderId;
		}
		
		public function set LoggedInUserProviderId(value:int):void
		{
			m_iLoggedInUserProviderId = value;
		}
		
		public function get LoggedInUserProviderTypeId():int
		{
			return m_iLoggedInUserProviderTypeId;
		}
		
		public function set LoggedInUserProviderTypeId(value:int):void
		{
			m_iLoggedInUserProviderTypeId = value;
		}
		
		public function get LoggedInUserSelectedPracticeName():String
		{
			return m_sUserSelectedPracticeName;
		}
		
		public function set LoggedInUserSelectedPracticeName(value:String):void
		{
			m_sUserSelectedPracticeName = value;
		}
		
		public function get LoggedInUserSelectedStationName():String
		{
			return m_sStationName;
		}
		
		public function set LoggedInUserSelectedStationName(value:String):void
		{
			m_sStationName = value;
		}
		
		public function get LoggedInUserSelectedStationID():int
		{
			return m_iStationID;
		}
		
		public function set LoggedInUserSelectedStationID(value:int):void
		{
			m_iStationID = value;
		}
		
		public function get IsloggedInUserFemale():Boolean
		{
			return m_bIsloggedInUserFemale;
		}
		
		public function set IsloggedInUserFemale(value:Boolean):void
		{
			m_bIsloggedInUserFemale = value;
		}
		
		public function get IsloggedInUserProvider():Boolean
		{
			return m_bIsloggedInUserProvider;
		}
		
		public function set IsloggedInUserProvider(value:Boolean):void
		{
			m_bIsloggedInUserProvider = value;
		}
		public function get gaxenID():String
		{
			return _gaxenID;
		}
		
		public function set gaxenID(value:String):void
		{
			_gaxenID = value;
		}
		
		public function get canSign():Boolean
		{
			return _canSign;
		}
		
		public function set canSign(value:Boolean):void
		{
			_canSign = value;
		}
		
		public function get signCosignBtnEnabled():Boolean
		{
			return _signCosignBtnEnabled;
		}
		
		public function set signCosignBtnEnabled(value:Boolean):void
		{
			_signCosignBtnEnabled = value;
		}
		
		public function get patientID():int
		{
			return _patientID;
		}
		
		public function set patientID(value:int):void
		{
			_patientID = value;
		}
		
		public function get VisitID():int
		{
			return _VisitID;
		}
		
		public function set VisitID(value:int):void
		{
			_VisitID = value;
		}
		
		public function get VisitDate():Date
		{
			return _VisitDate;
		}
		
		public function set VisitDate(value:Date):void
		{
			_VisitDate = value;
		}
		
		
		public var placeOfServiceList:ArrayCollection = new ArrayCollection();
		public var placeOfServiceID:int;
		public var placeOfServiceName:String = '';
		public var PlaceOfServiceTypeID:int;
		public var PlaceOfServiceTypeName:String = '';
		public var moduleType:ArrayCollection = new ArrayCollection();
		
		public var encounterTypeDTOList:ArrayCollection = new ArrayCollection();
		public var moduleNotes:ArrayCollection = new ArrayCollection();
		public var moduleDictationList:ArrayCollection = new ArrayCollection();
		
		
		public var DiseaseTypeList:ArrayCollection = new ArrayCollection();
		public var RelationShipTypeList:ArrayCollection = new ArrayCollection();
		
		public var EncounterTypeId:int;
		public var EncounterTypeName:String;
		
		public var unSignedVisitDates					:ArrayCollection = new ArrayCollection();
		public var patientDiagnosisAllChronicTemplateAvailable    :Boolean;
		

		public var selectedFamilyHistoryRecord:FamilyHistroyDTO;

		
		
		////////////// Logged In User Info end /////////////
		
		
		//////////////  for provider in QI //////////////
		
		public var VisitProviderDTOList						:ArrayCollection;//tahir alvi - for provider list in QI
		public var VisitProviderSelected					:int;//tahir alvi - for provider list in QI
		public var VisitProviderOwnerType					:int;//tahir alvi - for provider list in QI
		public var VisitProviderSelectedUserID				:int;//tahir alvi - for provider list in QI
		public var VisitProviderOwnerUSerTypeID				:int;//tahir alvi - for provider list in QI
		public var VisitProviderName						:String;//tahir alvi - for provider list in QI
		public var isVisitPhysicainSaved					:Boolean = false;
		
		
		//////////////  for provider in QI //////////////
		
		////////////// CCHPI Related Stuff Start /////////////
		
		
		public var hpiDetailTypesList					:ArrayCollection;		
		public var Symptoms								:ArrayCollection;		
		public var Location								:ArrayCollection;		
		public var Severity								:ArrayCollection;		
		public var ModifyingFactors						:ArrayCollection;		
		public var Progression							:ArrayCollection;		
		public var Duration								:ArrayCollection;		
		public var Quality								:ArrayCollection;		
		public var Context								:ArrayCollection;		
		public var Exacerbating							:ArrayCollection;		
		public var Radiation							:ArrayCollection;		
		public var contextList							:ArrayCollection;		
		public var HPI_CCDTOList						:ArrayCollection = new ArrayCollection();		
		
		////////////// CCHPI Related Stuff End /////////////
		
		
		////////////// Comprehensive History Related Stuff Start /////////////
		
		//static Data
		public var GeneralHistoryTypeDTOList			:ArrayCollection; // all MedicalHistoryTypeDTOs list 
		public var FamilyHistoryTypeDTOList				:ArrayCollection; // all FamilyHistoryTypeDTOs list
		public var SocialHistoryAddictionTypeDTOList	:ArrayCollection; // all SocialHistoryTypeDTOs list
		public var allSocialHistoryAddictionTypeDTOList	:ArrayCollection; // all SocialHistoryTypeDTOs list
		public var usageAmountTypeDTOList				:ArrayCollection;
		public var historyMediumTypesDTOList			:ArrayCollection;
		
		
		public var medicalHistoryDTOListByPatient			:ArrayCollection;
		public var socialHistoryDTOListByPatient			:ArrayCollection;
		public var socialHistoryDTO							:SocialHistoryDTO;
		
		
		
		public var heartDiseaseDiseaseTypesDTOList:ArrayCollection 		= new ArrayCollection();
		public var hypertensionDiseaseTypesDTOList:ArrayCollection		= new ArrayCollection();
		public var diabetesDiseaseTypesDTOList:ArrayCollection 			= new ArrayCollection();
		public var cancerDiseaseTypesDTOList:ArrayCollection 			= new ArrayCollection();
		public var otherDiseaseTypesDTOList:ArrayCollection 			= new ArrayCollection();
		
		//Tab input data
		public var GeneralMedicalHistoryList:ArrayCollection = new ArrayCollection();
		public var FamilyHistoryList:ArrayCollection = new ArrayCollection();
		public var SocialHistoryList:ArrayCollection = new ArrayCollection();
		
		
		public var icdCodeList:ArrayCollection;
		
		
		public var isQISocHistorySave:Boolean				= false;
		
		
		//old patient Data ... previous patient history
		
		public var PreviousGeneralMedicalHistoryList:ArrayCollection;
		public var PreviousFamilyHistoryList:ArrayCollection;
		public var PreviousSocialHistoryList:ArrayCollection;
		
		////////////// Comprehensive History Related Stuff End /////////////
		
		
		
		////////////// ROS Related Stuff Start /////////////
		public var rosDTOList:ArrayCollection;
		
		////////////// ROS Related Stuff End /////////////
		
		
		
		
		////////////// Physical Related Stuff Start /////////////
		public var physicalDTOList:ArrayCollection;
		
		////////////// ROS Related Stuff End /////////////
		
		////////////// LabIn Related Stuff Start /////////////
		
		
		public var LabInStaticDataList:ArrayCollection;
		public var inHouseLabList:ArrayCollection;
		
		////////////// LabIn Related Stuff End /////////////
		
		
		////////////// LabOut Related Stuff Start /////////////
		private var _labTestTypeDTOList:ArrayCollection;
		
		public var labTypeDTOList :ArrayCollection;
		
		public var labTestOrderMethodTypeDTOList :ArrayCollection;
		public var labPriorityTypeDTOList :ArrayCollection;
		
		public var lionicLabTestTypeDTOList :ArrayCollection;
		
		public var laboutDTOList :ArrayCollection;
		
		
		
		public function get labTestTypeDTOList():ArrayCollection
		{
			return _labTestTypeDTOList;
		}
		
		public function set labTestTypeDTOList(value:ArrayCollection):void
		{
			_labTestTypeDTOList = value;
		}
		
		
		public var labTestSpecimenTypeDTOList:ArrayCollection;
		
		////////////// LabOut Related Stuff End /////////////
		
		
		////////////// Follow up stuff start /////////////
		
		public var followUpDataControlType				:ArrayCollection;
		public var followUpinstructionAgeTypeDTOList	:ArrayCollection;	
		public var followUpMethodTypeList				:ArrayCollection; 
		public var followUpDurationTypeList				:ArrayCollection; 
		public var followUpServiceTypeList				:ArrayCollection; 
		public var followUpServiceDateList				:ArrayCollection;
		public var instructionAgeValueTypeDTOList		:ArrayCollection;	 // static data
		public var PatientMedicationDTOlist				:ArrayCollection = new ArrayCollection();	 // static data
		
		public var PatientFollowupMerged		:ArrayCollection;	 // static data
		
		
		
		
		
		////////////// Follow up stuff End /////////////
		
		////////////// Recommendation stuff start /////////////
		
		public var recommendationDurationTypeDTOList				:ArrayCollection; 
		public var recommendationPlanTypeDTOList					:ArrayCollection; 
		public var recommendationMethodTypeDTOList					:ArrayCollection; 
		public var recommendationLinkAutoCompleteDTOList			:ArrayCollection; 
		public var linksList										:ArrayCollection; 
		public var RecommendationDTOList							:ArrayCollection; 
		
		////////////// Recommendation stuff End /////////////
		
		////////////// Procedure stuff start /////////////
		[Bindable]	
		public var ProcedureDTOList						:ArrayCollection; 
		public var CptMedicalTypeDTOList				:ArrayCollection; 
		
		////////////// Procedure stuff End /////////////
		
		
		////////////// Allergies stuff start /////////////
		
		public var QIAllergyDTOList				:ArrayCollection = new ArrayCollection(); 
		public var AllergyList				    :ArrayCollection; // for dropdown search
		public var ThirdSectionLabel			:String; // for dropdown search
		public var quickInputDataLoadedFlag	:Boolean = false;
		////////////// Allergies stuff End /////////////
		
		
		////////////// Diagnosis stuff start /////////////
		
		public var icdCodeDTOList:ArrayCollection; 
		public var patientDiagnosisDTOListByPatientId:ArrayCollection; 
		public var Diagnosis:ArrayCollection; 
		public var patientDiagnosisDTOAllChronicListByPatientId:ArrayCollection; 
		//public var DiagnosisAssociatedVisit							:AssociatedVisit;
		public var AllergyNKDAFlag									:Boolean;
		
		////////////// Diagnosis stuff End /////////////
		
		
		////////////// Immunization Stuff Start /////////////
		
		public var immunizationDTOList:ArrayCollection;
		
		//static data list -- autocomplete
		//public var immunizationTypeDTOList:ArrayCollection;
		public var GeneralTypeDTOListForImmunizationType:ArrayCollection;
		public var GeneralLabelDTOListForDose:ArrayCollection;
		public var GeneralLabelDTOListForManufacturer:ArrayCollection;
		public var GeneralLabelDTOListForRefusal:ArrayCollection;
		public var GeneralLabelDTOListForRoute:ArrayCollection;
		public var GeneralLabelDTOListForSeries:ArrayCollection;
		public var GeneralLabelDTOListForSite:ArrayCollection;
		public var GeneralLabelDTOListForLot:ArrayCollection;
		
		
		private var _ImmunizationsReviewHistory				:ArrayCollection; // for review history
		
		
		public function get ImmunizationsReviewHistory():ArrayCollection
		{
			return _ImmunizationsReviewHistory;
		}
		
		public function set ImmunizationsReviewHistory(value:ArrayCollection):void
		{
			_ImmunizationsReviewHistory = value;
		}
		
		////////////// Immunization Stuff End /////////////
		
		
		
		
		//////////// Vitals Related stuff start/////////////////
		
		public var patientPreviousVitalsList:ArrayCollection;
		
		public var VitalDTO:VitalsDTO;
		
		////////// Vitals Related stuff end
		
		//////////// Prescription Related stuff start/////////////////
		
		
		public var patientMedACList 					:ArrayCollection;
		public var patientChronicMedACList				:ArrayCollection; 
		public var patientMedAC_inactiveList			:ArrayCollection;
		public var patientChronicMedAC_inactiveList		:ArrayCollection;
		public var medicationDTOList					:ArrayCollection = new ArrayCollection();	
		public var prescriptionDToList 					:ArrayCollection;	
		
		////////// Prescription Related stuff end
		
		
		
		
	}
}