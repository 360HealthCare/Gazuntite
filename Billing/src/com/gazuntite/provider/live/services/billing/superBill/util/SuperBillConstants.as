package com.gazuntite.provider.live.services.billing.superBill.util
{

	

	public class SuperBillConstants
	{  
		
		public static var RESTFULL_SERVICE_BASE_URL				:String = "http://www.quivus.com/QuivusAirDev/QBillingService/BillingService.svc/";  //***Staging
		//public static var RESTFULL_SERVICE_BASE_URL				:String = "http://beta.quivus.com/QuivusAirProduction/QBillingService/BillingService.svc/";	//***Beta	
		//public static var RESTFULL_SERVICE_BASE_URL				:String = "http://localhost:49431/BillingService.svc/";   //***Local
		
		//public static var USER_RESTFULL_SERVICE_BASE_URL		:String = "http://localhost:51748/Service/RestfulService/UserManagerRestfulService.svc/";  //***Local
		//public static var USER_RESTFULL_SERVICE_BASE_URL		:String = "http://beta.quivus.com/QuivusAirProduction/QUserService/Service/RestfulService/UserManagerRestfulService.svc/";  //***Beta
		public static var USER_RESTFULL_SERVICE_BASE_URL		:String = "http://www.quivus.com/QuivusAirDev/UserService/Service/RestfulService/UserManagerRestfulService.svc/";   //***Staging
		
		public static const ERROR							    :String = "Error occured on server";
		public static const FALSE							    :String = "false";
		public static const TRUE							    :String = "true";
		public static const YES							    	:String = "YES";
		public static const NO							    	:String = "NO";
		
		//Reporting
		public static var REPORT_ID								:String = "0";
		public static var REPORT_TYPE_ID						:String = "0";
		public static var REPORT_PARAMETERS						:String = "";
		
		
		//public static var BILLING_REPORT_BASE_URL			    :String	= "http://localhost:64475/ReportViewer.aspx"; //***Local
		public static var BILLING_REPORT_BASE_URL           	:String = "http://www.quivus.com/ReportingPortal/ReportViewer.aspx"; //***Staging
		//public static var BILLING_REPORT_BASE_URL           	:String = "http://beta.quivus.com/QuivusAirProduction/ReportingPortal/ReportViewer.aspx"; //***Beta
		
		//public static const PAGE_SIZE						:int = 4; // for testing 
		public static const PAGE_SIZE						:int = 20;
		public static const FIRST_PAGE_NUMBER				:int = 1;
		public static const EDIT_CLICK_HANDLER:String 		="EditRecordEvent";
		
	}
}