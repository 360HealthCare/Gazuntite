package com.gazuntite.provider.live.services.billing.appController
{
	import com.adobe.cairngorm.control.FrontController;
	import com.gazuntite.provider.live.services.billing.superBill.command.LoadAllPendingBillsbyProviderIdCommand;
	import com.gazuntite.provider.live.services.billing.superBill.command.LoadCPTModifierTypesCommand;
	import com.gazuntite.provider.live.services.billing.superBill.command.LoadENMCodeTypesCommand;
	import com.gazuntite.provider.live.services.billing.superBill.command.LoadFrequencyCodeTypesCommand;
	import com.gazuntite.provider.live.services.billing.superBill.command.ManagePendingBillProceduresCommand;
	import com.gazuntite.provider.live.services.billing.superBill.command.SaveSuperBillCommand;

	public class BillingController extends FrontController
	{
		private static var m_oBillingController:BillingController ;
		
		public static function getInstance():BillingController 
		{
			if ( m_oBillingController == null )
				m_oBillingController = new BillingController(new Lock());
			return m_oBillingController;
		}
		
		public function BillingController(lock:Lock)
		{
			if(null == lock )
				throw("Can't create object. please use getInstance() method instead ... ")
				
			
			//Super Bill
			//---------------
			//addCommand( LOAD_STATE_CODE_EVENT, LoadStateCodesCommand );
			addCommand( LOAD_FREQUENCY_CODE_TYPES_EVENT, LoadFrequencyCodeTypesCommand );
			addCommand( SAVE_SUPER_BILL_EVENT, SaveSuperBillCommand );
			addCommand( LOAD_ENM_CODE_TYPES_EVENT, LoadENMCodeTypesCommand );
			//addCommand( LOAD_ENCOUNTER_TYPES_EVENT, LoadEncounterTypesCommand );
			//addCommand( LOAD_CPT_MEDICAL_TYPES_EVENT, LoadCPTMedicalTypesCommand );
			//addCommand( LOAD_ICD_CODE_TYPES_EVENT, LoadICDCodeTypesCommand );
			addCommand( MANAGE_PENDING_BILL_PROCEDURES_EVENT, ManagePendingBillProceduresCommand );
			addCommand( LOAD_CPT_MODIFIER_TYPES_EVENT, LoadCPTModifierTypesCommand );
			addCommand( LOAD_ALL_PENDING_BILLS_BY_PROVIDER_ID_EVENT, LoadAllPendingBillsbyProviderIdCommand );
			//____________________________________________________________________________
				
		}
		
		//Super Bill
		//---------------	
		public static const LOAD_STATE_CODE_EVENT : String 					=	"LoadStateCodeEvent";
		public static const LOAD_FREQUENCY_CODE_TYPES_EVENT : String 		=	"LoadFrequencyCodeTypesEvent";
		public static const SAVE_SUPER_BILL_EVENT : String 					=	"SaveSuperBillEvent";
		public static const LOAD_ENM_CODE_TYPES_EVENT : String 				=	"LoadENMCodeTypesEvent";
		public static const LOAD_ICD_CODE_TYPES_EVENT : String 				=	"LoadICDCodeTypesEvent";
		public static const MANAGE_PENDING_BILL_PROCEDURES_EVENT : String	=	"ManagePendingBillProceduresEvent";
		public static const LOAD_CPT_MODIFIER_TYPES_EVENT : String 			=	"LoadCPTModifierTypesEvent";
		public static const LOAD_ALL_PENDING_BILLS_BY_PROVIDER_ID_EVENT : String =	"LoadAllPendingBillsByProviderIdEvent";
	}
}
class Lock
{
	//Singlton Lock
}