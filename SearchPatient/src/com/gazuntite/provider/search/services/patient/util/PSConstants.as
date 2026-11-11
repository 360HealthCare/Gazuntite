package com.gazuntite.provider.search.services.patient.util
{
	public class PSConstants
	{
	
		public static const LOCAL_PATIENTS_DB					:String = "dbLocalPatientsListData.db";
		
		private static var _appVersion							:String = "1.5.5";
		
		public static function get appVersion():String
		{
			return _appVersion;
		}
		
		public static function set appVersion(value:String):void
		{
			_appVersion = value;
		}
		
	    public static var RESTFULL_SERVICE_BASE_URL			:String ;//= "http://quivus.com/QuivusAirDev/UserSearchService/Service/RestfulService/UserManagerRestfulService.svc/";
		//public static const RESTFULL_SERVICE_BASE_URL		:String = "http://quivus.com/QuivusAirProduction/QUserSearchService/Service/RestfulService/UserManagerRestfulService.svc/";
		
		//public static var RESTFULL_SERVICE_BASE_URL		:String;
		
		/*public static const FTP_SERVICE_URL				:String = "ftp.quivus.com";
		
		public static const FTP_SERVICE_USERNAME			:String = "fs23013";
		public static const FTP_SERVICE_PASSWORD			:String = "zigron83199";
		
		public static const FTP_SERVICE_ROOT_FOLDER_NAME	:String = "Quivus";*/
		
		
		public static const ERROR							:String = "Error occured on server";
		
		public static const PAGE_SIZE						:int = 200;
		public static const FIRST_PAGE_NUMBER				:int = 1;
		
		
		
	}
}