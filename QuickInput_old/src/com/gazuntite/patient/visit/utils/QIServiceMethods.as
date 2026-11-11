package com.gazuntite.patient.visit.utils
{
	public class QIServiceMethods
	{
		public static const CREATE_NEW_VISIT 		 					:String = "CreateNewVisit";
		
		public static const LOAD_COMHENSIVE_HISTORY_STATIC_DATA			:String = "LoadComhensiveHistoryStaticData";
		public static const LOAD_IMMUNICATION_STATIC_DATA				:String = "LoadImmunicationStaticData";
		public static const LOAD_IMMUNICATION_BY_VISIT_ID				:String = "LoadImmunizationsByVisitId";

		public static const MANAGE_PATIENT_ROS							:String = "ManagePatientRos";
		public static const MANAGE_PATIENT_PHYSICAL						:String = "ManagePatientPhysical";
		public static const MANAGE_PATIENT_HPI_CC						:String = "ManagePatientHPI";
		public static const MANAGE_PATIENT_LAB_IN						:String = "ManagePatientInHouseLabs";
		public static const MANAGE_PATIENT_DIAGNOSIS					:String = "ManagePatientDiagnosis";
		public static const MANAGE_MODULE_NOTES							:String = "ManageModuleNotes";
		public static const MANAGE_MODULE_DICTATION						:String = "ManageModuleDictation";
		
		
		public static const LABIN_LOAD_SEARCH_BY_ID						:String = "LoadInHouseLabTestTypeByClinicBranchIdNew";
		public static const HPI_LOAD_DETAIL_TYPES						:String = "LoadHPIDetailTypes";	
		public static const HPI_LOAD_STATIC_DATA						:String = "LoadHPIDetailAutoCompleteByTypeIdAndClinicId";	
		public static const Load_ROS_Category_Types						:String = "LoadPatientROSByVisit";//"LoadROSCategoryTypes";	//
		public static const Load_PHYSICAL_Category_Types				:String = "LoadPatientPhysicalsByVisit"	;//"LoadPhysicalCategoryTypes";
		public static const LOAD_CPT_MEDICAL_TYPES						:String = "LoadCPTMedicalTypes";	
		public static const LOAD_LABOUT_TEST_TYPE 						:String = "LoadLabTestTypes";
		public static const LOAD_LABOUT_LAB_TYPE 						:String = "LoadLabTypes";
		public static const LOAD_LABOUT_SPECIMEN_TYPE 					:String = "LoadLabTestSpecimenTypes";
		public static const LOAD_LABOUT_PRIORITY						:String = "LoadLabTestPriorityTypes";
		public static const LOAD_LABOUT_LAB_TEST_ORDER_METHOD_TYPE 		:String = "LoadLabTestOrderMethodTypes";
		public static const LOAD_LIONIOC_LAB_TEST_TYPE 					:String = "LoadLIONICLabTestType";
		public static const LOAD_FOLLOWUP_DATA_CONTROL_TYPE 			:String = "LoadFollowupDataControlType";
		public static const GET_PATIENT_ALL_MEDS 						:String = "GetPatientAllMed";
		public static const LOAD_FOLLOWUP_METHOD_TYPE 					:String = "LoadFollowUpMethodTypes";
		public static const LOAD_FOLLOWUP_INSTRUCTION_AGE_TYPE 			:String = "LoadFollowUpInstructionAgeTypes";
		public static const LOAD_FOLLOWUP_INSTRUCTION_AGE_VAlUE_TYPE 	:String = "LoadFollowUpInstructionAgeValueTypes";
		public static const LOAD_FOLLOWUP_DURATION_TYPE 				:String = "LoadFollowUpInstructionDurationTypes";
		public static const LOAD_FOLLOWUP_SERVICE_TYPE 					:String = "LoadPatientFollowupAutoCompleteByTypeIdAndClinicId";
		
		public static const LOAD_ALL_RECOMMENDATION_METHOD_TYPES 		:String = "LoadAllRecommendationMethodTypes";
		public static const LOAD_ALL_RECOMMENDATION_PLAN_TYPES			:String = "LoadAllRecommendationPlanTypes";
		public static const LOAD_RECOMMENDATION_LINK_AUTO_COMPLETE 		:String = "LoadRecommendationLinksAutoCompleteByClinicId";
		public static const LOAD_RECOMMENDATION_BY_VISIT_ID 			:String = "LoadPatientRecommendationByVisit";
		public static const LOAD_FOLLOW_UP_MERGED_BY_VISIT_ID 			:String = "LoadFollowUpMergeByVisitId";
		public static const LOAD_ALL_DURATION_TYPES 					:String = "LoadAllRecommendationDurationTypes";
		
		public static const LOAD_DIAGNOSIS_ICD_CODE 					:String = "LoadICDCodeByName";
		
		public static const LOAD_PATIENT_BY_VISIT_ID 					:String = "LoadPatientVitalByVisit";
		public static const LOAD_PATIENT_PREVIOS_VITALS 				:String = "LoadPatientPreviousVitals";
		public static const MANAGE_PATIENT_VITALS 						:String = "ManagePatientVital";
		
		public static const LOAD_MEDICAL_HISTORY_BY_PATIENT_ID 			:String = "LoadMedicalHistoryByPatientId";
		public static const LOAD_FAMILY_HISTORY_BY_PATIENT_ID 			:String = "LoadFamilyHistoryByPatientId";
		public static const LOAD_DISEASE_TYPE_EVENT 					:String = "LoadDiseaseTypes";
		public static const LOAD_SOCIAL_HISTORY_BY_PATIENT_ID 			:String = "LoadSocialHistoryByPatientId";
		
		public static const LOAD_PATIENT_HPI_BY_VISIT_ID 				:String = "LoadPatientHPIByVisitId";
		public static const LOAD_LABIN_BY_VISIT_ID 						:String = "LoadPateintInHouseLabsByVisitId";
		public static const LOAD_DIAGNOSIS_BY_VISIT_ID 					:String = "LoadPatientDiagnosisByVisitId";
		public static const LOAD_PATIENT_CHRONIC_DIAGNOSIS_BY_PATIENT_ID:String = "LoadPatientChronicDiagnosisByPatientId_new";
		public static const LOAD_PROCEDURE_BY_VISIT_ID 					:String = "LoadProcedureDTOListByVisitId";
		public static const LOAD_PATIENT_LABS_BY_VISIT_ID 				:String = "LoadPatientLabsByVisit";
		public static const MANAGE_PATIENT_PROCEDURE 					:String = "ManagePatientProcedure";
		public static const MARK_VALID_DATA 							:String = "MarkValidDataExists";
		public static const MANAGE_PATIENT_RECOMENDATION				:String = "ManagePatientRecommendation";
		public static const MANAGE_PATIENT_LABOUT 						:String = "ManagePatientLabs";
		public static const MANAGE_PATIENT_FOLLOWUP						:String = "ManagePatientFollowupMerged";
		
		public static const MANAGE_MEDICAL_HISTORY 						:String = "ManageMedicalHistory";
		public static const MANAGE_FAMILY_HISTORY						:String = "ManageFamilyHistory";
		public static const MANAGE_SOCIAL_HISTORY 						:String = "ManageSocialHistory";
		public static const MANAGE_SOCIAL_HISTORY_DELETE				:String = "DeleteSocialHistoryAddiction_new";		
		
		public static const GENERATE_SOAP_NOTE_BY_VISIT_ID 				:String = "GenerateSoapNoteByVisitID";
		public static const VERIFY_USER 								:String = "VerifyUser";
		public static const SIGN_VISIT 									:String = "SignVisit";
		public static const CO_SIGN_VISIT 								:String = "CoSignVisit";
		public static const LOAD_ENCOUNTER_TYPES 						:String = "LoadEncounterTypes";
		public static const LOAD_MODULE_NOTES							:String = "LoadModuleNotesByVisitId";
		public static const LOAD_MODULE_Dictation						:String = "LoadModuleDictationByVisitId";

		
		
	}
}