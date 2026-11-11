package com.gazuntite.patient.visit.utils
{
	[Bindable]
	public class Constants
	{
		public static const PAGE_SIZE							:int 	= 200;
		public static const NOTE_PAD_PATH						:String = "C:\\Windows\\System32\\notepad.exe";
		public static const FTP_UTIL							:String = "C:\\QSPakage\\ftputil.exe";
		
		public static const MSG_QI_CRASH_HEADER					:String = "Quivus Online Clinic has recovered patient data";//"Quivus Online Clinic encountered a problem of system failure";
		public static const MSG_QI_BODY							:String = "The Unsaved data of patient you were working on is recovered successfully,\n do you want to load the recovered information?";
		public static const MSG_SAME_PATIENT					:String = "Same Patient Selected ...";
		public static const MSG_ALREADY_LOADED_PATIENT			:String = "Patient is already loaded. If you want to reload, close patient by clicking on the close patient button.";
		public static const MSG_CLOSE_PATIENT					:String = "Close Patient Alert";
		public static const MSG_SURE_CLOSE_PATIENT				:String = "Are you sure you want to close patient?";
		public static const MSG_SURE_CLOSE_WITHOUT_SAVE			:String = "You might have any unsaved data.\n Do you want to Close it";
		public static const MSG_SAVE_ALERT						:String = "Save Alert";
		
		public static const REGISTERATION_STATIC_DATA_DB_NAME	:String = "dbRegisterationStaticData.db";
		public static const QUICKINPUT_STATIC_DATA_DB_NAME		:String = "dbQuickInputStaticData.db";
		public static const COMP_HISTORY_STATIC_DATA_DB_NAME	:String = "dbCompHistoryStaticData.db";
		public static const LOCAL_PATIENTS_LIST					:String = "dbLocalPatientsListData.db";
		public static const QI_SAVING_RESTFUL_SERVICE			:String = "http://www.quivus.com/QuivusAirDev/QuivusMainManagerService/QuivusManagerRestfullService/QuivusManagerRestfullService.svc/";

        //09/03/2012 by Shahid Munir
		public static const ERROR													:String = "Error occured on server";
		public static const QI_PATIENT_ALLERGY_RESTFUL_SERVICE						:String = "http://beta.quivus.com/Eprescriptionstagging/Service/EPrescriptionService.svc/";
		public static const ALLERGY_RESTFUL_SERVICE_METHOD_GetAllergies				:String = "GetAllergies";
		public static const ALLERGY_RESTFUL_SERVICE_METHOD_GetPatientAllergies		:String = "GetPatientAllergies";
		public static const ALLERGY_RESTFUL_SERVICE_METHOD_AddAllergies				:String = "AddAllergies";
		public static const ALLERGY_RESTFUL_SERVICE_METHOD_DeletePatientAllergies	:String = "DeletePatientAllergies";
		
		// App Font
		
		public static const APP_FONT_NORMAL				:String = "Calibri";
		public static const APP_FONT_BOLD				:String = "Calibri Bold";
		
		public static const SIGN_LABEL 					:String = "Sign";
		public static const COSIGN_LABEL				:String = "CoSign";
		
		//V filters
		public static const BY_VISIT 					:String = "By Visit";
		public static const BY_TYPE						:String = "By Type";
		public static const BY_Location					:String = "By Location";
		
		//M TODO
		public  static const loggedInUserTypeId			:int = 3;		
		
		
		public static var DICTATION_FOLDER_NAME 			  :String = "temp/Dictation";
		public static var DICTATION_SERVER_URL 			  	  :String = "http://quivus.com/QuivusAirDev/DictationService/QuivusDictationService.svc/" ;
		public static var DICTATION_SERVICE_METHOD	  	  	  :String;
		
		public static var RESTFUL_SERVICE_BASE_URL	  	  	  :String;
		
		public static var SECURITY_SERVICE_BASE_URL	  	  	  :String;
		public static var QUIVUS_SECURITY_SERVICE_BASE_URL 	  :String;
		public static var PATIENT_SEARCH_RESTFULSERVICE  	  :String;
		
		//################## IDs #############################
		public static const SELF_OWNER_TYPE_ID 					  :int = 1;
		public static const MOTHER_OWNER_TYPE_ID				  :int = 2;
		public static const FATHER_OWNER_TYPE_ID 				  :int = 3;
		
		public static const PATIENT_PARTY_TYPE_ID				  :int = 1;
		public static const GUARANTOR_PARTY_TYPE_ID				  :int = 10;
		
		public static const COUNTRY_USA_ID 						  :int = 233;
		
		public static const PRIMARY_INSURANCE_TYPE_ID 			  :int = 1;
		public static const SECONDARY_INSURANCE_TYPE_ID 		  :int = 2;
		
		public static const ACTIVE_STATUS_ID					  :int = 1;
		public static const DELETE_STATUS_ID 					  :int = 3;
		public static const IN_ACTIVE_STATUS_ID 				  :int = 2;
		
		//#########  MERITAL STATUS IDS FOR COMPREHENSIVE HISTORY SOCIAL SECTION ################
		public static const DIVORCED_MERITAL_STATUS_ID			  :int = 2;
		public static const MARRIED_MERITAL_STATUS_ID 			  :int = 6;
		public static const WIDOWED_MERITAL_STATUS_ID 			  :int = 9;
		public static const SINGLE_MERITAL_STATUS_ID 			  :int = 7;
		//#########  ########################################################## ################
		public static const PATIENT_USER_TYPE_ID 				  :int = 1;
		
		
		public static const PATIENT_PROFILE_CUSTOMIZATION_THIRD_SECTION_ID 				  :int = 3;
		
		
		//#########  IMPORT VISIT TEMPLATE SECTION ################
		public static const VISIT_TEMPLATE_TYPE_ACCUTE_VISIT				:int = 1;
		public static const VISIT_TEMPLATE_TYPE_CHRONICDISEASE_VISIT		:int = 2;
		public static const VISIT_TEMPLATE_TYPE_COMPREHENSIVE_VISIT 		:int = 3;
		//#########  ########################################################## ################
		
		
		public static const REGISTRATION_PURPOSE 				:String = "Registration";
		public static const UPDATE_PURPOSE		 				:String = "Updation";
		public static const SIGNED_STATUS		 				:String = "Signed";
		public static const UN_SIGNED_STATUS		 			:String = "UnSigned";
		
		public static const VISIT_SIGNE			 				:String = "visitSigned";
		public static const VISIT_COSIGNED		 				:String = "visitCoSigned";
		public static const INVALID_CREDENTIALS		 			:String = "invalidCredentials";
		
		public static const MALE 								:String = "Male";
		public static const FEMALE		 						:String = "Female";
		public static const UNDIFFERENTIATED		 			:String = "Undifferentiated";
		
		
		public static const GENERAL_TEMPLATE_NAME	 			:String = "SOAP Note";
		
		public static const EMPTY_STRING			 			:String = "";
		
		/**
		 * Do not change values of constants in any case especially for true and false
		 * */
		public static const STRING_NULL							:String = "NULL";
		public static const STRING_TRUE							:String = "true";
		public static const STRING_FALSE						:String = "false";
		
		public static const STRING_YES_UI							:String = "Yes";
		public static const STRING_NO_UI							:String = "No";
		public static const STRING_NONE_UI							:String = "None";
		
		public static const UNKNOWN								:String = "Unknown";
		public static const MARRIED								:String = "Married";
		public static const SINGLE								:String = "Single";
		public static const DIVORCED							:String = "Divorced";
		public static const WIDOW								:String = "Widow";
		
		public static const SESSION_INVALID_CODE				:int	= 15;

		//Mansoor
		//**************************** QUICK INPUT TABS NAME ****************************
		public static const PMH_TAB_NAME:String = 				"PMH";
		public static const PHYSICAL_TAB_NAME:String = 			"PHYSICAL";
		public static const ASSESSMENT_TAB_NAME:String = 		"ASSESSMENT";			
		public static const ALL_TAB_NAME:String = 				"ALL";
		//**************************** End Section names ******************************************************
		
		
		//################ Main Category Names ... #################
		public static const MAIN_CATEGORY_BASIC_INFO_NAME 				:String = "BasicInformation";
		public static const MAIN_CATEGORY_OTHER_INFO_NAME 				:String = "OtherInformation";
		public static const MAIN_CATEGORY_EMERGENCY_C_INFO_NAME 		:String = "EmergencyContact";
		public static const MAIN_CATEGORY_GUARANTOR_INFO_NAME 			:String = "GuarantorInformation";		
		public static const MAIN_CATEGORY_HEALTH_INFO_NAME 				:String = "HealthInformation";
		
		//################ HealthInformation Category Names ... #################
		public static const ALLERGIES_CATEGORY_NAME 					:String = "Allergies";
		public static const DIAGNOSIS_CATEGORY_NAME 					:String = "Diagnosis";
		public static const IMMUNIZATION_CATEGORY_NAME 					:String = "Immunization";
		public static const CHRONIC_MEDICATION_CATEGORY_NAME 			:String = "ChronicMedication";		
		public static const INSURANCE_CATEGORY_NAME 					:String = "Insurance";
		
		public static const ALLERGIES_CATEGORY_ID 					:int = 31;
		public static const DIAGNOSIS_CATEGORY_ID					:int = 32;
		public static const IMMUNIZATION_CATEGORY_ID 				:int = 33;
		public static const CHRONIC_MEDICATION_CATEGORY_ID 			:int = 35;		
		public static const INSURANCE_CATEGORY_ID 					:int = 36;
		
		
		//################ Lab Nature Type ########################################
		public static const CLINICAL_LAB_NATURE_NAME 					:String = "Clinical";		
		public static const RADIOLOGY_LAB_NATURE_NAME 					:String = "Radiology";
		
		
		//################ Followup Method Type ########################################
		public static const OFFICE_FOLLOWUP_METHOD_NAME 				:String = "Office";		
		public static const PHONE_FOLLOWUP_METHOD_NAME 					:String = "Phone";
		public static const EMAIL_FOLLOWUP_METHOD_NAME 					:String = "Email";
		public static const CHAT_FOLLOWUP_METHOD_NAME 					:String = "Chat";
		public static const VIDEO_FOLLOWUP_METHOD_NAME 					:String = "Video";
		
		
		public static const PROFILE_IMAGE_TYPE_NAME 					:String = "Profile";
		public static const INSURANCE_IMAGE_TYPE_NAME 					:String = "Insurance";
		
		
		public static const ADD_MORE							:String	= "+ADD MORE";
		public static const COMING_SOON							:String = "This feature is coming soon";
		
		public static const PASSWORD_FOR_REGISTRATION			:String = "quivus123";
		
		public static const CONTACTS_SEARCH_MODE 				:String = "ContactSearch";
		public static const WEB_SEARCH_MODE 					:String	= "WebSearch";		
		
		public static const PATIENT_REGISTRATION 				:String = "Patient Registration";
		
		public static const GUARANTOR 							:String = "guarantor";
		public static const PERSONAL 							:String = "personal";
		
		public static const QUIVUS_MANAGER_SERVICE_WSDL			:String = "http://192.168.0.63:82/QuivusManagerService/QuivusManagerService/ManagerServices/QuivusManagerService.svc?wsdl ";
		public static const STREAMING_SERVICE_WSDL				:String = "http://192.168.0.63:82/StreamingService/Service/StreamingService.svc?wsdl";
		
		
		public static const GUID_FORMAT 						:String	= "00000000-0000-0000-0000-000000000000";
		public static const NULL_DATE	 						:Date	= new Date(1901, 00, 01, 17, 0, 0);
																			  
		public static const FOLLOW_UP_SERVICE_CONTROL_NAME		:String = "FollowupService";
		
		
		
		//**************************** REGISTRATION ************************************************
		public static const ALL_REGISTERATION_STATIC_DATA_ALL:String = 						"All";
		//### start loaded in first call
		public static const PREFIX_TYPE_REGISTERATION_STATIC_DATA:String = 					"PrefixType";
		public static const GENDER_TYPE_REGISTERATION_STATIC_DATA:String = 					"GenderType";
		public static const MARITAL_STATUS_TYPE_REGISTERATION_STATIC_DATA:String = 			"MaritalStatusType";
		public static const LANGUAGE_ABILITY_MODE_TYPE_REGISTERATION_STATIC_DATA:String = 	"LanguageAbilityModeType";
		public static const INSURANCE_NATURE_TYPE_REGISTERATION_STATIC_DATA:String = 		"InsuranceNature";
		public static const INSURANCE_ORGANIZATION_TYPE_REGISTERATION_STATIC_DATA:String = 	"InsuranceOrganization";
		public static const SMOKING_TYPE_REGISTERATION_STATIC_DATA:String = 				"SmokingType";
		public static const INSURANCE_TYPE_REGISTERATION_STATIC_DATA:String = 			    "InsuranceType";
		public static const STATUS_TYPE_REGISTERATION_STATIC_DATA:String = 					"StatusType";
		public static const USER_TYPE_REGISTERATION_STATIC_DATA:String = 					"UserType";
		//### end loaded in first call		
		//### start loaded in 2nd call
		public static const ETHINICITY_TYPE_REGISTERATION_STATIC_DATA:String = 				"EthinicityType";
		public static const RELATIONSHIP_TYPE_REGISTERATION_STATIC_DATA:String = 			"RelationShipType";
		public static const BLOOD_RELATIONSHIP_TYPE_REGISTERATION_STATIC_DATA:String = 		"BloodRelationShipType";
		//### end loaded in 2nd call		
		//3rd
		public static const RACE_TYPE_REGISTERATION_STATIC_DATA:String = 					"RaceType";				
		//4th
		public static const OCCUPATION_TYPE_REGISTERATION_STATIC_DATA:String = 				"OccupationType";		
		//5th
		public static const LANGUAGE_TYPE_REGISTERATION_STATIC_DATA:String = 				"LanguageType";
		//*************************************************************************************************************
		
		
		//**************************** SECTION NAMES ******************************************************
		public static const ALLERGY_MODULE_NAME:String = 									"Allergy";
		public static const CHIEF_COMPLAINT_MODULE_NAME:String = 							"ChiefComplaint";
		public static const CHRONIC_DIAGNOSIS_MODULE_NAME:String = 							"ChronicDiagnosis";
		public static const CHRONIC_MEDICATION_MODULE_NAME:String = 						"ChronicMedication";
		public static const COMPREHENSIVE_HISTORY_MODULE_NAME:String = 						"ComprehensiveHistory";
		public static const DIAGNOSIS_MODULE_NAME:String = 									"Diagnosis";
		public static const FAMILY_HISTORY_MODULE_NAME:String = 							"FamilyHistory";
		public static const FOLLOWUP_MODULE_NAME:String = 									"FollowUp";
		public static const HISOTRY_OF_PRESENTILLNESS_MODULE_NAME:String = 					"HisotryOfPresentIllness";
		public static const IMMUNIZATION_MODULE_NAME:String = 								"Immunization";
		public static const LAB_IN_MODULE_NAME:String = 									"LabIn";
		public static const MEDICAL_HISTORY_MODULE_NAME:String = 							"MedicalHistory";
		public static const MEDICATION_PRESCRIBED_MODULE_NAME:String = 						"MedicationPrescribed";
		public static const NEXT_VISIT_MODULE_NAME:String = 								"NextVisit";
		public static const PATIENT_DIABETIC_EXAM_MODULE_NAME:String = 						"PatientDiabeticExam";
		public static const PATIENT_DIABETIC_HISTORY_MODULE_NAME:String = 					"PatientDiabeticHistory";
		public static const PATIENT_DIABETIC_PHYSICAL_MODULE_NAME:String = 					"PatientDiabeticPhysical";
		public static const PATIENT_DIABETIC_RISKLEVEL_MODULE_NAME:String = 				"PatientDiabeticRiskLevel";
		public static const PATIENT_PROFILE_MODULE_NAME:String = 							"PatientProfile";
		public static const PATIENT_VITAL_MODULE_NAME:String = 								"PatientVital";
		public static const PHYSICAL_MODULE_NAME:String = 									"Physical";
		public static const PLAN_MODULE_NAME:String = 										"Plan";
		public static const QUICK_INPUT_MODULE_NAME:String = 								"QuickInput";
		public static const REVIEW_OF_SYSTEM_MODULE_NAME:String = 							"ReviewOfSystem";
		public static const SOCIAL_HISTORY_MODULE_NAME:String = 							"SocialHistory";
		public static const VIEW_BACKGROUND_MODULE_NAME:String = 							"ViewBackground";
		public static const TREATMENT_MODULE_NAME:String = 									"Treatment";
		//**************************** End Section names ******************************************************
		
		
		//**************************** QUICK INPUT ************************************************
		public static const ALL_QUICKINPUT_STATIC_DATA_ALL:String = 						"All";
		//### start loaded in first call
		public static const LAB_TEST_NATURE_TYPE_QUICKINPUT_STATIC_DATA:String = 			"LabTestNatureType";
		public static const LAB_TEST_PRIORITY_TYPE_QUICKINPUT_STATIC_DATA:String = 			"LabTestPriorityType";
		public static const TEST_SPECIMEN_TYPE_QUICKINPUT_STATIC_DATA:String = 				"TestSpecimenType";
		public static const LAB_TEST_TYPE_QUICKINPUT_STATIC_DATA:String = 					"LabTestType";
		public static const LAB_TYPE_QUICKINPUT_STATIC_DATA:String = 						"LabType";
		public static const LAB_TEST_ORDERMETHOD_TYPE_QUICKINPUT_STATIC_DATA:String = 		"LabTestOrderMethodType";
		public static const INSTRUCTION_DURATION_TYPE_QUICKINPUT_STATIC_DATA:String = 		"InstructionDurationType";
		public static const INSTRUCTIONAGE_TYPE_QUICKINPUT_STATIC_DATA:String = 			"InstructionAgeType";
		public static const INSTRUCTIONAGE_VALUE_TYPE_QUICKINPUT_STATIC_DATA:String = 		"InstructionAgeValueType";
		public static const ENCOUNTER_TYPE_QUICKINPUT_STATIC_DATA:String = 					"EncounterType";
		public static const IMMUNIZATION_TYPE_QUICKINPUT_STATIC_DATA:String = 				"ImmunizationType";
		public static const HPI_TYPE_QUICKINPUT_STATIC_DATA:String = 						"HPIType";
		public static const PLAN_TYPE_QUICKINPUT_STATIC_DATA:String = 						"PlanType";
		public static const DURATION_TYPE_QUICKINPUT_STATIC_DATA:String = 					"DurationType";
		public static const METHOD_TYPE_QUICKINPUT_STATIC_DATA:String = 					"MethodType";
		public static const FOLLOWUP_METHOD_TYPE_QUICKINPUT_STATIC_DATA:String = 			"FollowUpMethodType";
		
		
		//*************************************************************************************************************
		

		//**************************** COMPREHENSIVE HISTORY GENERAL SECTION NAMES ****************************
		public static const MEDICAL_MODULE_NAME:String = 									"Medical";
		public static const CHILDHOOD_MODULE_NAME:String = 									"Childhood";
		public static const SURGICAL_MODULE_NAME:String = 									"Surgical";
		public static const OTHER_MODULE_NAME:String = 										"Other";	
		//**************************** End Section names ******************************************************
		
		//**************************** COMPREHENSIVE HISTORY FAMILY SECTION NAMES ****************************
		public static const FAMILY_CANCER_MODULE_NAME:String = 								"Cancer";//1 call
		public static const FAMILY_DIABETES_MODULE_NAME:String = 							"Diabetes";//2 call
		public static const FAMILY_HEARTDISEASE_MODULE_NAME:String = 						"Heart Disease";//for UI
		public static const FAMILY_HEART_DISEASE_MODULE_NAME:String = 						"HeartDisease";//3 call
		public static const FAMILY_HYPERTENSION_MODULE_NAME:String = 						"Hypertension";//4 call
		public static const FAMILY_OTHER_MODULE_NAME:String = 								"Other";		//5 call
		//**************************** End Section names ******************************************************
		
		//**************************** COMPREHENSIVE HISTORY SOCIAL SECTION NAMES ****************************
		public static const SOCIAL_TOBACCO_MODULE_NAME:String = 							"Tobacco";
		public static const SOCIAL_ALCOHOL_MODULE_NAME:String = 							"Alcohol";
		public static const SOCIAL_DRUGS_MODULE_NAME:String = 								"Drugs";
		public static const SOCIAL_WORK_STATUS_MODULE_NAME:String = 						"Work Status";
		public static const SOCIAL_MERITAL_STATUS_MODULE_NAME:String = 						"Marital";		
		public static const SOCIAL_OTHER_MODULE_NAME:String = 								"Other";		
		//**************************** End Section names ******************************************************
		
		
		//**************************** HPI 	SECTION NAMES *****************************************************
		public static const CONTEXT_MODULE_NAME:String = 									"Context";
		public static const DURATION_MODULE_NAME:String = 									"Duration";
		public static const EXACERBATING_MODULE_NAME:String = 								"Exacerbating";
		public static const LOCATION_MODULE_NAME:String = 									"Location";
		public static const MODIFYINGFACTORS_MODULE_NAME:String = 							"ModifyingFactors";		
		public static const PROGRESSION_MODULE_NAME:String = 								"Progression";	
		public static const QUALITY_MODULE_NAME:String = 									"Quality";	
		public static const RADIATION_MODULE_NAME:String = 									"Radiation";	
		public static const SEVERITY_MODULE_NAME:String = 									"Severity";	
		public static const SYMPTOM_MODULE_NAME:String = 									"Symptom";			
		//**************************** End Section names ******************************************************
		
		
		//**************************** VIEW BACKGROUNG 	SECTION HEADER NAMES *****************************************************
		public static const VB_SECTION_NAME_IMMUNIZATION :String = 							"Immunization";
		public static const VB_SECTION_NAME_VITALS :String = 								"PatientVital";
		public static const VB_SECTION_NAME_LABS :String = 									"Labs";
		public static const VB_SECTION_NAME_CC_HPI :String = 								"Chief Complaint/HPI";
		public static const VB_SECTION_NAME_PLAN :String = 									"Plan";		
		public static const VB_SECTION_NAME_TREATMENT :String = 							"Treatment";	
		public static const VB_SECTION_NAME_DIAGNOSIS :String = 							"Diagnosis";	
		public static const VB_SECTION_NAME_ROS :String = 									"Review of System";	
		public static const VB_SECTION_NAME_PHYSICAL :String = 								"Physical";
		public static const VB_SECTION_NAME_COMPREHENSIVE_HISTORY :String = 				"Comprehensive History";
		public static const VB_SECTION_NAME_PRESCRIPTION :String = 							"Prescription";	
					
		//**************************** End Section names ******************************************************
		
		
		//**************************** COMPREHENSIVE HISTORY	SECTION HEADER NAMES (for static DB) *****************************************************
		public static const CH_SECTION_GENERAL :String = 									"General";
		public static const CH_SECTION_FAMILY :String = 									"Family";
		public static const CH_SECTION_SOCIAL :String = 									"Social";
		
		//**************************** End Section names ******************************************************
		
		//**************************** VIDEO CHAT URL *****************************************************
		public static const VIDEO_CHAT_URL				:String =  "http://www.quivus.com/QuivusAirDev/VideoChatStaging/MainVideoPage.aspx";
		public static const VIDEO_CHAT_OUTGOING_URL				:String = "http://www.quivus.com/QuivusAirDev/VideoChatStaging/MainVideoPage.aspx";
		public static const VIDEO_CHAT_INCOMING_CALL_FILE_URL				:String = "http://www.quivus.com/QuivusAirDev/VideoChatStaging/IncomingCall_File/Incoming_Call.mp3"; 
		
		
		public static const VIDEO_CHAT_INCOMINGCALL_METHOD				:String = "GetVideoSession";
		public static const REJECT_VIDEO_CALL_NOTIFICATION_METHOD				:String = "RejectVideoSession";
		public static const ACCEPT_VIDEO_CALL_NOTIFICATION_METHOD				:String = "AcceptIncomingCallNotification"; 
		
		//**************************** End Section names ******************************************************
		
		public static var BILLING_REPORT_BASE_URL			:String;
		
		//For Billing sataging
		//public static const BILLING_REPORT_BASE_URL:String    = "http://www.quivus.com/ReportingPortal/ReportViewer.aspx";
		//public static const BILLING_REPORT_BASE_URL:String    = "http://localhost:64475/ReportPanel.aspx";
		
		//For Billing beta
		//public static const BILLING_REPORT_BASE_URL:String    = "http://beta.quivus.com/QuivusAirProduction/ReportingPortal/ReportViewer.aspx";
															
		
		//Tahir Alvi - For loading patients on location ID base
		public static const LOAD_PATIENTS_BY_PRACTICE_ID:String    		= "LoadPatientsByPracticeId";
		public static const LOAD_CURRENT_DAY_ADDED_PATIETNS:String    	= "LoadCurrentDayAddedPatients";
		public static var RESTFULL_PROVIDER_SERVICE_BASE_URL:String;
		
	}
}