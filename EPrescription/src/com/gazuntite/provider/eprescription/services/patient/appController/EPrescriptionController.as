package com.gazuntite.provider.eprescription.services.patient.appController
{
	import com.adobe.cairngorm.control.FrontController;
	import com.gazuntite.provider.eprescription.services.patient.command.DeleteOutBoxCommand;
	import com.gazuntite.provider.eprescription.services.patient.command.DeletePatientMedCommand;
	import com.gazuntite.provider.eprescription.services.patient.command.GetAddressBookByPartyRegGuidCommand;
	import com.gazuntite.provider.eprescription.services.patient.command.GetDenialCodesCommand;
	import com.gazuntite.provider.eprescription.services.patient.command.GetMedicationsCommand;
	import com.gazuntite.provider.eprescription.services.patient.command.GetNDCByDRUGIDProductIDCommand;
	import com.gazuntite.provider.eprescription.services.patient.command.GetOutboxCommand;
	import com.gazuntite.provider.eprescription.services.patient.command.GetPatientPharmCommand;
	import com.gazuntite.provider.eprescription.services.patient.command.GetPendingRefillsCommand;
	import com.gazuntite.provider.eprescription.services.patient.command.GetProductByDrugIDCommand;
	import com.gazuntite.provider.eprescription.services.patient.command.GetStrengthByGenericProductIDCommand;
	import com.gazuntite.provider.eprescription.services.patient.command.LoadClinicUsersBasicInfoCommand;
	import com.gazuntite.provider.eprescription.services.patient.command.LoadPatientInsuancePatientIdCommand;
	import com.gazuntite.provider.eprescription.services.patient.command.LoadPrescriberbyGaxenIDCommand;
	import com.gazuntite.provider.eprescription.services.patient.command.LoadStaticDataCommand;
	import com.gazuntite.provider.eprescription.services.patient.command.ManagePatientFavPharmCommand;
	import com.gazuntite.provider.eprescription.services.patient.command.PendingRefillResponseCommand;
	import com.gazuntite.provider.eprescription.services.patient.command.RemoveFavoritePharmacyCommand;
	import com.gazuntite.provider.eprescription.services.patient.command.SaveAddressCommand;
	import com.gazuntite.provider.eprescription.services.patient.command.SaveNewRXCommand;
	import com.gazuntite.provider.eprescription.services.patient.command.SearchDrugbyGNameCommand;
	import com.gazuntite.provider.eprescription.services.patient.command.SearchPharmaciesCommand;
	import com.gazuntite.provider.eprescription.services.patient.command.SendOutboxCommand;
	import com.gazuntite.provider.eprescription.services.patient.command.UpdateGaxenIDCommand;
	import com.gazuntite.provider.eprescription.services.patient.command.UpdateSubscribedUserCommand;
	import com.gazuntite.provider.eprescription.services.patient.command.UpdateUserCommand;
	import com.gazuntite.provider.eprescription.services.patient.command.UpdateUserPasswordbyPostCommand;
	import com.gazuntite.provider.eprescription.services.patient.command.billing.GetProviderInsuranceCommand;
	import com.gazuntite.provider.eprescription.services.patient.command.billing.ManageProviderInsuranceCommand;
	import com.gazuntite.provider.eprescription.services.patient.command.loadServicelevelsCommand;
	import com.gazuntite.provider.eprescription.services.patient.command.rx.GetPatientHistoryMedCommand;
	
	public class EPrescriptionController extends FrontController
	{
		public static const GET_PROVIDER_INSURANCE_EVENT 		: String 		= "GetProviderInsuranceEvent";
		public static const MANAGE_PROVIDER_INSURANCE_EVENT 	: String 		= "ManageProviderInsuranceEvent";
		public static const SUBSCRIBE_PATIENT_EVENT 			: String 		= "SUBSCRIBE_PATIENT_EVENT";
		public static const SAVE_QUIVUS_MANAGER 				: String 		= "SAVE_QUIVUS_MANAGER";
		public static const LOAD_CLINIC_USERS_BASIC_INFO		: String 		= "LOAD_CLINIC_USERS_BASIC_INFO";
		public static const LOAD_PHARMACY_INFO					: String 		= "LOAD_PHARMACY_INFO";
		public static const LOAD_PRESCRIBER						: String 		= "LOAD_PRESCRIBER";
		public static const LOAD_SERVICE_LEVELS					: String 		= "LOAD_SERVICE_LEVELS";
		public static const GET_PENDING_REFILLS					: String 		= "GET_PENDING_REFILLS";
		public static const SAVE_GAXEN_ID						: String 		= "SAVE_GAXEN_ID";
		public static const CHANGE_PASSWORD						: String 		= "CHANGE_PASSWORD";
		public static const GET_RX_STATIC_DATA					: String 		= "GET_RX_STATIC_DATA";
		public static const MEDICINE_SEARCH						: String 		= "MEDICINE_SEARCH";
		public static const PATIENT_ADDRESS						: String 		= "PATIENT_ADDRESS";
		public static const MEDICINE_PRODUCT_SEARCH				: String 		= "MEDICINE_PRODUCT_SEARCH";
		public static const MEDICINE_STRENGTH					: String 		= "MEDICINE_STRENGTH";
		public static const GET_NDC_BY_DRUG_ID_PRODUCT_ID_EVENT	: String 		= "GET_NDC_BY_DRUG_ID_PRODUCT_ID_EVENT";
		public static const MANAGE_PATIENT_FAV_PHARM 			: String 		= "MANAGE_PATIENT_FAV_PHARM";
		public static const GET_FAVORITE_PHARMACY				: String 		= "GET_FAVORITE_PHARMACY";
		public static const REMOVE_FAVORITE_PHARMACY			: String 		= "REMOVE_FAVORITE_PHARMACY";
		public static const SAVE_NEW_RX 						: String 		= "SAVE_NEW_RX";
		public static const GET_OUTBOX							: String 		= "GET_OUTBOX";
		//[08/06/2013] Shahid Munir, event moved to common
		//public static const GET_SPECIALITY						: String 		= "GET_SPECIALITY";
		public static const REMOVE_OUTBOX						: String 		= "REMOVE_OUTBOX";
		public static const REMOVE_PATIENT_MED					: String 		= "REMOVE_PATIENT_MED";
		public static const SEND_OUTBOX							: String 		= "SEND_OUTBOX";
		public static const GET_INSURANCE						: String 		= "GET_INSURANCE";
		public static const SAVE_ADDRESS 						: String 		= "SAVE_ADDRESS";
		public static const PENDING_REFILL_RESPONSE				: String 		= "PENDING_REFILL_RESPONSE";
		public static const GET_DENIAL_CODES					: String 		= "GET_DENIAL_CODES";
		public static const GET_MEDICATIONS						: String 		= "GET_MEDICATIONS";
		public static const GET_PATIENT_HISTORY_MED				: String		= "GET_PATIENT_HISTORY_MED";
		//public static const MARK_VALID_DATA_EXISTS_EVENT : String =							"MARK_VALID_DATA_EXISTS_EVENT";
		
		private static var m_oEPrescriptionController:EPrescriptionController ;
		
		public static function getInstance():EPrescriptionController 
		{
			if ( m_oEPrescriptionController == null )
				m_oEPrescriptionController = new EPrescriptionController(new Lock());
			return m_oEPrescriptionController;
		}
		
		public function EPrescriptionController(lock:Lock)
		{
			if(null == lock )
				throw("Can't create object. please use getInstance() method instead ... ")
			//_______________________Billing Detail_____________________________________________________________
			
			addCommand(EPrescriptionController.GET_PROVIDER_INSURANCE_EVENT, GetProviderInsuranceCommand);	
			addCommand(EPrescriptionController.MANAGE_PROVIDER_INSURANCE_EVENT, ManageProviderInsuranceCommand);
			//__________________________________________________________________________________________________
			
			addCommand( EPrescriptionController.LOAD_CLINIC_USERS_BASIC_INFO,  LoadClinicUsersBasicInfoCommand);
			// Added by Jawad for ePrescription subsribe patient..
			addCommand(EPrescriptionController.SUBSCRIBE_PATIENT_EVENT, UpdateSubscribedUserCommand); 
			// end subscribe patient
			addCommand(EPrescriptionController.LOAD_PRESCRIBER, LoadPrescriberbyGaxenIDCommand);
			addCommand(EPrescriptionController.LOAD_PHARMACY_INFO, SearchPharmaciesCommand); 
			addCommand(EPrescriptionController.LOAD_SERVICE_LEVELS, loadServicelevelsCommand);
			addCommand(EPrescriptionController.GET_PENDING_REFILLS, GetPendingRefillsCommand);
			addCommand(EPrescriptionController.SAVE_GAXEN_ID, UpdateGaxenIDCommand);
			addCommand(EPrescriptionController.CHANGE_PASSWORD, UpdateUserPasswordbyPostCommand);
			addCommand(EPrescriptionController.SAVE_QUIVUS_MANAGER, UpdateUserCommand); 
			addCommand(EPrescriptionController.GET_RX_STATIC_DATA, LoadStaticDataCommand);
			addCommand(EPrescriptionController.MEDICINE_SEARCH, SearchDrugbyGNameCommand);
			addCommand(EPrescriptionController.PATIENT_ADDRESS, GetAddressBookByPartyRegGuidCommand);
			addCommand(EPrescriptionController.MEDICINE_STRENGTH, GetStrengthByGenericProductIDCommand);
			addCommand(EPrescriptionController.MEDICINE_PRODUCT_SEARCH, GetProductByDrugIDCommand);
			addCommand(EPrescriptionController.GET_NDC_BY_DRUG_ID_PRODUCT_ID_EVENT, GetNDCByDRUGIDProductIDCommand);
			addCommand(EPrescriptionController.MANAGE_PATIENT_FAV_PHARM, ManagePatientFavPharmCommand);
			addCommand(EPrescriptionController.GET_FAVORITE_PHARMACY, GetPatientPharmCommand);
			addCommand(EPrescriptionController.REMOVE_FAVORITE_PHARMACY, RemoveFavoritePharmacyCommand);
			addCommand(EPrescriptionController.SAVE_NEW_RX, SaveNewRXCommand);
			addCommand(EPrescriptionController.GET_OUTBOX, GetOutboxCommand);
			//[08/06/2013] Shahid Munir, event moved to common
			//addCommand(EPrescriptionController.GET_SPECIALITY, GetSpecialityCommand);
			addCommand(EPrescriptionController.REMOVE_OUTBOX, DeleteOutBoxCommand);
			addCommand(EPrescriptionController.REMOVE_PATIENT_MED, DeletePatientMedCommand);
			addCommand(EPrescriptionController.SEND_OUTBOX, SendOutboxCommand);
			addCommand(EPrescriptionController.GET_INSURANCE, LoadPatientInsuancePatientIdCommand);
			addCommand(EPrescriptionController.SAVE_ADDRESS, SaveAddressCommand);
			addCommand(EPrescriptionController.PENDING_REFILL_RESPONSE, PendingRefillResponseCommand);
			addCommand(EPrescriptionController.GET_DENIAL_CODES, GetDenialCodesCommand);
			addCommand(EPrescriptionController.GET_MEDICATIONS, GetMedicationsCommand);
			addCommand(EPrescriptionController.GET_PATIENT_HISTORY_MED, GetPatientHistoryMedCommand);
			
			//addCommand(MARK_VALID_DATA_EXISTS_EVENT , MarkValidDataExistCommand);
		}
	}
}
class Lock
{
	//Singlton Lock
}