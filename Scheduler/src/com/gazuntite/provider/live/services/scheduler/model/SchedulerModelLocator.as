package com.gazuntite.provider.live.services.scheduler.model
{
	import com.adobe.cairngorm.model.ModelLocator;
	import com.gazuntite.provider.live.services.scheduler.dto.AppointmentDTO;
	import com.gazuntite.provider.live.services.scheduler.dto.PatientCompleteInfoDTO;
	import com.gazuntite.provider.live.services.scheduler.dto.RoomDTO;
	import com.gazuntite.provider.live.services.scheduler.dto.WorkingHoursDTO;
	import com.gazuntite.provider.live.services.scheduler.dto.staticData.StaticDataDTO;
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerConstant;
	
	import mx.collections.ArrayCollection;
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.utils.ObjectProxy;
	
	[Bindable]
	public class SchedulerModelLocator implements ModelLocator
	{
		private var logger:ILogger = Log.getLogger("com.gazuntite.provider.live.services.scheduler.model.SchedulerModelLocator");
		
		
		private static var model:SchedulerModelLocator;
		public function SchedulerModelLocator()
		{
			if ( model != null )
				throw new Error( "Only one SchedulerModelLocator instance should be instantiated" );
		}
		
		public static function getInstance() : SchedulerModelLocator {
			if ( model == null )
				model = new SchedulerModelLocator();
			return model;
		}

		 
		public function updateModel(loggedInUserId:int, loggedInUserProviderId:int, loggedInUserProviderTypeId:int, loggedInUserSelectedBranchId:int, userSelectedPracticeName:String, stationName:String, stationId:int, authentication:ObjectProxy, IsloggedInUserProvider:Boolean):void
		{
			this.loggedInUserId						= loggedInUserId;
			this.loggedInUserProviderId				= loggedInUserProviderId;
			this.loggedInUserProviderTypeId			= loggedInUserProviderTypeId;
			this.loggedInUserSelectedBranchId		= loggedInUserSelectedBranchId;
			this.loggedInUserSelectedPracticeName	= userSelectedPracticeName; 
			this.loggedInUserSelectedStationName 	= stationName; 
			this.loggedInUserSelectedStationId		= stationId;
		}
		// LOGGED IN USER DATA - START
		public var loggedInUserId:int ;
		public var loggedInUserProviderId:int;
		public var loggedInUserProviderTypeId:int;
		public var loggedInUserSelectedBranchId:int;
		public var loggedInUserSelectedPracticeName:String;
		public var loggedInUserSelectedStationName:String;
		public var loggedInUserSelectedStationId:int;
		// LOGGED IN USER DATA - END
		
		//Enum for Load Appointments
		public var viewTypeToday:int						= 1;
		public var viewTypeWorkweek:int						= 2;
		public var viewTypeWeek:int							= 3;
		public var viewTypeMonth:int						= 4;
		
		//for calendar View we save prefrences & load/refresh Appointment on that basis
		public var sl_userId:int = 0;
		public var sl_provId:int = 0;
		public var sl_brnhId:int = 0;
		public var sl_stanId:int = 0;
		public var sl_isProAll:Boolean;
		public var sl_isStaAll:Boolean;
		//******************** Start Total records ***********************
		public var totalRecords_AllApp:int;
		public var totalRecords_PendReq:int;
		public var totalRecords_SearchApp:int;
		//******************** END Total records ***********************
		//******************** Start Page No ***********************
		public var totalPages_Apponintments:int;
		public var currentPage_Apponintments:int = 1;
		public var totalPages_PendRequest:int;
		public var currentPage_PendRequest:int   = 1;
		//******************** END Page No  ***********************
		//########################### Gazuntite Configuration ##########################
		private var _ConfigXML							:XML;
		
		public function get ConfigXML():XML
		{
			return _ConfigXML;
		}
		
		public function set ConfigXML(value:XML):void
		{
			_ConfigXML = value;
			
			SchedulerConstant.RESTFULL_SERVICE_BASE_URL = value.property.( @name == 'SCHEDULER_SERVICE_RESTFULSERVICE' 	)[0].@value;
			
			logger.debug( "RESTFULL_SERVICE_BASE_URL: " 		+ SchedulerConstant.RESTFULL_SERVICE_BASE_URL );
		}

		
		//############################ DATA MEMBERS ###########################################
		
		private var m_oStaticDataList:StaticDataDTO = new StaticDataDTO();
		
		private var m_oSelectedPatient:PatientCompleteInfoDTO;
		private var m_oProviderWorkingHourList:ArrayCollection ;
		private var m_oSearchPatientsList:ArrayCollection ;
		private var m_oSearchAppointmentList:ArrayCollection;
		private var m_oScheduledAppointmentList:ArrayCollection;
		private var m_oAllAppointmentList:ArrayCollection; // for calendar View - used to display acoording to filter
		private var m_oRequestList:ArrayCollection;
		private var m_oClinicRoomList:ArrayCollection;
		private var m_oSelectedRoomList:ArrayCollection;
		private var m_oSelectedRoomDTO:RoomDTO;
		private var m_oSelectedAppointmentDTO:AppointmentDTO;
		private var m_oRejectionReason:String;
		private var m_oSelectedRequestID:String;
		
		//######################### DATA MEMBERS END ##########################################
		
		
		//############################ DATA MEMBERS GETTERS SETTERS #########################################
		public function get SelectedPatient():PatientCompleteInfoDTO
		{
			return m_oSelectedPatient;
		}
		
		public function set SelectedPatient(value:PatientCompleteInfoDTO):void
		{
			m_oSelectedPatient = value;
		}

		public function get StaticData():StaticDataDTO
		{
			return m_oStaticDataList;
		}

		public function set StaticData(value:StaticDataDTO):void
		{
			m_oStaticDataList = value;
		}

		public function get ProviderWorkingHourList():ArrayCollection
		{
			return m_oProviderWorkingHourList;
		}

		public function set ProviderWorkingHourList(value:ArrayCollection):void
		{
			m_oProviderWorkingHourList = value;
		}

		public function get SearchPatientsList():ArrayCollection
		{
			return m_oSearchPatientsList;
		}

		public function set SearchPatientsList(value:ArrayCollection):void
		{
			m_oSearchPatientsList = value;
		}

		public function get ScheduledAppointmentList():ArrayCollection
		{
			return m_oScheduledAppointmentList;
		}

		public function set ScheduledAppointmentList(value:ArrayCollection):void
		{
			m_oScheduledAppointmentList = value;
		}

		public function get SearchAppointmentList():ArrayCollection
		{
			return m_oSearchAppointmentList;
		}

		public function set SearchAppointmentList(value:ArrayCollection):void
		{
			m_oSearchAppointmentList = value;
		}

		public function get RequestList():ArrayCollection
		{
			return m_oRequestList;
		}

		public function set RequestList(value:ArrayCollection):void
		{
			m_oRequestList = value;
		}

		public function get ClinicRoomList():ArrayCollection
		{
			return m_oClinicRoomList;
		}

		public function set ClinicRoomList(value:ArrayCollection):void
		{
			m_oClinicRoomList = value;
		}

		public function get AllAppointmentList():ArrayCollection
		{
			return m_oAllAppointmentList;
		}

		public function set AllAppointmentList(value:ArrayCollection):void
		{
			m_oAllAppointmentList = value;
		}

		public function get SelectedRoomList():ArrayCollection
		{
			return m_oSelectedRoomList;
		}

		public function set SelectedRoomList(value:ArrayCollection):void
		{
			m_oSelectedRoomList = value;
		}

		public function get SelectedRoomDTO():RoomDTO
		{
			return m_oSelectedRoomDTO;
		}

		public function set SelectedRoomDTO(value:RoomDTO):void
		{
			m_oSelectedRoomDTO = value;
		}

		public function get SelectedAppointmentDTO():AppointmentDTO
		{
			return m_oSelectedAppointmentDTO;
		}

		public function set SelectedAppointmentDTO(value:AppointmentDTO):void
		{
			m_oSelectedAppointmentDTO = value;
		}

		public function get RejectionReason():String
		{
			return m_oRejectionReason;
		}

		public function set RejectionReason(value:String):void
		{
			m_oRejectionReason = value;
		}

		public function get SelectedRequestID():String
		{
			return m_oSelectedRequestID;
		}

		public function set SelectedRequestID(value:String):void
		{
			m_oSelectedRequestID = value;
		}


		//######################### DATA MEMBERS GETTERS SETTERS END ##########################################
	}
}