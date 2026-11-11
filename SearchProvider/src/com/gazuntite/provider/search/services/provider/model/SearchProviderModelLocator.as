package com.gazuntite.provider.search.services.provider.model
{
	import com.adobe.cairngorm.model.ModelLocator;
	import com.gazuntite.provider.search.services.provider.dto.SearchProviderResultsList;
	import com.gazuntite.provider.search.services.provider.util.PSConstants;
	import com.gazuntite.provider.search.services.provider.util.XmlUtils;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	
	[Bindable]
	public class SearchProviderModelLocator implements ModelLocator
	{
		private var logger:ILogger = Log.getLogger("com.zigron.provider.search.services.patient.model.SearchProviderModelLocator");
		
		private static var model 							:SearchProviderModelLocator;
		
		public function SearchProviderModelLocator() : void 
		{
			if ( model != null )
				throw new Error( "Only one SearchProviderModelLocator instance should be instantiated" );
		}

		public static function getInstance() : SearchProviderModelLocator
		{
			if ( model == null )
				model = new SearchProviderModelLocator();
			return model;
		}
		
		public function updateModel(loggedInUserId:int, loggedInUserProviderId:int,loggedInUserProviderTypeId:int,loggedInUserSelectedBranchId:int, userSelectedPracticeName:String, stationName:String):void
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
			
			this.CurrentPageNo						= 1 ;
			this.TotalRecords						= 0 ;
			this.FirstRecord						= 0 ;
			this.LastRecord							= 0 ;
			this.TotalPageNo						= 0 ;
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
		
		
		public function get TotalRecords():int
		{
			return m_iTotalRecords;
		}
		
		public function set TotalRecords(value:int):void
		{
			m_iTotalRecords = value;
		}
		
		
		public function get FirstRecord():int
		{
			return m_iFirstRecord;
		}
		
		public function set FirstRecord(value:int):void
		{
			m_iFirstRecord = value;
		}
		
		
		public function get LastRecord():int
		{
			return m_iLastRecord;
		}
		
		public function set LastRecord(value:int):void
		{
			m_iLastRecord = value;
		}
		
		
		public function get TotalPageNo():int
		{
			return m_iTotalPageNo;
		}
		
		public function set TotalPageNo(value:int):void
		{
			m_iTotalPageNo = value;
		}
		
		
		public function get CurrentPageNo():int
		{
			return m_iCurrentPageNo;
		}
		
		public function set CurrentPageNo(value:int):void
		{
			m_iCurrentPageNo = value;
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
			
			PSConstants.RESTFULL_SERVICE_BASE_URL 	= XmlUtils.getPropertyValueByName( 'EPRESCRIPTION_PROVIDER_SERVICE', value );
			
			logger.debug( "RESTFULL_SERVICE_BASE_URL: " + PSConstants.RESTFULL_SERVICE_BASE_URL );
		}
		
		
		
		//############################ DATA MEMBERS ###########################################
		
		//Logged In User info members...
		private var m_iLoggedInUserId:int, 
		m_iLoggedInUserSelectedBranchId:int = 7, 
			m_iLoggedInUserProviderId:int = 486, 
			m_iLoggedInUserProviderTypeId:int = 3,
			m_sUserSelectedPracticeName:String, 
			m_sStationName:String;
		
		private var m_iTotalRecords:int,
		m_iFirstRecord:int,
		m_iLastRecord:int,
		m_iTotalPageNo:int,
		m_iCurrentPageNo:int;
		
		
		
		//######################### DATA MEMBERS END ##########################################
		
		private var m_oSearchProviderResults:SearchProviderResultsList;
		
		
		//############################ DATA MEMBERS GETTERS SETTERS #########################################
		
		public function get SearchProviderResults():SearchProviderResultsList
		{
			return m_oSearchProviderResults;
		}
		
		public function set SearchProviderResults(value:SearchProviderResultsList):void
		{
			m_oSearchProviderResults = value;
		}
	}
}