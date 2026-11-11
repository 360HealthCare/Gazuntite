package com.gazuntite.provider.live.services.scheduler.appControllerSCH
{
	import com.adobe.cairngorm.control.FrontController;
	import com.gazuntite.provider.live.services.scheduler.command.LoadAllAppointmentCurrentStatusTypesCommand;
	import com.gazuntite.provider.live.services.scheduler.command.LoadAllAppointmentRequestByProviderCommand;
	import com.gazuntite.provider.live.services.scheduler.command.LoadAllAppointmentRequestStatusTypesCommand;
	import com.gazuntite.provider.live.services.scheduler.command.LoadAllAppointmentTypesCommand;
	import com.gazuntite.provider.live.services.scheduler.command.LoadAllAppointmentsByProviderIdAndStationsIdCommand;
	import com.gazuntite.provider.live.services.scheduler.command.LoadAllProviderByClinicBranchIdCommand;
	import com.gazuntite.provider.live.services.scheduler.command.LoadAllSearchFieldTypesCommand;
	import com.gazuntite.provider.live.services.scheduler.command.LoadAllStationsByClinicIdCommand;
	import com.gazuntite.provider.live.services.scheduler.command.LoadClinicRoomByStationtIdSCCommand;
	import com.gazuntite.provider.live.services.scheduler.command.LoadPatientCompleteInfoCommand;
	import com.gazuntite.provider.live.services.scheduler.command.LoadProviderWorkingHoursCommand;
	import com.gazuntite.provider.live.services.scheduler.command.ManageAppointmentCommand;
	import com.gazuntite.provider.live.services.scheduler.command.ManageAppointmentRequestCommand;
	import com.gazuntite.provider.live.services.scheduler.command.SearchAppointmentsCommand;
	import com.gazuntite.provider.live.services.scheduler.command.SearchPatientCommand;

	public class SchedulerController extends FrontController
	{
		
		public static const LOAD_ALL_APPOINTMENT_TYPES_EVENT 							: String =	"LoadAllAppointmentTypesEvent";
		public static const LOAD_ALL_APPOINTMENT_REQUEST_STATUS_TYPES_EVENT 			: String =	"LoadAllAppointmentRequestStatusTypesEvent";
		public static const LOAD_ALL_APPOINTMENT_CURRENT_STATUS_TYPES_EVENT 			: String =	"LoadAllAppointmentCurrentStatusTypesEvent";
		public static const LOAD_ALL_SEARCH_FIELDS_TYPES_EVENT 							: String =	"LoadAllSearchFieldTypesEvent";
		public static const LOAD_ALL_PROVIDERS_BY_CLINIC_BRANCH_ID_EVENT 				: String =	"LoadAllProviderByClinicBranchIdEvent";
		public static const LOAD_ALL_STATIONS_BY_CLINIC_ID_EVENT 						: String =	"LoadAllStationsByClinicIdEvent";
		public static const LOAD_ALL_APPOINTMENT_BY_PROVIDERS_AND_STATIONS_ID_EVENT 	: String =	"LoadAllAppointmentsByProviderIdAndStationsIdEvent";
		public static const LOAD_PROVIDERS_WORKING_HOURS_EVENT 							: String =	"LoadProviderWorkingHoursEvent";
		public static const SEARCH_PATIENT_BY_CLINIC_ID_SEARCH_STRING_EVENT 			: String =	"SearchPatientbyClinicIdAndSearchStringEvent";
		public static const LOAD_PATIENT_COMPLETE_INFO_EVENT 							: String =	"LoadPatientCompleteInfoEvent";
		public static const SEARCH_APPOINTMENTS_EVENT 									: String =	"SearchAppointmentsEvent";
		public static const LOAD_APPOINTMENT_REQUEST_BY_PROVIDER_EVENT					: String =	"LoadAllAppointmentRequestByProviderEvent";
		public static const LOAD_CLINIC_ROOM_BY_STATION_ID_EVENT						: String =	"LoadClinicRoomByStationtIdEvent";
		public static const MANAGE_APPOINTMENTS_EVENT 									: String =	"ManageAppointmentEvent";
		public static const MANAGE_APPOINTMENT_REQUEST_EVENT							: String =	"ManageAppointmentRequestEvent";
		
		private static var m_oSchedulerController:SchedulerController ;
		
		public static function getInstance():SchedulerController 
		{
			if ( m_oSchedulerController == null )
				m_oSchedulerController = new SchedulerController(new Lock());
			return m_oSchedulerController;
		}
		
		public function SchedulerController(lock:Lock)
		{
			if(null == lock )
				throw("Can't create object. please use getInstance() method instead ... ")
				
			addCommand( LOAD_ALL_APPOINTMENT_TYPES_EVENT,                			LoadAllAppointmentTypesCommand );
			addCommand( LOAD_ALL_APPOINTMENT_REQUEST_STATUS_TYPES_EVENT, 			LoadAllAppointmentRequestStatusTypesCommand);
			addCommand( LOAD_ALL_APPOINTMENT_CURRENT_STATUS_TYPES_EVENT, 			LoadAllAppointmentCurrentStatusTypesCommand);
			addCommand( LOAD_ALL_SEARCH_FIELDS_TYPES_EVENT,             			LoadAllSearchFieldTypesCommand);
			addCommand( LOAD_ALL_PROVIDERS_BY_CLINIC_BRANCH_ID_EVENT,    			LoadAllProviderByClinicBranchIdCommand);
			addCommand( LOAD_ALL_STATIONS_BY_CLINIC_ID_EVENT,			 			LoadAllStationsByClinicIdCommand);
			addCommand( LOAD_ALL_APPOINTMENT_BY_PROVIDERS_AND_STATIONS_ID_EVENT, 	LoadAllAppointmentsByProviderIdAndStationsIdCommand);
			addCommand( LOAD_PROVIDERS_WORKING_HOURS_EVENT,							LoadProviderWorkingHoursCommand); 
			addCommand(SEARCH_PATIENT_BY_CLINIC_ID_SEARCH_STRING_EVENT, 			SearchPatientCommand);
			addCommand(LOAD_PATIENT_COMPLETE_INFO_EVENT,							LoadPatientCompleteInfoCommand);
			addCommand(SEARCH_APPOINTMENTS_EVENT,								    SearchAppointmentsCommand);
			addCommand(LOAD_APPOINTMENT_REQUEST_BY_PROVIDER_EVENT,					LoadAllAppointmentRequestByProviderCommand);
			addCommand(LOAD_CLINIC_ROOM_BY_STATION_ID_EVENT,					    LoadClinicRoomByStationtIdSCCommand);
			addCommand(MANAGE_APPOINTMENTS_EVENT,								    ManageAppointmentCommand);
			addCommand(MANAGE_APPOINTMENT_REQUEST_EVENT,							ManageAppointmentRequestCommand);
		}
	}
}
class Lock
{
	//Singlton Lock
}