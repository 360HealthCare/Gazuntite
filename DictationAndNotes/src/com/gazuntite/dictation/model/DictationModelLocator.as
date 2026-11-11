package com.gazuntite.dictation.model
{
	import com.adobe.cairngorm.model.ModelLocator;
	import com.gazuntite.dictation.utils.DictationConstants;
	import com.gazuntite.dictation.utils.XmlUtils;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.utils.ObjectProxy;
	
	
	[Bindable]
	public class DictationModelLocator implements ModelLocator 
	{
		private var logger:ILogger = Log.getLogger("com.gazuntite.dictation.model.DictationModelLocator");
		
		private static var model 							:DictationModelLocator;
		
		public function DictationModelLocator() : void 
		{
			if ( model != null )
				throw new Error( "Only one DictationModelLocator instance should be instantiated" );
		}
		
		public static function getInstance() : DictationModelLocator
		{
			if ( model == null )
				model = new DictationModelLocator();
			return model;
		}

		public function updateModel(loggedInUserId:int, loggedInUserProviderId:int, loggedInUserProviderTypeId:int, loggedInUserSelectedBranchId:int, userSelectedPracticeName:String, stationName:String, stationId:int, authentication:ObjectProxy, IsloggedInUserProvider:Boolean):void
		{
			this.LoggedInUserId						= loggedInUserId;
			this.LoggedInUserProviderId				= loggedInUserProviderId;
			this.LoggedInUserProviderTypeId			= loggedInUserProviderTypeId;
			this.LoggedInUserSelectedBranchId		= loggedInUserSelectedBranchId;
			this.LoggedInUserSelectedPracticeName	= userSelectedPracticeName; 
			this.LoggedInUserSelectedStationName 	= stationName; 
		}
		
		public function resetModel():void
		{
			this.LoggedInUserId						= undefined;
			this.LoggedInUserProviderId				= undefined;
			this.LoggedInUserProviderTypeId			= undefined;
			this.LoggedInUserSelectedBranchId		= undefined;
			this.LoggedInUserSelectedPracticeName	= undefined; 
			this.LoggedInUserSelectedStationName 	= undefined; 
			
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
			
			DictationConstants.RESTFULL_SERVICE_BASE_URL 	= XmlUtils.getPropertyValueByName( 'DICTATION_RESTFULSERVICE', value );
			DictationConstants.DICTATION_FILE_LOCAL_DIR 	= XmlUtils.getPropertyValueByName( 'DICTATION_FOLDER_NAME', value );
			
			logger.debug( "DICTATION_RESTFULSERVICE: " + DictationConstants.RESTFULL_SERVICE_BASE_URL );
			logger.debug( "DICTATION_FILE_LOCAL_DIR: " + DictationConstants.DICTATION_FILE_LOCAL_DIR );
		}
		
		
		
		//############################ DATA MEMBERS ###########################################
		
		//Logged In User info members...
		private var m_iLoggedInUserId:int, 
					m_iLoggedInUserSelectedBranchId:int = 7, 
					m_iLoggedInUserProviderId:int = 486, 
					m_iLoggedInUserProviderTypeId:int = 3,
					m_sUserSelectedPracticeName:String, 
					m_sStationName:String;
		
		private var dictationID:String, sessionID:String;
		//######################### DATA MEMBERS END ##########################################
		
		
		//############################ DATA MEMBERS GETTERS SETTERS #########################################
		
		
		//######################### DATA MEMBERS GETTERS SETTERS END ##########################################
		
		
	}
}