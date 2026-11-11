package com.gazuntite.provider.live.services.billing.model
{
	import com.adobe.cairngorm.model.ModelLocator;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.provider.live.services.billing.superBill.model.SuperBillModelLocator;
	import com.gazuntite.provider.live.services.billing.util.BillingConstants;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.utils.ObjectProxy;

	public class BillingModelLocator implements ModelLocator 
	{
		private var logger:ILogger = Log.getLogger("com.gazuntite.provider.live.services.billing.model.BillingModelLocator");
		
		private static var model 	:BillingModelLocator;
		
		
		public function BillingModelLocator() : void 
		{
			if ( model != null )
				throw new Error( "Only one BillingModelLocator instance should be instantiated" );
		}		
		
		public static function getInstance() : BillingModelLocator
		{
			if ( model == null )
				model = new BillingModelLocator();
			return model;
		}
		
		private var _VisitID:int;
		
		public function get VisitID():int
		{
			return _VisitID;
		}
		
		public function set VisitID(value:int):void
		{
			_VisitID = value;
		}
		
		public function updateModel(loggedInUserId:int, loggedInUserProviderId:int, loggedInUserProviderTypeId:int, loggedInUserSelectedBranchId:int, userSelectedPracticeName:String, stationName:String, stationId:int, authentication:ObjectProxy, IsloggedInUserProvider:Boolean, loggedInUserSessionID:String):void
		{
			
			//this.LoggedInUserProviderId				= loggedInUserId;			
			
			this.LoggedInUserId						= loggedInUserId;			
			this.LoggedInUserProviderTypeId			= loggedInUserProviderTypeId;
			this.LoggedInUserSelectedBranchId		= loggedInUserSelectedBranchId;
			this.LoggedInUserSelectedPracticeName	= userSelectedPracticeName; 
			this.LoggedInUserSelectedStationName 	= stationName; 
			this.LoggedInUserSessionID				= loggedInUserSessionID;
			
			//update inner models
			var superBillModel:SuperBillModelLocator = SuperBillModelLocator.getInstance();			
			superBillModel.updateModel(loggedInUserId, loggedInUserProviderId, loggedInUserProviderTypeId, loggedInUserSelectedBranchId, userSelectedPracticeName, stationName, stationId, authentication, IsloggedInUserProvider, loggedInUserSessionID);
			superBillModel.loadSuperBillStaticData();
		}
		
		public function resetModel():void
		{
			this.LoggedInUserId						= undefined;
			this.LoggedInUserProviderId				= undefined;
			this.LoggedInUserProviderTypeId			= undefined;
			this.LoggedInUserSelectedBranchId		= undefined;
			this.LoggedInUserSelectedPracticeName	= undefined; 
			this.LoggedInUserSelectedStationName 	= undefined; 
			
			//update inner models
			SuperBillModelLocator.getInstance().resetModel();
		}
		
		
		public function get LoggedInUserSelectedBranchId():int
		{
			return m_iLoggedInUserSelectedBranchId;
		}
		
		public function set LoggedInUserSelectedBranchId(value:int):void
		{
			m_iLoggedInUserSelectedBranchId = value;
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
		
		public function get LoggedInUserSessionID():String
		{
			return _LoggedInUserSessionID;
		}
		
		public function set LoggedInUserSessionID(value:String):void
		{
			_LoggedInUserSessionID = value;
		}
		
		public function get LoggedInUserSelectedStationName():String
		{
			return m_sStationName;
		}
		
		public function set LoggedInUserSelectedStationName(value:String):void
		{
			m_sStationName = value;
		}
		
		//########################### Gazuntite Configuration ##########################
		private var _ConfigXML							:XML;
		
		public function get ConfigXML():XML
		{
			return _ConfigXML;
		}
		
		public function set ConfigXML(value:XML):void
		{
			_ConfigXML = value;
			
			BillingConstants.RESTFULL_SERVICE_BASE_URL 			= XmlUtils.getPropertyValueByName( 'BILLING_RESTFUL_SERVICE', value );
			BillingConstants.BILLING_REPORT_BASE_URL 			= XmlUtils.getPropertyValueByName( 'BILLING_REPORT_BASE_URL', value );
			BillingConstants.USER_RESTFULL_SERVICE_BASE_URL 	= XmlUtils.getPropertyValueByName( 'EPRESCRIPTION_USER_SERVICE', value );
			
			//log it 
			logger.debug( "BILLING_RESTFUL_SERVICE URL: " + BillingConstants.RESTFULL_SERVICE_BASE_URL  );
			logger.debug( "BILLING_REPORT_BASE_URL URL: " + BillingConstants.BILLING_REPORT_BASE_URL  );
			logger.debug( "EPRESCRIPTION_USER_SERVICE URL: " + BillingConstants.USER_RESTFULL_SERVICE_BASE_URL  );
		}
		
		//############################ DATA MEMBERS ###########################################
		
		//Logged In User info members...
		private var //m_iLoggedInUserId:int = 610,//42934,//610, 
		m_iLoggedInUserId:int = 	42984, //for local
			m_iLoggedInUserSelectedBranchId:int = 7, 
			//m_iLoggedInUserProviderId:int =  610,//42934,//610, 
			m_iLoggedInUserProviderId:int = 42984,  //for local
			m_iLoggedInUserProviderTypeId:int = 3,
			m_sUserSelectedPracticeName:String, 
			_LoggedInUserSessionID:String,
			m_sStationName:String;	
	}
}