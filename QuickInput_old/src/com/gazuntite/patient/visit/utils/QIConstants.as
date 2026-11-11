package com.gazuntite.patient.visit.utils
{
	import mx.core.INavigatorContent;

	[Bindable]
	public class QIConstants
	{
		public static var EPRESCRIPTION_RESTFULSERVICE							:String;
		public static var RESTFULL_SERVICE_BASE_URL								:String;
		public static var BILLING_RESTFUL_SERVICE								:String;
		
		public static const FTP_SERVICE_URL										:String = "ftp.quivus.com";
		
		public static const FTP_SERVICE_USERNAME								:String = "fs23013";
		public static const FTP_SERVICE_PASSWORD								:String = "zigron83199";
		
		public static const FTP_SERVICE_ROOT_FOLDER_NAME						:String = "Quivus";
		
		public static const ERROR												:String = "Error occured on server";
		
		public static const PAGE_SIZE											:int = 200;
		public static const FIRST_PAGE_NUMBER									:int = 1;	
		
		
		
		
		public static const VISIT_STATUS_SIGNED		 							:String = "Signed";
		public static const VISIT_STATUS_UN_SIGNED		 						:String = "UnSigned";
		
		
		
		public static const STRING_NULL											:String = "NULL";
		public static const STRING_TRUE											:String = "true";
		public static const STRING_FALSE										:String = "false";
		
		public static const STRING_YES_UI										:String = "Yes";
		public static const STRING_NO_UI										:String = "No";
		public static const STRING_NONE_UI										:String = "None";
		
		public static const UNKNOWN												:String = "Unknown";
		public static const MARRIED												:String = "Married";
		public static const SINGLE												:String = "Single";
		public static const DIVORCED											:String = "Divorced";
		public static const WIDOW												:String = "Widow";
		
		
		public static const IsTemplateVisit						:Boolean= false; //temprory member , by moeen  ... need to know from where this will be pass to service
		
		public static const EMPTY_STRING						:String = "";
		public static const GUID_FORMAT 						:String	= "00000000-0000-0000-0000-000000000000";
		public static const NULL_DATE	 						:Date	= new Date(1901, 00, 01, 17, 0, 0);
		
		
		public static const REVIEW_ALL:String = "reviewAll";
		public static const SIGN_COSIGN:String = "signCoSign";
		public static const SAVE_AND_REVIEW:String = "saveAndReview";
		
		public static const SET_VISIT_PROVIDER					:String = "Set Provider Visit";
		
		
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
		
		//#########  MERITAL STATUS IDS FOR COMPREHENSIVE HISTORY SOCIAL SECTION ################
		public static const DIVORCED_MERITAL_STATUS_ID			  :int = 2;
		public static const MARRIED_MERITAL_STATUS_ID 			  :int = 6;
		public static const WIDOWED_MERITAL_STATUS_ID 			  :int = 9;
		public static const SINGLE_MERITAL_STATUS_ID 			  :int = 7;
		//#########  ########################################################## ################
		
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
		
		//**************************** Folloup Section names ******************************************************
		public static const FOLLOWUP_DATE:String = 									"FollowupDate";	
		public static const FOLLOWUP_SERVICE:String = 								"FollowupService";	
		
		/**Ayesha: 13/02/2013
		 * to load follow up dictionaries for date and service
		 * service url requires ID=1 and and date url requires ID=2 
		 * */
		public static const FOLLOWUP_SERVICE_ID:int = 1;
		public static const FOLLOWUP_DATE_ID:int = 2;
		//**************************** End Followup Section names ******************************************************
		
		//**************************** Immunization Section names ******************************************************
		public static const DOSE_SELECT_TYPE:String 				= "dose";
		public static const MANUFACTURER_SELECT_TYPE:String 		= "manufacture";
		public static const REFUSAL_SELECT_TYPE:String 				= "refusal";
		public static const ROUT_SELECT_TYPE:String 				= "rout";
		public static const SERIERS_SELECT_TYPE:String 				= "seriers";
		public static const SITE_SELECT_TYPE:String 				= "site";
		public static const TYPE_SELECT_TYPE:String 				= "type";
		public static const LOT_SELECT_TYPE:String 					= "lot";
		
		//**************************** End Immunization Section names ******************************************************
		
		
	}
}