package com.gazuntite.provider.live.services.elab.util
{
	public class ELabsConstant
	{
	
		public static var RESTFULL_SERVICE_BASE_URL		:String ;//= "http://www.quivus.com/QuivusAirDev/QLiveprovider/Elabs/Service/ELabManagerService.svc/";
		
		public static const FTP_SERVICE_URL					:String = "ftp.quivus.com";
		
		public static const FTP_SERVICE_USERNAME			:String = "fs23013";
		public static const FTP_SERVICE_PASSWORD			:String = "zigron83199";
		
		public static const FTP_SERVICE_ROOT_FOLDER_NAME	:String = "Quivus";
		
		
		public static const ERROR							:String = "Error occured on server";
		
		public static const PAGE_SIZE						:int = 200;
		public static const FIRST_PAGE_NUMBER				:int = 1;
		
		/**
		 * SIMPLE_SEARCH_LOAD_TYPE, ADVANCED_SEARCH_LOAD_TYPE, ALL_LABS_LOAD_TYPE will be used by
		 *  LoadLabOrder and LoadLabResults methods which require LoadType property which decides how to filter loaded records
		 * if LoadType=1 will perform simple search
		 * LoadType=2 will perform advanced search
		 * any other value will load all records
		 * */
		public static const SIMPLE_SEARCH_LOAD_TYPE:int = 1;
		public static const ADVANCED_SEARCH_LOAD_TYPE:int = 2;
		public static const ALL_LABS_LOAD_TYPE:int = 3;
	}
}