package com.gazuntite.provider.services.sms.model
{
	import com.adobe.cairngorm.model.ModelLocator;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.provider.services.sms.dto.SMSResultList;
	import com.gazuntite.provider.services.sms.util.CommunicationConstant;
	
	import mx.binding.utils.BindingUtils;
	import mx.collections.ArrayCollection;
	import mx.logging.ILogger;
	import mx.logging.Log;
	
	[Bindable]
	public class SMSModelLocator implements ModelLocator
	{
		private static var model 	:SMSModelLocator;
		private var _smsResultList:SMSResultList = new SMSResultList();
		private var logger:ILogger = Log.getLogger("com.gazuntite.provider.services.sms.model.SMSModelLocator");
		
		private var _currentPage:int = 1;
		private var _totalPage:int = 1;
		private var _smsIDs:String;
		
		public function SMSModelLocator()
		{
			if ( model != null )
				throw new Error( "Only one EmailModelLocator instance should be instantiated" );
		}
		
		public static function getInstance() : SMSModelLocator
		{
			if ( model == null )
				model = new SMSModelLocator();
			return model;
		}

		public function get smsResultList():SMSResultList
		{
			return _smsResultList;
		}

		public function set smsResultList(value:SMSResultList):void
		{
			_smsResultList = value;
		}

		public function get currentPage():int
		{
			return _currentPage;
		}

		public function set currentPage(value:int):void
		{
			_currentPage = value;
		}

		public function get totalPage():int
		{
			return _totalPage;
		}

		public function set totalPage(value:int):void
		{
			_totalPage = value;
		}

		public function get smsIDs():String
		{
			return _smsIDs;
		}

		public function set smsIDs(value:String):void
		{
			_smsIDs = value;
		}

		
		
		// LOGGED IN USER DATA - START
		private var _loggedInUserId							:int;
		private var _loggedInUserProviderId					:int;
		private var _loggedInUserProviderTypeId				:int;
		private var _loggedInUserSelectedBranchId				:int;
		
		private var _loggedInUserSelectedPracticeName			:String;//clinic branch name
		private var _loggedInUserSelectedStationID			:int;
		
		
		
		
		
		public function updateModel(loggedInUserId:int, loggedInUserProviderId:int,loggedInUserProviderTypeId:int,loggedInUserSelectedBranchId:int, loggedInUserSelectedBranchName:String,stationName:String ,stationID:int):void
		{
			this.loggedInUserId						= loggedInUserId;
			this.loggedInUserProviderId				= loggedInUserProviderId;
			this.loggedInUserProviderTypeId			= loggedInUserProviderTypeId;
			this.loggedInUserSelectedBranchId		= loggedInUserSelectedBranchId;
			//this.loggedInUserSelectedPracticeName	= userSelectedPracticeName; 
			this.loggedInUserSelectedStationID 	= stationID; 
		}
		
		public function get loggedInUserId():int
		{
			return _loggedInUserId;
		}
		
		public function set loggedInUserId(value:int):void
		{
			_loggedInUserId = value;
		}
		
		public function get loggedInUserProviderId():int
		{
			return _loggedInUserProviderId;
		}
		
		public function set loggedInUserProviderId(value:int):void
		{
			_loggedInUserProviderId = value;
		}
		
		public function get loggedInUserProviderTypeId():int
		{
			return _loggedInUserProviderTypeId;
		}
		
		public function set loggedInUserProviderTypeId(value:int):void
		{
			_loggedInUserProviderTypeId = value;
		}
		
		public function get loggedInUserSelectedBranchId():int
		{
			return _loggedInUserSelectedBranchId;
		}
		
		public function set loggedInUserSelectedBranchId(value:int):void
		{
			_loggedInUserSelectedBranchId = value;
		}
		
		public function get loggedInUserSelectedPracticeName():String
		{
			return _loggedInUserSelectedPracticeName;
		}
		
		public function set loggedInUserSelectedPracticeName(value:String):void
		{
			_loggedInUserSelectedPracticeName = value;
		}
		
		public function get loggedInUserSelectedStationID():int
		{
			return _loggedInUserSelectedStationID;
		}
		
		public function set loggedInUserSelectedStationID(value:int):void
		{
			_loggedInUserSelectedStationID = value;
		}

		private var _ConfigXML							:XML;
		
		public function get ConfigXML():XML
		{
			return _ConfigXML;
		}
		
		public function set ConfigXML(value:XML):void
		{
			_ConfigXML = value;
			
			CommunicationConstant.RESTFULL_SERVICE_BASE_URL 			= XmlUtils.getPropertyValueByName( 'COMMUNICATION_RESTFUL_SERVICE', value );
			
			//log it 
			logger.debug( "RESTFULL_SERVICE_BASE_URL: " + CommunicationConstant.RESTFULL_SERVICE_BASE_URL  );
		}
		
	}
}