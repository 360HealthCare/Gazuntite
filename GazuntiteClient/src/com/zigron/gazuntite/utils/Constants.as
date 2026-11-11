package com.zigron.gazuntite.utils
{
	[Bindable]
	public class Constants
	{
		public static var DICTATION_FOLDER_NAME 			  :String;
		public static var DICTATION_SERVER_URL 			  	  :String;
		public static var DICTATION_SERVICE_METHOD	  	  	  :String;
		
		public static var RESTFUL_SERVICE_BASE_URL	  	  	  :String;
		
		public static var SECURITY_SERVICE_BASE_URL	  	  	  :String;
		public static var QUIVUS_SECURITY_SERVICE_BASE_URL 	  :String;
		public static var PATIENT_SEARCH_RESTFULSERVICE  	  :String;
	
		public static var RESTFULL_SERVICE_BASE_URL 		 	     :String; // = "http://www.quivus.com/QuivusAirDev/QuivusMainManagerService/QuivusManagerRestfullService/QuivusManagerRestfullService.svc/";
		
		public static var RESTFULL_USER_MANAGER_SERVICE_BASE_URL 	 :String; //= "http://www.quivus.com/QuivusAirDev/UserService/Service/RestfulService/UserManagerRestfulService.svc/";
		
		
		
		public static var RESTFULL_PROVIDER_SERVICE_BASE_URL:String;
		//TA -for loading ZIp city and State
		public static var RESTFULL_ADRESSBOOK_SERVICE_BASE_URL:String;
		
		public static var BILLING_REPORT_BASE_URL			:String;
		
		
		public static const EMPTY_STRING			 			:String = "";
		
		public static const STRING_NULL							:String = "NULL";
		public static const STRING_TRUE							:String = "true";
		public static const STRING_FALSE						:String = "false";
		
		public static const STRING_YES_UI						:String = "Yes";
		public static const STRING_NO_UI						:String = "No";
		public static const STRING_NONE_UI						:String = "None";
		
		public static const ALLERGIES_MODULE_ID							:String = "";
		public static const COMPREHENSIVEHISTORY_MODULE_ID				:String = "";
		public static const CHRONICMEDICATION_MODULE_ID					:String = "";
		public static const IMMUNIZATION_MODULE_ID						:String = "";
		public static const VITALS_MODULE_ID						    :String = "";
		public static const CHIEFCOMPLAINT_MODULE_ID					:String = "";
		public static const ROS_MODULE_ID								:String = "";
		public static const PHYSICAL_MODULE_ID							:String = "";
		public static const INHOUSE_MODULE_ID							:String = "";
		public static const DIAGNOSIS_MODULE_ID							:String = "";
		public static const PLAN_MODULE_ID								:String = "";
		public static const TREATMENT_MODULE_ID							:String = "";
			
		public static const GUID_FORMAT 						:String	= "00000000-0000-0000-0000-000000000000";
		public static const NULL_DATE	 						:Date	= new Date(1901, 00, 01, 17, 0, 0);
		//------------------- PRACTICE MANAGER SECTION --------------------------------------------
		public static const SCHEDULAR_SECTION							:String = "SCHEDULAR";
		public static const EPRESCRIPTION_SECTION						:String = "E-PRESCRIPTION";
		public static const ELAB_SECTION								:String = "E-LAB";
		public static const DMG_SECTION									:String = "DOCUMENT MANAGEMENT";
		public static const UN_SIGNED_ENCOUNTERS_SECTION				:String = "UN-SIGNED ENCOUNTERS";
		public static const BILLING_SECTION								:String = "BILLING";
		public static const DISEASE_MANAGEMENT							:String = "DISEASE MANAGEMENT";
		public static const QUICK_INPUT_MODULE_NAME						:String = "QuickInput";		
		
		[Embed(source="/assets/images/checkmark_green.png")]	
		public static var IMG_GREEN:Class;
		
		[Embed(source="/assets/images/dot_red.png")]
		public static var IMG_RED:Class;
		
		[Embed(source="/assets/images/Provider.png")]
		public static var BLANK_PROFILE_IMAGE:Class;
	}
}