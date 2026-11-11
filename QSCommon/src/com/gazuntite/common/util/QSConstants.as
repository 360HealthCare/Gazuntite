package com.gazuntite.common.util
{
	public final class QSConstants
	{
		public static const STRING_NULL						:String = "NULL";
		public static const STRING_TRUE						:String = "true";
		public static const STRING_FALSE					:String = "false";
		public static const STRING_YES						:String = "YES";
		public static const STRING_NO						:String = "NO";
		public static const EMPTY_STRING						:String = "";
		
		public static const SESSION_STATUS_BUSY				:int = 4;
		public static const SESSION_STATUS_ONLINE			:int = 1;
		public static const SESSION_STATUS_AWAY				:int = 3;
		
		

		public static const GUID_FORMAT 						:String	= "00000000-0000-0000-0000-000000000000";
		
		public static const ALLERGY_CALL_TYPE_LOAD_ALL						:int = 1;
		public static const ALLERGY_CALL_TYPE_LOAD_PATIENT					:int = 2;
		public static const ALLERGY_CALL_TYPE_ADD							:int = 3;
		public static const ALLERGY_CALL_TYPE_DELETE						:int = 4;
		
		
		
		public static const ERROR							:String = "Error occured on server";
		public static const NULL_DATE	 					:Date	= new Date(1901, 0, 1, 12, 0, 0);
		
		
		public static var RESTFULL_SERVICE_BASE_URL 								:String ;// = "http://www.quivus.com/QuivusAirDev/QuivusMainManagerService/QuivusManagerRestfullService/QuivusManagerRestfullService.svc/";
		public static var RESTFULL_SERVICE_BASE_MAIN_URL 							:String ;//  = "http://www.quivus.com/QuivusAirDev/QuivusMainManagerService/QuivusManagerRestfullService/QuivusManagerRestfullService.svc/";
		public static var RESTFULL_SERVICE_BASE_URL_FOR_LOAD_MEDICATIONS			:String ;//  = "http://beta.quivus.com/Eprescriptionstagging/Service/EPrescriptionService.svc/";
		public static var EPRESCRIPTION_USER_SERVICE 								:String ;//  = "http://www.quivus.com/quivusairdev/UserService/Service/RestfulService/UserManagerRestfulService.svc/"; 
		public static var USER_MANAGER_RESTFULL_SERVICE_BASE_URL 					:String ;//  = "http://www.quivus.com/quivusairdev/UserService/Service/RestfulService/UserManagerRestfulService.svc/"; 
		public static var BILLING_RESTFULL_SERVICE_BASE_URL 						:String ;//  = "http://quivus.com/QuivusAirDev/QBillingService/BillingService.svc/";
		public static var RESTFULL_SERVICE_BASE_URL_dev 							:String ;//  = "http://quivus.com/QuivusAirDev/Communcation/CommunicationService.svc/";
		public static var QI_PATIENT_ALLERGY_RESTFUL_SERVICE						:String ;//  = "http://beta.quivus.com/Eprescriptionstagging/Service/EPrescriptionService.svc/";
		public static var EPRESCRIPTION_RESTFULL_SERVICE_BASE_URL					:String ;//  = "http://beta.quivus.com/Eprescriptionstagging/Service/EPrescriptionService.svc/";
		
		
		
		public static const ALLERGY_RESTFUL_SERVICE_METHOD_GetAllergies				:String = "GetAllergies";
		public static const ALLERGY_RESTFUL_SERVICE_METHOD_GetPatientAllergies		:String = "GetPatientAllergies";
		public static const ALLERGY_RESTFUL_SERVICE_METHOD_AddAllergies				:String = "AddAllergies";
		public static const ALLERGY_RESTFUL_SERVICE_METHOD_DeletePatientAllergies	:String = "DeletePatientAllergies";
		public static var RESTFULL_PROVIDER_SERVICE_BASE_URL:String;
		public static var EPRESCRIPTION_QM_SERVICE:String;
		
		public static var RESTFULL_ADRESSBOOK_SERVICE_BASE_URL 	: String;
		
		public static const VISIT_STATUS_SIGNED		 							:String = "Signed";
		public static const VISIT_STATUS_UN_SIGNED		 						:String = "UnSigned";
	}
}
