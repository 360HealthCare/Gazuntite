package com.gazuntite.history.controller
{
	import com.adobe.cairngorm.control.FrontController;
	import com.gazuntite.history.command.GetHistoryByProviderCommand;
	import com.gazuntite.history.command.GetPresprectionHistoryByProviderCommand;
	import com.gazuntite.history.command.GetProviderListCommand;
	import com.gazuntite.history.command.LoadPatientVisitsByPatientIdAndClinicIdCommand;
	
	public class HistoryController extends FrontController
	{
		/*public function HistoryController()
		{
			if ( HistoryController.m_oControllerInstance != null )
				throw new Error( "Only one HistoryModel instance should be instantiated" );
		}
		*/
		
		private static var m_oControllerInstance:HistoryController;
		
		
		public static const LIST_PATIENT_VISIT_PROVIDER						: String 		= "list patient visit provider";
		public static const HISTORY_LIST_BY_PROVIDER_ID						: String 		= "HISTORY_LIST_BY_PROVIDER_ID";
		public static const PRESPRECTION_HISTORY_LIST_BY_PROVIDER_ID						: String 		= "PRESPRECTION_HISTORY_LIST_BY_PROVIDER_ID";

		//Ayesha-- 12/7/2013
		public static const LOAD_PATIENT_VISITS_BY_PATIENTID_AND_CLINICID_EVENT:String = "LOAD_PATIENT_VISITS_BY_PATIENTID_AND_CLINICID_EVENT";
		
		public static function getInstance():HistoryController 
		{
			if ( m_oControllerInstance == null )
				m_oControllerInstance = new HistoryController(new Lock());
			return m_oControllerInstance;
		}
		
		public function HistoryController(lock:Lock) 
		{
			if(null == lock )
				throw("Can't create object. please use getInstance() method instead ... ")
			
			
			addCommand(LIST_PATIENT_VISIT_PROVIDER,GetProviderListCommand);
			addCommand(HISTORY_LIST_BY_PROVIDER_ID,GetHistoryByProviderCommand);
			addCommand(PRESPRECTION_HISTORY_LIST_BY_PROVIDER_ID,GetPresprectionHistoryByProviderCommand);
			addCommand(LOAD_PATIENT_VISITS_BY_PATIENTID_AND_CLINICID_EVENT, LoadPatientVisitsByPatientIdAndClinicIdCommand);
		}
	}
}

class Lock
{
	//Singlton Lock
}