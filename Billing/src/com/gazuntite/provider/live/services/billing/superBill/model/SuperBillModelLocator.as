package com.gazuntite.provider.live.services.billing.superBill.model
{
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.adobe.cairngorm.model.ModelLocator;
	import com.gazuntite.common.event.LoadPlaceOfServiceTypesEvent;
	import com.gazuntite.common.event.visit.LoadEncounterTypesEvent;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.provider.live.services.billing.superBill.dto.CMS1500DTO;
	import com.gazuntite.provider.live.services.billing.superBill.dto.PendingBillsDTO;
	import com.gazuntite.provider.live.services.billing.superBill.event.LoadCPTModifierTypesEvent;
	import com.gazuntite.provider.live.services.billing.superBill.event.LoadENMCodeTypesEvent;
	import com.gazuntite.provider.live.services.billing.superBill.util.SuperBillConstants;
	
	import mx.collections.ArrayCollection;
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.utils.ObjectProxy;

	[Bindable]
	public class SuperBillModelLocator implements ModelLocator 
	{
		private var logger:ILogger = Log.getLogger("com.gazuntite.provider.live.services.billing.superBill.model.SuperBillModelLocator");
		
		private static var model 	:SuperBillModelLocator;
			

		public function SuperBillModelLocator() : void 
		{
			if ( model != null )
				throw new Error( "Only one SuperBillModelLocator instance should be instantiated" );
		}		
		
		public static function getInstance() : SuperBillModelLocator
		{
			if ( model == null )
				model = new SuperBillModelLocator();
			return model;
		}
		
		private var _isFromPendingBills:Boolean = false;
				
		public function get isFromPendingBills():Boolean
		{
			return _isFromPendingBills;
		}
		
		public function set isFromPendingBills(value:Boolean):void
		{
			_isFromPendingBills = value;
		}
		
		private var _canSaveSupderBill:Boolean = false;

		public function get canSaveSupderBill():Boolean
		{
			return _canSaveSupderBill;
		}

		public function set canSaveSupderBill(value:Boolean):void
		{
			_canSaveSupderBill = value;
		}

		private var _isSupderBillUpdated:Boolean = false;

		public function get isSupderBillUpdated():Boolean
		{
			return _isSupderBillUpdated;
		}

		public function set isSupderBillUpdated(value:Boolean):void
		{
			_isSupderBillUpdated = value;
		}

		/*private var _isENMCodeUsed:Boolean = false;

		public function get isENMCodeUsed():Boolean
		{
			return _isENMCodeUsed;
		}

		public function set isENMCodeUsed(value:Boolean):void
		{
			_isENMCodeUsed = value;
		}*/

		private var _ENMUsedCharges:Number = 0.00;

		public function get ENMUsedCharges():Number
		{
			return _ENMUsedCharges;
		}

		public function set ENMUsedCharges(value:Number):void
		{
			_ENMUsedCharges = value;
		}

		
		//_____________________ Procedure _______________________________
		public var procedureDTOList						:ArrayCollection; 
		public var CptMedicalTypeDTOList				:ArrayCollection; 
						
		//___________________Diagnosis___________________________________
		
		public var icdCodeDTOList						:ArrayCollection; 
		public var diagnosisDTOList						:ArrayCollection;
		
		//_____________________Pending Bills_____________________________
		
		private var _PendingBills						:ArrayCollection;

		public function get PendingBills():ArrayCollection
		{
			return _PendingBills;
		}

		public function set PendingBills(value:ArrayCollection):void
		{
			_PendingBills = value;
		}

		private var _VisitSuperBill:PendingBillsDTO;
		public function get VisitSuperBill():PendingBillsDTO
		{
			return _VisitSuperBill;
		}
		
		public function set VisitSuperBill(value:PendingBillsDTO):void
		{
			_VisitSuperBill = value;
		}
		
		//________________Modifiers_______________________________________
		
		private var m_oCPTModifierTypeList1:ArrayCollection;
		
		public function get CPTModifierTypeList1():ArrayCollection
		{
			return m_oCPTModifierTypeList1;
		}
		
		public function set CPTModifierTypeList1(value:ArrayCollection):void
		{
			m_oCPTModifierTypeList1 = value;
		}
		
		private var m_oCPTModifierTypeList2:ArrayCollection;
		
		public function get CPTModifierTypeList2():ArrayCollection
		{
			return m_oCPTModifierTypeList2;
		}
		
		public function set CPTModifierTypeList2(value:ArrayCollection):void
		{
			m_oCPTModifierTypeList2 = value;
		}
		
		private var m_oCPTModifierTypeList3:ArrayCollection;
		
		public function get CPTModifierTypeList3():ArrayCollection
		{
			return m_oCPTModifierTypeList3;
		}
		
		public function set CPTModifierTypeList3(value:ArrayCollection):void
		{
			m_oCPTModifierTypeList3 = value;
		}
		
		private var _CPTModifierTypeList4:ArrayCollection;

		public function get CPTModifierTypeList4():ArrayCollection
		{
			return _CPTModifierTypeList4;
		}

		public function set CPTModifierTypeList4(value:ArrayCollection):void
		{
			_CPTModifierTypeList4 = value;
		}

				
		//___________________Encounter Info________________________________
		
		private var _PlaceOfServiceTypeList:ArrayCollection;

		public function get PlaceOfServiceTypeList():ArrayCollection
		{
			return _PlaceOfServiceTypeList;
		}

		public function set PlaceOfServiceTypeList(value:ArrayCollection):void
		{
			_PlaceOfServiceTypeList = value;
		}

		private var _EncounterTypeList:ArrayCollection;

		public function get EncounterTypeList():ArrayCollection
		{
			return _EncounterTypeList;
		}

		public function set EncounterTypeList(value:ArrayCollection):void
		{
			_EncounterTypeList = value;
		}
		
		//___________________EnM________________________________
		
		private var _CurrentHistoryLevelScale:String;
		
		public function get CurrentHistoryLevelScale():String
		{
			return _CurrentHistoryLevelScale;
		}

		public function set CurrentHistoryLevelScale(value:String):void
		{
			_CurrentHistoryLevelScale = value;
		}

		private var _CurrentExaminationLevelScale:String;

		public function get CurrentExaminationLevelScale():String
		{
			return _CurrentExaminationLevelScale;
		}

		public function set CurrentExaminationLevelScale(value:String):void
		{
			_CurrentExaminationLevelScale = value;
		}

		private var _CurrentDecisionLevelScale:String;

		public function get CurrentDecisionLevelScale():String
		{
			return _CurrentDecisionLevelScale;
		}

		public function set CurrentDecisionLevelScale(value:String):void
		{
			_CurrentDecisionLevelScale = value;
		}
		
		private var _ENMSuggestedCodeList:ArrayCollection;

		public function get ENMSuggestedCodeList():ArrayCollection
		{
			return _ENMSuggestedCodeList;
		}

		public function set ENMSuggestedCodeList(value:ArrayCollection):void
		{
			_ENMSuggestedCodeList = value;
		}

		private var _CurrentENMServiceInfo:ArrayCollection;
		public function get CurrentENMServiceInfo():ArrayCollection
		{
			return _CurrentENMServiceInfo;
		}

		public function set CurrentENMServiceInfo(value:ArrayCollection):void
		{
			_CurrentENMServiceInfo = value;
		}


		private var _VisitID:int;
		private var _VisitProviderID:int;

		public function get VisitProviderID():int
		{
			return _VisitProviderID;
		}

		public function set VisitProviderID(value:int):void
		{
			_VisitProviderID = value;
		}


		public function get VisitID():int
		{
			return _VisitID;
		}

		public function set VisitID(value:int):void
		{
			_VisitID = value;
		}
		
		//___________________superbill calculations________________________________
		
		public function CalculateSuperBill():void
		{
			if(TotalCharges > 0 &&  Number(model.ReceivedCopay.replace("%","")) == model.Copay && model.IsPercentCopay == true)
			{
				var perCopay:Number = (Copay / TotalCharges) * 100;
				PatientBalance = TotalCharges - ( perCopay + PrimaryResponsibility + 
					SecondaryResponsibility + BillingDisallowed + 
					AdditionalPayment  + WriteOff )
			}
			else
				PatientBalance = TotalCharges - ( Copay + PrimaryResponsibility + 
					SecondaryResponsibility + BillingDisallowed + 
					AdditionalPayment  + WriteOff )
		}
		
		private var _CMS1500Info:CMS1500DTO;

		public function get CMS1500Info():CMS1500DTO
		{
			return _CMS1500Info;
		}

		public function set CMS1500Info(value:CMS1500DTO):void
		{
			_CMS1500Info = value;
		}

		public var CMS1500StateCodeIndex:int = -1;
		private var _StateCodeList:ArrayCollection;

		public function get StateCodeList():ArrayCollection
		{
			return _StateCodeList;
		}

		public function set StateCodeList(value:ArrayCollection):void
		{
			_StateCodeList = value;
		}

		
		private var m_sSuperBillWriteOff:Number
		
		public function get WriteOff():Number
		{
			return m_sSuperBillWriteOff;
		}			
		
		public function set WriteOff(value:Number):void
		{
			m_sSuperBillWriteOff = value;
		}
		
		private var m_sSuperBillAdditionalPayment:Number
		
		public function get AdditionalPayment():Number
		{
			return m_sSuperBillAdditionalPayment;
		}			
		
		public function set AdditionalPayment(value:Number):void
		{
			m_sSuperBillAdditionalPayment = value;
		}
		
		private var m_sSuperBillDisallowed:Number
		
		public function get BillingDisallowed():Number
		{
			return m_sSuperBillDisallowed;
		}			
		
		public function set BillingDisallowed(value:Number):void
		{
			m_sSuperBillDisallowed = value;
		}
		
		private var m_sSuperBillSecInsResp:Number
		
		public function get SecondaryResponsibility():Number
		{
			return m_sSuperBillSecInsResp;
		}			
		
		public function set SecondaryResponsibility(value:Number):void
		{
			m_sSuperBillSecInsResp = value;
		}
		
		private var m_sSuperBillPriInsResp:Number
		
		public function get PrimaryResponsibility():Number
		{
			return m_sSuperBillPriInsResp;
		}			
		
		public function set PrimaryResponsibility(value:Number):void
		{
			m_sSuperBillPriInsResp = value;
		}
		
		private var m_sSuperBillPatientbalance:Number = 0.0;
		
		public function get PatientBalance():Number
		{
			return m_sSuperBillPatientbalance;
		}			
		
		public function set PatientBalance(value:Number):void
		{
			m_sSuperBillPatientbalance = value;
		}
		
		private var m_sUpdatedCopay:Number
		
		public function get UpdatedCopay():Number
		{
			return m_sUpdatedCopay;
		}			
		
		public function set UpdatedCopay(value:Number):void
		{
			m_sUpdatedCopay = value;
		}
		
		private var m_sReceivedCopay:String
		
		public function get ReceivedCopay():String
		{
			return m_sReceivedCopay;
		}			
		
		public function set ReceivedCopay(value:String):void
		{
			m_sReceivedCopay = value;
		}
		
		private var m_sSuperBillDisplayCopay:String
		
		public function get DisplayCopay():String
		{
			return m_sSuperBillDisplayCopay;
		}			
		
		public function set DisplayCopay(value:String):void
		{
			m_sSuperBillDisplayCopay = value;
		}
		
		private var m_sSuperBillCopay:Number
		
		public function get Copay():Number
		{
			return m_sSuperBillCopay;
		}			
		
		public function set Copay(value:Number):void
		{
			m_sSuperBillCopay = value;
		}
		
		private var m_bPercentCopay:Boolean
		
		public function get IsPercentCopay():Boolean
		{
			return m_bPercentCopay;
		}			
		
		public function set IsPercentCopay(value:Boolean):void
		{
			m_bPercentCopay = value;
		}
		
		private var m_sSuperBillTotalcharges:Number
		
		
		public function get TotalCharges():Number
		{
			return m_sSuperBillTotalcharges;
		}			
		
		public function set TotalCharges(value:Number):void
		{
			m_sSuperBillTotalcharges = value;
		}		
		
		private var _TotalProcedureCharges:Number;

		public function get TotalProcedureCharges():Number
		{
			return _TotalProcedureCharges;
		}

		public function set TotalProcedureCharges(value:Number):void
		{
			_TotalProcedureCharges = value;
		}

		
		private var m_sSuperBillPaymentMode:String
		
		
		public function get ModeOfPayment():String
		{
			return m_sSuperBillPaymentMode;
		}			
		
		public function set ModeOfPayment(value:String):void
		{
			m_sSuperBillPaymentMode = value;
		}
		
		private var m_aWRService:ArrayCollection;
		
		public function get CurrentWRServices():ArrayCollection
		{
			return m_aWRService;
		}
		public function set CurrentWRServices(value:ArrayCollection):void
		{
			m_aWRService = value;
		}
		
		private var _CurrentPOSCode:String;

		public function get CurrentPOSCode():String
		{
			return _CurrentPOSCode;
		}

		public function set CurrentPOSCode(value:String):void
		{
			_CurrentPOSCode = value;
		}

		
		//___________________common result________________________________
		
		private var m_bResult:Boolean;
		
		
		public function get Result():Boolean
		{
			return m_bResult;
		}
		
		public function set Result(value:Boolean):void
		{
			m_bResult = value;
		}
		
		public function updateModel(loggedInUserId:int, loggedInUserProviderId:int, loggedInUserProviderTypeId:int, loggedInUserSelectedBranchId:int, userSelectedPracticeName:String, stationName:String, stationId:int, authentication:ObjectProxy, IsloggedInUserProvider:Boolean, loggedInUserSessionID:String):void
		{
			
			//this.LoggedInUserProviderId				= loggedInUserId;			
			
			this.LoggedInUserId						= loggedInUserId;			
			this.LoggedInUserProviderTypeId			= loggedInUserProviderTypeId;
			this.LoggedInUserSelectedBranchId		= loggedInUserSelectedBranchId;
			this.LoggedInUserSelectedPracticeName	= userSelectedPracticeName; 
			this.LoggedInUserSelectedStationName 	= stationName; 
			this.LoggedInUserSessionID				= loggedInUserSessionID;
		}
		
		public function resetModel():void
		{
			this.LoggedInUserId						= undefined;
			this.LoggedInUserProviderId				= undefined;
			this.LoggedInUserProviderTypeId			= undefined;
			this.LoggedInUserSelectedBranchId		= undefined;
			this.LoggedInUserSelectedPracticeName	= undefined; 
			this.LoggedInUserSelectedStationName 	= undefined; 
			
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
		
		public function get LoggedInUserSessionID():String
		{
			return _LoggedInUserSessionID;
		}
		
		public function set LoggedInUserSessionID(value:String):void
		{
			_LoggedInUserSessionID = value;
		}
		
		public function get LoggedInUserSelectedStationName():String
		{
			return m_sStationName;
		}
		
		public function set LoggedInUserSelectedStationName(value:String):void
		{
			m_sStationName = value;
		}
		
		//########################### super bill static data ##########################
		
		public function loadSuperBillStaticData():void
		{	
			//loadVisitBill();
			loadPlaceOServiceTypes();
			loadCPTModifiers();
			loadEncounterTypes();
			LoadENMTypeList();
		}
		
		/*private function loadVisitBill():void
		{
			//temporary visit id
			//var pbe:LoadAllPendingBillsbyProviderIdEvent = new LoadAllPendingBillsbyProviderIdEvent(0,model.LoggedInUserSelectedBranchId,8,String(8317)); //new super bill
			//var pbe:LoadAllPendingBillsbyProviderIdEvent = new LoadAllPendingBillsbyProviderIdEvent(0,model.LoggedInUserSelectedBranchId,8,String(8940)); //saved superbill
			var pbe:LoadAllPendingBillsbyProviderIdEvent = new LoadAllPendingBillsbyProviderIdEvent(0,model.LoggedInUserSelectedBranchId,8,String(VisitID));
			CairngormEventDispatcher.getInstance().dispatchEvent(pbe);
		}*/
		
		private function LoadENMTypeList():void
		{
			if(ENMSuggestedCodeList && ENMSuggestedCodeList.length > 0) return;
			var enmEvent:LoadENMCodeTypesEvent = new LoadENMCodeTypesEvent();
			CairngormEventDispatcher.getInstance().dispatchEvent( enmEvent );	
			
		}
		
		public function loadPlaceOServiceTypes():void
		{
			if(PlaceOfServiceTypeList && PlaceOfServiceTypeList.length > 0) return;
			
			var ev:LoadPlaceOfServiceTypesEvent = new LoadPlaceOfServiceTypesEvent("All",function (typeList:ArrayCollection):void { model.PlaceOfServiceTypeList = typeList; });
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
		
		public function loadEncounterTypes():void
		{
			if(EncounterTypeList && EncounterTypeList.length > 0) return;
			
			var ev:LoadEncounterTypesEvent = new LoadEncounterTypesEvent(function (typeList:ArrayCollection):void { model.EncounterTypeList = typeList; });
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
		}
		
		public function loadCPTModifiers():void
		{
			if(CPTModifierTypeList1 && CPTModifierTypeList1.length > 0) return;
			
			var ev:LoadCPTModifierTypesEvent = new LoadCPTModifierTypesEvent("0",0);
			CairngormEventDispatcher.getInstance().dispatchEvent(ev);
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
			
			SuperBillConstants.RESTFULL_SERVICE_BASE_URL 			= XmlUtils.getPropertyValueByName( 'BILLING_RESTFUL_SERVICE', value );
			SuperBillConstants.BILLING_REPORT_BASE_URL 			= XmlUtils.getPropertyValueByName( 'BILLING_REPORT_BASE_URL', value );
			SuperBillConstants.USER_RESTFULL_SERVICE_BASE_URL 	= XmlUtils.getPropertyValueByName( 'EPRESCRIPTION_USER_SERVICE', value );
			
			//log it 
			logger.debug( "BILLING_RESTFUL_SERVICE URL: " + SuperBillConstants.RESTFULL_SERVICE_BASE_URL  );
			logger.debug( "BILLING_REPORT_BASE_URL URL: " + SuperBillConstants.BILLING_REPORT_BASE_URL  );
			logger.debug( "EPRESCRIPTION_USER_SERVICE URL: " + SuperBillConstants.USER_RESTFULL_SERVICE_BASE_URL  );
		}
		
		//############################ DATA MEMBERS ###########################################
		
		//Logged In User info members...
		private var //m_iLoggedInUserId:int = 610,//42934,//610, 
		m_iLoggedInUserId:int = 	42984, //for local
			m_iLoggedInUserSelectedBranchId:int = 7, 
			//m_iLoggedInUserProviderId:int =  610,//42934,//610, 
			m_iLoggedInUserProviderId:int = 42984,  //for local
			m_iLoggedInUserProviderTypeId:int = 3,
			m_sUserSelectedPracticeName:String, 
			_LoggedInUserSessionID:String,
			m_sStationName:String;	
		
	}
}