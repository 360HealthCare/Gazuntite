package com.gazuntite.provider.search.services.patient.appController
{
	import com.adobe.cairngorm.control.FrontController;
	import com.gazuntite.provider.search.services.patient.command.SearchPatientbyClinicIdCommand;

	public class SearchPatientController extends FrontController
	{
		
		public static const SEARCH_PATIENT_BY_CLINIC_ID_EVENT : String =	"search_patient_by_clinic_id_event";
		
		private static var m_oControllerInstance:SearchPatientController ;
		
		public static function getInstance():SearchPatientController 
		{
			if ( m_oControllerInstance == null )
				m_oControllerInstance = new SearchPatientController(new Lock());
			return m_oControllerInstance;
		}

		public function SearchPatientController(lock:Lock)
		{
			if(null == lock )
				throw("Can't create object. please use getInstance() method instead ... ")
				
			addCommand( SEARCH_PATIENT_BY_CLINIC_ID_EVENT, SearchPatientbyClinicIdCommand );
		}
	}
	
}
class Lock
{
	//Singlton Lock
}