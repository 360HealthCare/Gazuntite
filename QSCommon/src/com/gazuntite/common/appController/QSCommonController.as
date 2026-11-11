package com.gazuntite.common.appController
{
	import com.adobe.cairngorm.control.FrontController;
	import com.gazuntite.common.command.GetPatientGaxenIdCommand;
	import com.gazuntite.common.command.GetStateCityZipCodeCombineCommand;
	import com.gazuntite.common.command.LoadAllInsuranceCommand;
	import com.gazuntite.common.command.LoadAllUserTypeCommand;
	import com.gazuntite.common.command.LoadPatientMedCommand;
	import com.gazuntite.common.command.LoadPatientbyPatientIDCommand;
	import com.gazuntite.common.command.LoadPlaceOfServiceTypesCommand;
	import com.gazuntite.common.command.LoadStateCodesOnlyCommand;
	import com.gazuntite.common.command.ManagePatientVitalCommand;
	import com.gazuntite.common.command.MarkValidDataExistsCommand;
	import com.gazuntite.common.command.QSAllergyCommand;
	import com.gazuntite.common.command.SavePatientGaxenIdCommand;
	import com.gazuntite.common.command.SendErrorReportCommand;
	import com.gazuntite.common.command.ValidatePracticeKeyCommand;
	import com.gazuntite.common.command.VerifyUserEmailCommand;
	import com.gazuntite.common.command.comprehensive.LoadComhensiveHistoryStaticDataCommand;
	import com.gazuntite.common.command.provider.GetSpecialityCommand;
	import com.gazuntite.common.command.rapidAccess.LoadAllQuickLinksCommand;
	import com.gazuntite.common.command.visit.CreateVisitCommonCommand;
	import com.gazuntite.common.command.visit.GenerateSoapNotePreviewCommonCommand;
	import com.gazuntite.common.command.visit.LoadCPTMedicalTypesCommand;
	import com.gazuntite.common.command.visit.LoadDiagnosisICDCodeCommand;
	import com.gazuntite.common.command.visit.LoadEncounterTypesCommand;
	import com.gazuntite.common.command.visit.LoadPatientVisitCommand;
	import com.gazuntite.common.command.visit.ManageModuleNotesCommand;
	import com.gazuntite.common.util.QSConstants;
	import com.gazuntite.common.util.xml.XmlUtils;

	public class QSCommonController extends FrontController
	{
		public static const SEND_ERROR_REPORT_EVENT						: String 		= "SendErrorEmail";
		public static const LOAD_PATIENT_BY_PATIENT_ID_EVENT			: String 		= "LOAD_PATIENT_BY_PATIENT_ID_EVENT";
		public static const LOAD_PLACE_OF_SERVICE_TYPES_EVENT 			: String 		= "LoadPlaceOfServiceTypesEvent";
		public static const LOAD_ALL_INSURANCE_EVENT 					: String 		= "LoadAllInsuranceEvent";
		public static const GET_STATE_CITY_ZIP_CODE_COMBINE_EVENT 		: String 		= "GET_STATE_CITY_ZIP_CODE_COMBINE_EVENT";
		public static const QS_ALLERGY_EVENT 							: String 		= "QS_ALLERGY_EVENT";
		public static const LOAD_PATIENT_PRESCRIPTION					: String 		= "LOAD_PATIENT_PRESCRIPTION";
		public static const LOAD_PATIENT_HISTORY_MED					: String 		= "LOAD_PATIENT_HISTORY_MED";
		public static const SAVE_PATIENT_GAXENID_EVENT					: String 		= "SAVE_PATIENT_GAXENID_EVENT";
		public static const GET_PATIENT_GAXENID							: String 		= "GET_PATIENT_GAXENID";
		public static const LOAD_STATE_CODES_ONLY_EVENT					: String 		= "LOAD_STATE_CODES_ONLY_EVENT";
		public static const LOAD_PATIENT_VISIT_EVENT					: String 		= "LOAD_PATIENT_VISIT";
		
		public static const MANAGE_PATIENT_VITALS_EVENT : String =							"MANAGE_PATIENT_VITALS_EVENT";
		public static const CREATE_VISIT_EVENT						: String 		= "CREATE_VISIT";
		
		public static const ADD_PRESCRIBER							: String 		= "ADD_PRESCRIBER";
		
		public static const MARK_VALID_DATA_EXISTS_EVENT : String =							"MARK_VALID_DATA_EXISTS_EVENT";
		
		private static var m_oControllerInstance:QSCommonController;
		
		//------------------Comprehensive-----------------------------------//
		
		public static const COMHENSIVE_LOAD_HISTORY_STATIC_DATA:String = "LOAD_COMHENSIVE_HISTORY_STATIC_DATA";
		
		//------------------------------------------------------------------\\
		
		//----------------------Quick Input----------------------------------
		public static const LOAD_CPT_MEDICAL_TYPES_EVENT 		 : String = 				"LOAD_CPT_MEDICAL_TYPES_EVENT";
		public static const LOAD_ICD_CODE_EVENT 				 : String =					"LOAD_ICD_CODE_EVENT";
		public static const LOAD_ENCOUNTER_TYPES_EVENT 			 : String =					"LOAD_ENCOUNTER_TYPES_EVENT";
		public static const GENERATE_SOAP_NOTE_PREVIEW_COMMON_EVENT: String = "GENERATE_SOAP_NOTE_PREVIEW_COMMON_EVENT";
		//-------------------------------------------------------------------\\
		
		//----------------------Provider-------------------------------------
		public static const GET_SPECIALITY 				 		 : String =					"GET_SPECIALITY";
		//-------------------------------------------------------------------\\
		
		public static const LOAD_ALL_USER_TYPE_EVENT 					: String 		= "LOAD_ALL_USER_TYPE_EVENT";
		public static const VERIFY_USER_EMAIL_EVENT 					: String 		= "VERIFY_USER_EMAIL_EVENT";
		public static const VALIDATE_PRACTICE_KEY 						: String 		= "VALIDATE_PRACTICE_KEY";
		
		public static const MANAGE_MODULE_NOTES_BY_VISIT_ID_EVENT 		: String 		= "MANAGE_MODULE_NOTES_BY_VISIT_ID_EVENT";
		public static var LOAD_ALL_QUICK_LINKS:String 						= "LOAD_ALL_QUICK_LINKS";
		
		public static function getInstance():QSCommonController 
		{
			if ( m_oControllerInstance == null )
				m_oControllerInstance = new QSCommonController( new Lock() );
			return m_oControllerInstance;
		}
		
		
		public function QSCommonController(lock:Lock) 
		{
			if(null == lock )
				throw("Can't create object. please use getInstance() method instead ... ")
			
			
			addCommand(SEND_ERROR_REPORT_EVENT,SendErrorReportCommand);
			addCommand(LOAD_PATIENT_BY_PATIENT_ID_EVENT, LoadPatientbyPatientIDCommand);
			addCommand(LOAD_PLACE_OF_SERVICE_TYPES_EVENT, LoadPlaceOfServiceTypesCommand);
			addCommand(LOAD_ALL_INSURANCE_EVENT, LoadAllInsuranceCommand );
			addCommand(GET_STATE_CITY_ZIP_CODE_COMBINE_EVENT, GetStateCityZipCodeCombineCommand );
			addCommand(QS_ALLERGY_EVENT, QSAllergyCommand );
			addCommand(LOAD_PATIENT_PRESCRIPTION, LoadPatientMedCommand );
			addCommand(SAVE_PATIENT_GAXENID_EVENT, SavePatientGaxenIdCommand );
			addCommand(GET_PATIENT_GAXENID, GetPatientGaxenIdCommand );
			addCommand(LOAD_STATE_CODES_ONLY_EVENT, LoadStateCodesOnlyCommand);
			
			addCommand(MANAGE_PATIENT_VITALS_EVENT , ManagePatientVitalCommand);
			addCommand(CREATE_VISIT_EVENT, CreateVisitCommonCommand);
			addCommand(LOAD_PATIENT_VISIT_EVENT, LoadPatientVisitCommand);
			
			//------------------Comprehensive-----------------------------------//
			
			addCommand(COMHENSIVE_LOAD_HISTORY_STATIC_DATA,LoadComhensiveHistoryStaticDataCommand);
			
			//------------------------------------------------------------------\\
			
			addCommand(LOAD_CPT_MEDICAL_TYPES_EVENT, LoadCPTMedicalTypesCommand );
			addCommand(LOAD_ICD_CODE_EVENT , LoadDiagnosisICDCodeCommand);
			addCommand(LOAD_ENCOUNTER_TYPES_EVENT , LoadEncounterTypesCommand);
			
			addCommand(GENERATE_SOAP_NOTE_PREVIEW_COMMON_EVENT, GenerateSoapNotePreviewCommonCommand);
			
			//----------------------Provider-------------------------------------
			addCommand(GET_SPECIALITY,GetSpecialityCommand);
			//-------------------------------------------------------------------\\
			
			addCommand(LOAD_ALL_USER_TYPE_EVENT,LoadAllUserTypeCommand);
			addCommand(VERIFY_USER_EMAIL_EVENT,VerifyUserEmailCommand);
			addCommand(VALIDATE_PRACTICE_KEY,ValidatePracticeKeyCommand);
									
			addCommand(MARK_VALID_DATA_EXISTS_EVENT,MarkValidDataExistsCommand);
			

			addCommand(MANAGE_MODULE_NOTES_BY_VISIT_ID_EVENT , ManageModuleNotesCommand);
			addCommand( LOAD_ALL_QUICK_LINKS, LoadAllQuickLinksCommand );
		}
		
		public function ApplicationConfig(configXML:XML ):void
		{
			QSConstants.BILLING_RESTFULL_SERVICE_BASE_URL 		= XmlUtils.getPropertyValueByName( 'BILLING_RESTFUL_SERVICE', configXML );
			QSConstants.BILLING_RESTFULL_SERVICE_BASE_URL 		= XmlUtils.getPropertyValueByName( 'BILLING_RESTFUL_SERVICE', configXML );
			QSConstants.RESTFULL_ADRESSBOOK_SERVICE_BASE_URL 	= XmlUtils.getPropertyValueByName( 'EPRESCRIPTION_ADRESSBOOK_SERVICE', configXML );
			QSConstants.RESTFULL_SERVICE_BASE_URL 				= XmlUtils.getPropertyValueByName( 'EPRESCRIPTION_RESTFULSERVICE', configXML );
			QSConstants.EPRESCRIPTION_USER_SERVICE 				= XmlUtils.getPropertyValueByName( 'EPRESCRIPTION_USER_SERVICE', configXML );
			QSConstants.RESTFULL_PROVIDER_SERVICE_BASE_URL		= XmlUtils.getPropertyValueByName( 'EPRESCRIPTION_PROVIDER_SERVICE', configXML );
			QSConstants.EPRESCRIPTION_QM_SERVICE				= XmlUtils.getPropertyValueByName( 'EPRESCRIPTION_QM_SERVICE', configXML );
		}
	}
	
	
}
class Lock
{
	//Singlton Lock
}