package com.gazuntite.provider.eprescription.services.patient.model
{
	import com.adobe.cairngorm.model.ModelLocator;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.provider.eprescription.services.patient.dto.PendingRefillRequestDTO;
	import com.gazuntite.provider.eprescription.services.patient.dto.PharmaciesListDTO;
	import com.gazuntite.provider.eprescription.services.patient.dto.ProviderBasicInfoResult;
	import com.gazuntite.provider.eprescription.services.patient.dto.ServiceLevelDTO;
	import com.gazuntite.provider.eprescription.services.patient.dto.billing.ProviderInsuranceDTO;
	import com.gazuntite.provider.eprescription.services.patient.util.EConstants;
	import com.gazuntite.provider.eprescription.services.patient.util.PSConstants;
	
	import mx.collections.ArrayCollection;
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.utils.ObjectProxy;
	
	[Bindable]
	public class EPrescriptionModelLocator implements ModelLocator 
	{
		private var logger:ILogger = Log.getLogger("com.zigron.provider.search.services.patient.model.SearchPatientModelLocator");
		
		private static var model 							:EPrescriptionModelLocator;
		
		
		public function EPrescriptionModelLocator() : void 
		{
			if ( model != null )
				throw new Error( "Only one SearchPatientModelLocator instance should be instantiated" );
		}
		
		public var securityProxyObject:ObjectProxy;
		public var stateCodeList:ArrayCollection;
		
		//___________________________Billing Detail_________________________________________________
		
		private var _ProviderInsuranceList:ArrayCollection;		
		private var _CurrentProviderInsurance:ProviderInsuranceDTO;
		private var _InsuranceOrganizationList:ArrayCollection;
		private var _PendingRequestList:ArrayCollection;
		public var selectedApproveRefillRequest:PendingRefillRequestDTO; //on selectd button for popup data binding
		public var patientGaxenID:String = '';
		public var isSetNewRXView:Boolean = false;
		private var m_oSearchProviderResults:ProviderBasicInfoResult;
		private var _m_serviceLevelResults:ServiceLevelDTO;
		private var _PatientID:int;
		
		private var _visitID:String;
		private var _visitDate:String;
		private var _EncounterTypeId:int;
		private var _placeOfServiceID:int;
		private var _LoggedInUserSessionID:String;
	
		public var ChronicMedCollection:ArrayCollection = new ArrayCollection();
		public var PresprectionCollection:ArrayCollection = new ArrayCollection();
		
		public function get LoggedInUserSessionID():String
		{
			return _LoggedInUserSessionID;
		}

		public function set LoggedInUserSessionID(value:String):void
		{
			_LoggedInUserSessionID = value;
		}

		public function get placeOfServiceID():int
		{
			return _placeOfServiceID;
		}

		public function set placeOfServiceID(value:int):void
		{
			_placeOfServiceID = value;
		}

		public function get EncounterTypeId():int
		{
			return _EncounterTypeId;
		}

		public function set EncounterTypeId(value:int):void
		{
			_EncounterTypeId = value;
		}

		public function get visitDate():String
		{
			return _visitDate;
		}

		public function set visitDate(value:String):void
		{
			_visitDate = value;
		}

		public function get visitID():String
		{
			return _visitID;
		}

		public function set visitID(value:String):void
		{
			_visitID = value;
		}

		public function get LoggedInUserGaxenID():String
		{
			return _m_iLoggedInUserGaxenID;
		}
		
		public function set LoggedInUserGaxenID(value:String):void
		{
			_m_iLoggedInUserGaxenID = value;
		}
		
		public function get PatientID():int
		{
			return _PatientID;
		}
		
		public function set PatientID(value:int):void
		{
			_PatientID = value;
		}
		
		public function get medicineResults():ArrayCollection
		{
			return _medicineResults;
		}
		
		public function set medicineResults(value:ArrayCollection):void
		{
			_medicineResults = value;
		}
		
		public function updateModel(loggedInUserId:int, loggedInUserProviderId:int, loggedInUserProviderTypeId:int, loggedInUserSelectedBranchId:int, userSelectedPracticeName:String, stationName:String, stationId:int, authentication:ObjectProxy, IsloggedInUserProvider:Boolean,sessionID:String):void
		{
			this.LoggedInUserId						= loggedInUserId;
			this.LoggedInUserProviderId				= loggedInUserProviderId;
			this.LoggedInUserProviderTypeId			= loggedInUserProviderTypeId;
			this.LoggedInUserSelectedBranchId		= loggedInUserSelectedBranchId;
			this.LoggedInUserSelectedPracticeName	= userSelectedPracticeName; 
			this.LoggedInUserSelectedStationName 	= stationName; 
			this.LoggedInUserSelectedStationId		= stationId;
			this.LoggedInUserSessionID				= sessionID;
		}
		
		public function resetModel():void
		{
			this.LoggedInUserId						= undefined;
			this.LoggedInUserProviderId				= undefined;
			this.LoggedInUserProviderTypeId			= undefined;
			this.LoggedInUserSelectedBranchId		= undefined;
			this.LoggedInUserSelectedPracticeName	= undefined; 
			this.LoggedInUserSelectedStationName 	= undefined; 
			this.LoggedInUserSelectedStationId		= undefined;
			this.LoggedInUserSessionID		= undefined;
			
			PharmacyListDTO  						= new PharmaciesListDTO();
			medicineResults							= new ArrayCollection();
			
			this.CurrentPageNo						= 1 ;
			this.TotalRecords						= 0 ;
			this.FirstRecord						= 0 ;
			this.LastRecord							= 0 ;
			this.TotalPageNo						= 0 ;
		}
		
		
		public function get LoggedInUserSelectedStationId():int
		{
			return m_iStationId;
		}
		
		public function set LoggedInUserSelectedStationId(value:int):void
		{
			m_iStationId = value;
		}
		
		public function get InsuranceOrganizationList():ArrayCollection
		{
			return _InsuranceOrganizationList;
		}
		
		public function set InsuranceOrganizationList(value:ArrayCollection):void
		{
			_InsuranceOrganizationList = value;
		}
		
		public function get CurrentProviderInsurance():ProviderInsuranceDTO
		{
			return _CurrentProviderInsurance;
		}
		
		public function set CurrentProviderInsurance(value:ProviderInsuranceDTO):void
		{
			_CurrentProviderInsurance = value;
		}	
		
		public function get ProviderInsuranceList():ArrayCollection
		{
			return _ProviderInsuranceList;
		}
		
		public function set ProviderInsuranceList(value:ArrayCollection):void
		{
			_ProviderInsuranceList = value;
		}
		
		public function get serviceLevelsDTO():ServiceLevelDTO
		{
			return _m_serviceLevelResults;
		}
		
		public function set serviceLevelsDTO(value:ServiceLevelDTO):void
		{
			_m_serviceLevelResults = value;
		}
		
		public static function getInstance() : EPrescriptionModelLocator
		{
			if ( model == null )
				model = new EPrescriptionModelLocator();
			return model;
		}
		
		public function get SearchProviderDetailsResults():ProviderBasicInfoResult
		{
			return m_oSearchProviderResults;
		}
		
		public function set SearchProviderDetailsResults(value:ProviderBasicInfoResult):void
		{
			m_oSearchProviderResults = value;
		}
		
		private var _workingdays:ArrayCollection = new ArrayCollection;
		
		public function get workingdays():ArrayCollection
		{
			return _workingdays;
		}
		
		public function set workingdays(value:ArrayCollection):void
		{
			_workingdays = value;
		}
		
		private var m_PharmacyResults:PharmaciesListDTO;
		private var _medicineResults:ArrayCollection;
		//private var m_PharmacyResults:XML;
		
		public function get PharmacyListDTO():PharmaciesListDTO
		{
			return m_PharmacyResults;
		}
		
		public function set PharmacyListDTO(value:PharmaciesListDTO):void
		{
			m_PharmacyResults = value;
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
			
			PSConstants.RESTFULL_SERVICE_BASE_URL			= XmlUtils.getPropertyValueByName( 'EPRESCRIPTION_RESTFULSERVICE', value );
			EConstants.RESTFULL_SERVICE_BASE_URL 			= XmlUtils.getPropertyValueByName( 'EPRESCRIPTION_RESTFULSERVICE', value );
			EConstants.RESTFULL_PROVIDER_SERVICE_BASE_URL 	= XmlUtils.getPropertyValueByName( 'EPRESCRIPTION_PROVIDER_SERVICE', value );
			EConstants.RESTFULL_USER_SERVICE_BASE_URL 		= XmlUtils.getPropertyValueByName( 'EPRESCRIPTION_USER_SERVICE', value );
			EConstants.RESTFULL_QM_SERVICE_BASE_URL 		= XmlUtils.getPropertyValueByName( 'EPRESCRIPTION_QM_SERVICE', value );
			EConstants.RESTFULL_ADRESSBOOK_SERVICE_BASE_URL = XmlUtils.getPropertyValueByName( 'EPRESCRIPTION_ADRESSBOOK_SERVICE', value );
			EConstants.BILLING_RESTFUL_SERVICE 				= XmlUtils.getPropertyValueByName( 'BILLING_RESTFUL_SERVICE', value );
			EConstants.EPRESCRIPTION_ADRESSBOOK_SERVICE 	= XmlUtils.getPropertyValueByName( 'EPRESCRIPTION_ADRESSBOOK_SERVICE', value );
		}
		
		public function get PendingRequestList():ArrayCollection
		{
			return _PendingRequestList;
		}
		
		public function set PendingRequestList(value:ArrayCollection):void
		{
			_PendingRequestList = value;
		}
		
		//############################ DATA MEMBERS ###########################################
		//Logged In User info members...
		private var m_iLoggedInUserId:int, 
		m_iLoggedInUserSelectedBranchId:int = 7, 
			m_iLoggedInUserProviderId:int = 486, 
			m_iLoggedInUserProviderTypeId:int = 3,
			m_sUserSelectedPracticeName:String, 
			m_sStationName:String, 
			m_iStationId:int,
			_m_iLoggedInUserGaxenID:String;
		
		private var m_iTotalRecords:int,
		m_iFirstRecord:int,
		m_iLastRecord:int,
		m_iTotalPageNo:int,
		m_iCurrentPageNo:int;
		
		
		public var checkPrescriberServiceLevels:Boolean;
		
		
		//######################### DATA MEMBERS END ##########################################
		
		//private var m_oSearchPatientResults:SearchPatientResultsList;
		
		//############################ DATA MEMBERS GETTERS SETTERS #########################################
		
		/*public function get SearchPatientResults():SearchPatientResultsList
		{
		return m_oSearchPatientResults;
		}
		
		public function set SearchPatientResults(value:SearchPatientResultsList):void
		{
		m_oSearchPatientResults = value;
		}
		*/
		
		//######################### DATA MEMBERS GETTERS SETTERS END ##########################################
	}
}