package com.gazuntite.provider.live.services.elab.model
{
	import com.adobe.cairngorm.model.ModelLocator;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.provider.live.services.elab.dto.ELabFilterCriteriaDTO;
	import com.gazuntite.provider.live.services.elab.dto.LabListDTO;
	import com.gazuntite.provider.live.services.elab.dto.LaboratoryListDTO;
	import com.gazuntite.provider.live.services.elab.dto.MethodListDTO;
	import com.gazuntite.provider.live.services.elab.dto.SearchFieldsListDTO;
	import com.gazuntite.provider.live.services.elab.util.ELabsConstant;
	
	import mx.collections.ArrayCollection;
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.utils.ObjectProxy;
	
	[Bindable]
	public class ELabsAppModelLocator implements ModelLocator 
	{
		private static var model 							:ELabsAppModelLocator;
		private var logger:ILogger = Log.getLogger("com.gazuntite.provider.live.services.elab.model.ELabsAppModelLocator");
		
		public function ELabsAppModelLocator() : void 
		{
			if( model != null )
				throw new Error( "Only one ELabAppModelLocator instance should be instantiated" );
		}
		
		public static function getInstance() : ELabsAppModelLocator
		{
			if ( model == null )
				model = new ELabsAppModelLocator();
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
			this.LoggedInUserSelectedStationID		= stationId;
		}
		
		public function resetModel():void
		{
			this.LoggedInUserId						= undefined;
			this.LoggedInUserProviderId				= undefined;
			this.LoggedInUserProviderTypeId			= undefined;
			this.LoggedInUserSelectedBranchId		= undefined;
			this.LoggedInUserSelectedPracticeName	= undefined; 
			this.LoggedInUserSelectedStationName 	= undefined; 
			this.LoggedInUserSelectedStationID		= undefined;
			
			LabOrderListDto 						= new LabListDTO();
			LabResultListDto 						= new LabListDTO();
			
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
		
		public function get LoggedInUserSelectedStationID():int
		{
			return m_iStationID;
		}
		
		public function set LoggedInUserSelectedStationID(value:int):void
		{
			m_iStationID = value;
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
		
		public function get ResultSearchFieldsList():SearchFieldsListDTO
		{
			return m_oResultSearchFieldsList;
		}
		
		public function set ResultSearchFieldsList(value:SearchFieldsListDTO):void
		{
			m_oResultSearchFieldsList = value;
		}
		
		public function get CommonSearchFieldsList():SearchFieldsListDTO
		{
			return m_oCommonSearchFieldsList;
		}
		
		public function set CommonSearchFieldsList(value:SearchFieldsListDTO):void
		{
			m_oCommonSearchFieldsList = value;
		}
		
		public function get OrderSearchFieldsList():SearchFieldsListDTO
		{
			return m_oOrderSearchFieldsList;
		}
		
		public function set OrderSearchFieldsList(value:SearchFieldsListDTO):void
		{
			m_oOrderSearchFieldsList = value;
		}

		public function get LabOrderListDto():LabListDTO
		{
			return m_oLabOrderListDto;
		}

		public function set LabOrderListDto(value:LabListDTO):void
		{
			m_oLabOrderListDto = value;
		}

		public function get LabResultListDto():LabListDTO
		{
			return m_oLabResultListDto;
		}

		public function set LabResultListDto(value:LabListDTO):void
		{
			m_oLabResultListDto = value;
		}

		public function get LaboratoryListDto():LaboratoryListDTO
		{
			return m_oLaboratoryListDto;
		}

		public function set LaboratoryListDto(value:LaboratoryListDTO):void
		{
			m_oLaboratoryListDto = value;
		}

		public function get TestTypeList():ArrayCollection
		{
			return m_acTestTypeList;
		}

		public function set TestTypeList(value:ArrayCollection):void
		{
			m_acTestTypeList = value;
		}
		
		public function get MethodListDto():MethodListDTO
		{
			return m_oMethodListDto;
		}
		
		public function set MethodListDto(value:MethodListDTO):void
		{
			m_oMethodListDto = value;
		}

		public function get OrderFilterCriteria():ELabFilterCriteriaDTO
		{
			return _OrderFilterCriteria;
		}

		public function set OrderFilterCriteria(value:ELabFilterCriteriaDTO):void
		{
			_OrderFilterCriteria = value;
		}

		public function get ResultFilterCriteria():ELabFilterCriteriaDTO
		{
			return _ResultFilterCriteria;
		}

		public function set ResultFilterCriteria(value:ELabFilterCriteriaDTO):void
		{
			_ResultFilterCriteria = value;
		}

		public function get PendingOrdersFirstRecord():int
		{
			return _PendingOrdersFirstRecord;
		}

		public function set PendingOrdersFirstRecord(value:int):void
		{
			_PendingOrdersFirstRecord = value;
		}

		public function get PendingOrdersLastRecord():int
		{
			return _PendingOrdersLastRecord;
		}

		public function set PendingOrdersLastRecord(value:int):void
		{
			_PendingOrdersLastRecord = value;
		}

		public function get PendingOrdersTotalRecords():int
		{
			return _PendingOrdersTotalRecords;
		}

		public function set PendingOrdersTotalRecords(value:int):void
		{
			_PendingOrdersTotalRecords = value;
		}

		public function get ResultFirstRecord():int
		{
			return _ResultFirstRecord;
		}

		public function set ResultFirstRecord(value:int):void
		{
			_ResultFirstRecord = value;
		}

		public function get ResultLastRecord():int
		{
			return _ResultLastRecord;
		}

		public function set ResultLastRecord(value:int):void
		{
			_ResultLastRecord = value;
		}

		public function get ResultTotalRecords():int
		{
			return _ResultTotalRecords;
		}

		public function set ResultTotalRecords(value:int):void
		{
			_ResultTotalRecords = value;
		}
		
		
		//############################ DATA MEMBERS ###########################################
		
		//Logged In User info members...
		private var m_iLoggedInUserId:int, 
		m_iLoggedInUserSelectedBranchId:int, 
		m_iLoggedInUserProviderId:int, 
		m_iLoggedInUserProviderTypeId:int,
		m_sUserSelectedPracticeName:String, 
		m_sStationName:String,
		m_iStationID:int;
		
		private var m_iTotalRecords:int,
		m_iFirstRecord:int = 1,
		m_iLastRecord:int = 0,
		m_iTotalPageNo:int = 0,
		m_iCurrentPageNo:int = 1;
		
		private var m_oLabOrderListDto:LabListDTO,
		m_oLabResultListDto:LabListDTO,
		m_oResultSearchFieldsList:SearchFieldsListDTO,
		m_oCommonSearchFieldsList:SearchFieldsListDTO,
		m_oLaboratoryListDto:LaboratoryListDTO,
		m_oMethodListDto:MethodListDTO,

		m_acTestTypeList:ArrayCollection = new ArrayCollection(),
		m_oOrderSearchFieldsList:SearchFieldsListDTO;
		
		private var _OrderFilterCriteria:ELabFilterCriteriaDTO;
		private var _ResultFilterCriteria:ELabFilterCriteriaDTO;
		
		private var _PendingOrdersFirstRecord:int;
		private var _PendingOrdersLastRecord:int;
		private var _PendingOrdersTotalRecords:int;
		
		private var _ResultFirstRecord:int;
		private var _ResultLastRecord:int;
		private var _ResultTotalRecords:int;
		
		//######################### DATA MEMBERS END ##########################################
		
		
		
		//############################ DATA MEMBERS GETTERS SETTERS #########################################
		//######################### DATA MEMBERS GETTERS SETTERS END ##########################################
		
		
		private var _ConfigXML							:XML;
		
		public function get ConfigXML():XML
		{
			return _ConfigXML;
		}
		
		public function set ConfigXML(value:XML):void
		{
			_ConfigXML = value;
			
			ELabsConstant.RESTFULL_SERVICE_BASE_URL 			= XmlUtils.getPropertyValueByName( 'ELAB_RESTFUL_SERVICE', value );
			
			//log it 
			logger.debug( "ELAB_RESTFUL_SERVICE: " + ELabsConstant.RESTFULL_SERVICE_BASE_URL  );
		}
	}
}