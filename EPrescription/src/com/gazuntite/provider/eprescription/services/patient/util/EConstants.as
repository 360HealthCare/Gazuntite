package com.gazuntite.provider.eprescription.services.patient.util
{
	public class EConstants
	{
		public static var RESTFULL_SERVICE_BASE_URL				:String;						
		public static var RESTFULL_USER_SERVICE_BASE_URL  		:String;			
		public static var RESTFULL_PROVIDER_SERVICE_BASE_URL 	:String;		
		public static var RESTFULL_QM_SERVICE_BASE_URL 			:String;		
		public static var RESTFULL_ADRESSBOOK_SERVICE_BASE_URL 	:String;
		public static var BILLING_RESTFUL_SERVICE 				:String;
		public static var EPRESCRIPTION_ADRESSBOOK_SERVICE 		:String;
		
		public static const NULL_DATE	 						:String	= "0001-01-01T00:00:00" ;//new Date(1901, 00, 01, 17, 0, 0);
		public static const GUID_FORMAT 						:String	= "00000000-0000-0000-0000-000000000000";
		public static const SIGNED_STATUS		 				:String = "Signed";
		public static const UN_SIGNED_STATUS		 			:String = "UnSigned";
		
		public static var SUBSCRIBE_PATIENT :String = "SubscribeUser";
		
		/*public static const FTP_SERVICE_URL				:String = "ftp.quivus.com";
		
		public static const FTP_SERVICE_USERNAME			:String = "fs23013";
		public static const FTP_SERVICE_PASSWORD			:String = "zigron83199";
		
		public static const FTP_SERVICE_ROOT_FOLDER_NAME	:String = "Quivus";*/
		
		
		public static const ERROR							:String = "Error occured on server";
		
		public static const PAGE_SIZE						:int = 200;
		public static const FIRST_PAGE_NUMBER				:int = 1;
		
		//************ e-PRESCRIPTION *****************
		public static const SUBSCRIPTION_PATIENT 				:String = "Patient Subscription";
		// *********** end e-PRESCRIPTION *********
	}
}