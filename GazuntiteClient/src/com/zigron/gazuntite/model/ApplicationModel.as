package com.zigron.gazuntite.model
{
	import com.adobe.cairngorm.model.ModelLocator;
	import com.gazuntite.common.dto.ClinicBranchUserRoleDTO;
	import com.gazuntite.common.dto.PatientDTO;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.dictation.model.DictationModelLocator;
	import com.gazuntite.history.model.HistoryModelLocator;
	import com.gazuntite.input.model.QIModelLocator;
	import com.gazuntite.provider.eprescription.services.patient.model.EPrescriptionModelLocator;
	import com.gazuntite.provider.live.services.billing.model.BillingModelLocator;
	import com.gazuntite.provider.search.services.patient.model.SearchPatientModelLocator;
	import com.gazuntite.provider.search.services.provider.dto.ProviderBasicInfoResult;
	import com.gazuntite.provider.search.services.provider.model.SearchProviderModelLocator;
	import com.gazuntite.provider.services.email.model.EmailModelLocator;
	import com.gazuntite.provider.services.sms.model.SMSModelLocator;
	import com.gazuntite.webRTC.model.WebRTCModel;
	import com.zigron.gazuntite.logging.LoggingUtil;
	import com.zigron.gazuntite.model.valueObjects.login.LoginDTO;
	import com.zigron.gazuntite.model.valueObjects.login.SessionDTO;
	import com.zigron.gazuntite.model.valueObjects.login.StationDTO;
	import com.zigron.gazuntite.model.valueObjects.login.UserClinicBranchDTO;
	import com.zigron.gazuntite.model.valueObjects.patient.RecentPatientList;
	import com.zigron.gazuntite.model.valueObjects.provider.ProviderList;
	import com.zigron.gazuntite.model.valueObjects.search.SearchEngineDTO;
	import com.zigron.gazuntite.utils.Constants;
	
	import mx.collections.ArrayCollection;
	import mx.logging.ILogger;
	import mx.logging.Log;
	
	[Bindable]
	public class ApplicationModel implements ModelLocator
	{
		private static var model 	:ApplicationModel;
		
		public function ApplicationModel() : void 
		{
			if ( ApplicationModel.model != null )
				throw new Error( "Only one ApplicationModel instance should be instantiated" );
		}
		
		private var _selectedPatientName:String = 'Search Patient';
		private var _confirmLoadPatientName:String = '';
		private var _selectedPatientDTO:PatientDTO;
		public var isPatientAlredayLoaded:Boolean = false;
		
		private var _LoggedInuserGaxenID:String;

		public function get LoggedInuserGaxenID():String
		{
			return _LoggedInuserGaxenID;
		}
		
		public function set LoggedInuserGaxenID(value:String):void
		{
			_LoggedInuserGaxenID = value;
		}
		
		public function get LoggedInUserSessionDTO():SessionDTO
		{
			return _LoggedInUserSessionDTO;
		}
		
		public function set LoggedInUserSessionDTO(value:SessionDTO):void
		{
			_LoggedInUserSessionDTO = value;
		}
		
		public function get userImageData():String
		{
			return _userImageData;
		}
		
		public function set userImageData(value:String):void
		{
			_userImageData = value;
		}
		
		public function get SearchProviderDetailsResults():ProviderBasicInfoResult
		{
			return _SearchProviderDetailsResults;
		}
		
		public function set SearchProviderDetailsResults(value:ProviderBasicInfoResult):void
		{
			_SearchProviderDetailsResults = value;
		}
		
		public function get userSelectedStationDTO():StationDTO
		{
			return _userSelectedStationDTO;
		}
		
		public function set userSelectedStationDTO(value:StationDTO):void
		{
			_userSelectedStationDTO = value;
		}
		
		public function get userSelectedRoleDTO():ClinicBranchUserRoleDTO
		{
			return _userSelectedRoleDTO;
		}
		
		public function set userSelectedRoleDTO(value:ClinicBranchUserRoleDTO):void
		{
			_userSelectedRoleDTO = value;
		}
		
		public function get userSelectedClinicBranchDTO():UserClinicBranchDTO
		{
			return _userSelectedClinicBranchDTO;
		}
		
		public function set userSelectedClinicBranchDTO(value:UserClinicBranchDTO):void
		{
			_userSelectedClinicBranchDTO = value;
		}
		
		public function get providerName():String
		{
			return _providerName;
		}
		
		public function set providerName(value:String):void
		{
			_providerName = value;
		}
		
		public function get LoggedInUserDTO():LoginDTO
		{
			return _LoggedInUserDTO;
		}
		
		public function set LoggedInUserDTO(value:LoginDTO):void
		{
			_LoggedInUserDTO = value;
		}
		
		public static function getInstance() : ApplicationModel 
		{
			if ( model == null )
				model = new ApplicationModel();
			
			return model;
		}
		
		// used only in signing-out from the application...
		public static function reSetModelInstance() : void 
		{
			model = null;
		}
		
		
		private var logger								:ILogger = LoggingUtil.getLogger( this );
		private var _AppVersion							:String;
		private var _errorStatus							:String;
		
		public function get errorStatus():String
		{
			return _errorStatus;
		}
		
		public function set errorStatus(value:String):void
		{
			_errorStatus = value;
		}
		
		//########################### Gazuntite Configuration ##########################
		
		private var _ServiceConfigXML					:XML;
		private var _SettingConfigXML					:XML;
		
		public function get ServiceConfigXML():XML
		{
			return _ServiceConfigXML;
		}
		
		public function set ServiceConfigXML(value:XML):void
		{
			_ServiceConfigXML = value;
			
			Constants.DICTATION_FOLDER_NAME 					= XmlUtils.getPropertyValueByName( 'DICTATION_FOLDER_NAME', value );
			Constants.DICTATION_SERVER_URL  					= XmlUtils.getPropertyValueByName( 'DICTATION_SERVER_URL', value );
			Constants.DICTATION_SERVICE_METHOD  				= XmlUtils.getPropertyValueByName( 'DICTATION_SERVICE_METHOD', value );
			Constants.RESTFUL_SERVICE_BASE_URL 					= XmlUtils.getPropertyValueByName( 'RESTFUL_SERVICE_BASE_URL', value );
			Constants.SECURITY_SERVICE_BASE_URL 				= XmlUtils.getPropertyValueByName( 'SECURITY_SERVICE_BASE_URL', value );
			Constants.QUIVUS_SECURITY_SERVICE_BASE_URL 			= XmlUtils.getPropertyValueByName( 'QUIVUS_SECURITY_SERVICE_BASE_URL', value );
			Constants.PATIENT_SEARCH_RESTFULSERVICE 			= XmlUtils.getPropertyValueByName( 'PATIENT_SEARCH_RESTFULSERVICE', value );
			Constants.BILLING_REPORT_BASE_URL       			= XmlUtils.getPropertyValueByName( 'BILLING_REPORT_BASE_URL', value );
			Constants.RESTFULL_PROVIDER_SERVICE_BASE_URL		= XmlUtils.getPropertyValueByName( 'EPRESCRIPTION_PROVIDER_SERVICE', value );
			Constants.RESTFULL_ADRESSBOOK_SERVICE_BASE_URL 		= XmlUtils.getPropertyValueByName( 'EPRESCRIPTION_ADRESSBOOK_SERVICE', value );
			Constants.RESTFULL_SERVICE_BASE_URL 				= XmlUtils.getPropertyValueByName( 'RESTFUL_SERVICE_BASE_URL', value );
			Constants.RESTFULL_USER_MANAGER_SERVICE_BASE_URL 	= XmlUtils.getPropertyValueByName( 'USER_MANAGER_RESTFULLSERVICEBASE_URL', value );
			
			//logger.debug( "DICTATION_FOLDER_NAME: " + Constants.DICTATION_FOLDER_NAME );
			//logger.debug( "DICTATION_SERVER_URL: "  + Constants.DICTATION_SERVER_URL );
			//logger.debug( "DICTATION_SERVICE_METHOD: "  + Constants.DICTATION_SERVICE_METHOD );
			//logger.debug( "RESTFUL_SERVICE_BASE_URL: "  + Constants.RESTFUL_SERVICE_BASE_URL );
		}
		
		public function get SettingConfigXML():XML
		{
			return _SettingConfigXML;
		}
		
		public function set SettingConfigXML(value:XML):void
		{
			_SettingConfigXML = value;
			
			if( Log.isDebug() )
				logger.debug( "SettingConfigXML: " + value );
		}
		
		public function get AppVersion():String
		{
			return _AppVersion;
		}
		
		public function set AppVersion(value:String):void
		{
			_AppVersion = value;
		}
		
		//////////////////////////////////////////////////////////////////////////////
		///////////////////////// PROVIDER RELATED STUFF ////////////////////////////
		//////////////////////////////////////////////////////////////////////////////
		
		private var _providerName:String = '';
		private var _userSelectedClinicBranchDTO:UserClinicBranchDTO;
		private var _userSelectedRoleDTO:ClinicBranchUserRoleDTO;
		private var _userSelectedStationDTO:StationDTO;
		private var _LoggedInUserSessionDTO:SessionDTO;
		private var _selectedProvider:LoginDTO; 
		private var _ProviderLoggedIn:Boolean;
		private var _providerList:ProviderList;
		private var _recentPatientList:RecentPatientList;
		public var connectedUserName					:String;
		public var resetPasswordResult					:String;
		public var resetPasswordIsLockedResult			:String;
		public var resetPasswordIsActiveResult			:String;
		public var resetPasswordIsValidResult           :String;
		public var resetPasswordErrorMessageResult      :String;
		public var isUserLoginSuccessfully				:Boolean;
		
		
		private var _SearchProviderDetailsResults:ProviderBasicInfoResult;
		private var _userImageData							:String;//For user Image @ Top Bar
		
		public function get recentPatientList():RecentPatientList
		{
			return _recentPatientList;
		}
		
		public function set recentPatientList(value:RecentPatientList):void
		{
			_recentPatientList = value;
		}
		
		private var _LoggedInProvider:LoginDTO;
		private var _LoggedInUserDTO:LoginDTO;
		
		private var _userPrefferedSearchEngineDTO:SearchEngineDTO;
		
		public function get userPrefferedSearchEngineDTO():SearchEngineDTO
		{
			return _userPrefferedSearchEngineDTO;
		}
		
		public function set userPrefferedSearchEngineDTO(value:SearchEngineDTO):void
		{
			_userPrefferedSearchEngineDTO = value;
		}
		
		
		public function get LoggedInProvider():LoginDTO
		{
			return _LoggedInProvider;
		}
		
		public function set LoggedInProvider(value:LoginDTO):void
		{
			_LoggedInProvider = value;
		}
		
		public function get selectedProvider():LoginDTO
		{
			return _selectedProvider;
		}
		
		public function set selectedProvider(value:LoginDTO):void
		{
			_selectedProvider = value;
		}
		
		public function get IsProviderLoggedIn():Boolean
		{
			return _ProviderLoggedIn;
		}
		
		public function set IsProviderLoggedIn(value:Boolean):void
		{
			_ProviderLoggedIn = value;
		}
		
		public function get AllProviders():ProviderList
		{
			return _providerList;
		}
		
		public function set AllProviders(value:ProviderList):void
		{
			_providerList = value;
		}
		
		public function ResetModel():void
		{
			LoggedInUserDTO 		= null;
			IsProviderLoggedIn 		= false;
			LoggedInUserSessionDTO  = null;
			LoggedInProvider		= null;
			selectedProvider 		= null;
			
			LoggedInuserGaxenID		='';
			updateModel(null);
		}
		
		public function updateModel(providerDetails:LoginDTO):void
		{
			this.LoggedInProvider = providerDetails;
			this.selectedProvider = providerDetails;
			
			if(null != providerDetails)
			{
				QIModelLocator.getInstance().updateModel(LoggedInProvider.UserId, LoggedInProvider.FullName, LoggedInProvider.UserId, LoggedInUserSessionDTO.UserTypeID, LoggedInUserSessionDTO.ClinicBranchID, userSelectedClinicBranchDTO.ClinicBranch.ClinicBranchName, userSelectedStationDTO.StationName, userSelectedStationDTO.StationID, null, model.IsProviderLoggedIn, model.LoggedInUserDTO.Gender.toLowerCase().charAt(0) == "f"  , LoggedInUserSessionDTO.SessionID ); 
			 	EmailModelLocator.getInstance().updateModel(LoggedInProvider.UserId, LoggedInProvider.UserId, LoggedInUserSessionDTO.UserTypeID,LoggedInUserSessionDTO.ClinicBranchID, userSelectedClinicBranchDTO.ClinicBranch.ClinicBranchName,userSelectedStationDTO.StationName, userSelectedStationDTO.StationID); 
			 	SMSModelLocator.getInstance().updateModel(LoggedInProvider.UserId, LoggedInProvider.UserId, LoggedInUserSessionDTO.UserTypeID,LoggedInUserSessionDTO.ClinicBranchID, userSelectedClinicBranchDTO.ClinicBranch.ClinicBranchName,userSelectedStationDTO.StationName, userSelectedStationDTO.StationID); 
				EPrescriptionModelLocator.getInstance().updateModel(LoggedInProvider.UserId, LoggedInProvider.UserId, LoggedInUserSessionDTO.UserTypeID, LoggedInUserSessionDTO.ClinicBranchID, userSelectedClinicBranchDTO.ClinicBranch.ClinicBranchName, userSelectedStationDTO.StationName, userSelectedStationDTO.StationID, null, true, LoggedInUserSessionDTO.SessionID); 
				HistoryModelLocator.getInstance().updateModel(LoggedInProvider.UserId, LoggedInProvider.UserId, LoggedInUserSessionDTO.UserTypeID, LoggedInUserSessionDTO.ClinicBranchID, userSelectedClinicBranchDTO.ClinicBranch.ClinicBranchName, userSelectedStationDTO.StationName, userSelectedStationDTO.StationID, null, true, LoggedInUserSessionDTO.SessionID); 
				WebRTCModel.getInstance().updateModel( LoggedInProvider.UserId,LoggedInProvider.UserId,LoggedInUserSessionDTO.UserTypeID,LoggedInUserSessionDTO.ClinicBranchID,userSelectedClinicBranchDTO.ClinicBranch.ClinicBranchName,userSelectedStationDTO.StationName,userSelectedStationDTO.StationID,isUserLoginSuccessfully); 
				BillingModelLocator.getInstance().updateModel(LoggedInProvider.UserId,LoggedInProvider.UserId,LoggedInUserSessionDTO.UserTypeID,LoggedInUserSessionDTO.ClinicBranchID,userSelectedClinicBranchDTO.ClinicBranch.ClinicBranchName,userSelectedStationDTO.StationName,userSelectedStationDTO.StationID,null, true,LoggedInUserSessionDTO.SessionID);
				SearchPatientModelLocator.getInstance().updateModel(LoggedInProvider.UserId,LoggedInProvider.UserId,LoggedInUserSessionDTO.UserTypeID,LoggedInUserSessionDTO.ClinicBranchID,userSelectedClinicBranchDTO.ClinicBranch.ClinicBranchName,userSelectedStationDTO.StationName,userSelectedStationDTO.StationID,null,true);
				SearchProviderModelLocator.getInstance().updateModel(LoggedInProvider.UserId,LoggedInProvider.UserId,LoggedInUserSessionDTO.UserTypeID,LoggedInUserSessionDTO.ClinicBranchID,userSelectedClinicBranchDTO.ClinicBranch.ClinicBranchName,userSelectedStationDTO.StationName);
				DictationModelLocator.getInstance().updateModel(LoggedInProvider.UserId,LoggedInProvider.UserId,LoggedInUserSessionDTO.UserTypeID,LoggedInUserSessionDTO.ClinicBranchID,userSelectedClinicBranchDTO.ClinicBranch.ClinicBranchName,userSelectedStationDTO.StationName,userSelectedStationDTO.StationID,null,true);
			}
			else
			{
				WebRTCModel.getInstance().ResetModel();
				HistoryModelLocator.getInstance().resetModel();
				EPrescriptionModelLocator.getInstance().resetModel();
			}
		}
		
		public function get selectedPatientName():String
		{
			return _selectedPatientName;
		}
		
		public function set selectedPatientName(value:String):void
		{
			_selectedPatientName = value;
		}
		
		public function get confirmLoadPatientName():String
		{
			return _confirmLoadPatientName;
		}
		
		public function set confirmLoadPatientName(value:String):void
		{
			_confirmLoadPatientName = value;
		}
		
		public function get selectedPatientDTO():PatientDTO
		{
			return _selectedPatientDTO;
		}
		
		public function set selectedPatientDTO(value:PatientDTO):void
		{
			_selectedPatientDTO = value;
		}
		
		
		public var userSessionTypeList:ArrayCollection;
		//Quick Links section
		public var quickLinksList:ArrayCollection;
		public var allQuickLinksList:ArrayCollection;
		public var manageQuickLinksList:ArrayCollection;
		
		public var BusyStatusID:int;
		public var AwayStatusID:int;
		public var InvusibleStatusID:int;
		public var OffineStatusID:int;
		public var AvaliableStatusID:int;
		
		
	}
}