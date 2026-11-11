package com.gazuntite.history.model
{
	import com.adobe.cairngorm.model.ModelLocator;
	
	import mx.collections.ArrayCollection;
	import mx.utils.ObjectProxy;
	
	[Bindable]
	public class HistoryModelLocator implements ModelLocator
	{
		
		private static var model 							:HistoryModelLocator;
		
		
		private var _LoggedInUserId:int, 
		_LoggedInUserSelectedBranchId:int = 7, 
			_LoggedInUserProviderId:int = 486, 
			_LoggedInUserProviderTypeId:int = 3,
			_LoggedInUserSelectedPracticeName:String , 
			_StationName:String, 
			_StationId:int,
			_LoggedInUserSessionID:String,
			_patientID:int,
			_PatientGaxenID:String;
		
		
		private var _TotalRecords:int,
		_FirstRecord:int,
		_LastRecord:int,
		_TotalPageNo:int,
		_CurrentPageNo:int;
		
		public function HistoryModelLocator() : void 
		{
			if ( model != null )
				throw new Error( "Only one HistoryModelLocator instance should be instantiated" );
		}
		
			public function get PatientGaxenID():String
			{
				return _PatientGaxenID;
			}

			public function set PatientGaxenID(value:String):void
			{
				_PatientGaxenID = value;
			}

		public function get patientID():int
		{
			return _patientID;
		}

		public function set patientID(value:int):void
		{
			_patientID = value;
		}

		public function get LoggedInUserSelectedPracticeName():String
		{
			return _LoggedInUserSelectedPracticeName;
		}
		
		public function set LoggedInUserSelectedPracticeName(value:String):void
		{
			_LoggedInUserSelectedPracticeName = value;
		}
		
		public function get LoggedInUserSessionID():String
		{
			return _LoggedInUserSessionID;
		}
		
		public function set LoggedInUserSessionID(value:String):void
		{
			_LoggedInUserSessionID = value;
		}
		
		public function get CurrentPageNo():int
		{
			return _CurrentPageNo;
		}
		
		public function set CurrentPageNo(value:int):void
		{
			_CurrentPageNo = value;
		}
		
		public function get TotalPageNo():int
		{
			return _TotalPageNo;
		}
		
		public function set TotalPageNo(value:int):void
		{
			_TotalPageNo = value;
		}
		
		public function get LastRecord():int
		{
			return _LastRecord;
		}
		
		public function set LastRecord(value:int):void
		{
			_LastRecord = value;
		}
		
		public function get FirstRecord():int
		{
			return _FirstRecord;
		}
		
		public function set FirstRecord(value:int):void
		{
			_FirstRecord = value;
		}
		
		public function get TotalRecords():int
		{
			return _TotalRecords;
		}
		
		public function set TotalRecords(value:int):void
		{
			_TotalRecords = value;
		}
		
		public function get LoggedInUserSelectedStationId():int
		{
			return _StationId;
		}
		
		public function set LoggedInUserSelectedStationId(value:int):void
		{
			_StationId = value;
		}
		
		public function get LoggedInUserSelectedStationName():String
		{
			return _StationName;
		}
		
		public function set LoggedInUserSelectedStationName(value:String):void
		{
			_StationName = value;
		}
		
		
		public function get LoggedInUserProviderTypeId():int
		{
			return _LoggedInUserProviderTypeId;
		}
		
		public function set LoggedInUserProviderTypeId(value:int):void
		{
			_LoggedInUserProviderTypeId = value;
		}
		
		public function get LoggedInUserProviderId():int
		{
			return _LoggedInUserProviderId;
		}
		
		public function set LoggedInUserProviderId(value:int):void
		{
			_LoggedInUserProviderId = value;
		}
		
		public function get LoggedInUserSelectedBranchId():int
		{
			return _LoggedInUserSelectedBranchId;
		}
		
		public function set LoggedInUserSelectedBranchId(value:int):void
		{
			_LoggedInUserSelectedBranchId = value;
		}
		
		public function get LoggedInUserId():int
		{
			return _LoggedInUserId;
		}
		
		public function set LoggedInUserId(value:int):void
		{
			_LoggedInUserId = value;
		}
		
		public static function getInstance() : HistoryModelLocator
		{
			if ( model == null )
				model = new HistoryModelLocator();
			return model;
		}
		
		
		public function updateModel(loggedInUserId:int, loggedInUserProviderId:int, loggedInUserProviderTypeId:int, loggedInUserSelectedBranchId:int, userSelectedPracticeName:String, stationName:String, stationId:int, authentication:ObjectProxy, IsloggedInUserProvider:Boolean, SessionID:String):void
		{
			this.LoggedInUserId						= loggedInUserId;
			this.LoggedInUserProviderId				= loggedInUserProviderId;
			this.LoggedInUserProviderTypeId			= loggedInUserProviderTypeId;
			LoggedInUserSelectedBranchId		= loggedInUserSelectedBranchId;
			LoggedInUserSelectedPracticeName	= userSelectedPracticeName; 
			this.LoggedInUserSelectedStationName 	= stationName; 
			this.LoggedInUserSelectedStationId		= stationId;
			this.LoggedInUserSessionID				=	SessionID;
		}
		
		public function resetModel():void
		{
			this.LoggedInUserId						= undefined;
			this.LoggedInUserProviderId				= undefined;
			this.LoggedInUserProviderTypeId			= undefined;
			this.LoggedInUserSelectedBranchId		= undefined;
			LoggedInUserSelectedPracticeName	= undefined; 
			this.LoggedInUserSelectedStationName 	= undefined; 
			this.LoggedInUserSelectedStationId		= undefined;
			this.LoggedInUserSessionID				= undefined;
			
			
			this.CurrentPageNo						= 1 ;
			this.TotalRecords						= 0 ;
			this.FirstRecord						= 0 ;
			this.LastRecord							= 0 ;
			this.TotalPageNo						= 0 ;
		}
		
		public var PatientHistoryDTOList:ArrayCollection;
		public var SelectedSectionHistoryList:ArrayCollection;
		
		public var isSearchByDocument:Boolean = false;
		
		public var patientEncounterList:ArrayCollection;
		public var gaxenID:String;
		public var isMale:Boolean;
	}
	
	
	/*private var _ConfigXML							:XML;
	
	public function get ConfigXML():XML
	{
		return _ConfigXML;
	}
	
	public function set ConfigXML(value:XML):void
	{
		_ConfigXML = value;
		
		.RESTFULL_SERVICE_BASE_URL 			= XmlUtils.getPropertyValueByName( 'COMMUNICATION_RESTFUL_SERVICE', value );
		
		//log it 
		logger.debug( "RESTFULL_SERVICE_BASE_URL: " + CommunicationConstant.RESTFULL_SERVICE_BASE_URL  );
	}*/
	
}