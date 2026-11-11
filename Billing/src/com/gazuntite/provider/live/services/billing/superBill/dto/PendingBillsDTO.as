package com.gazuntite.provider.live.services.billing.superBill.dto
{
	import com.gazuntite.common.util.xml.XmlConstants;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.provider.live.services.billing.superBill.model.SuperBillModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class PendingBillsDTO
	{
		public var model : SuperBillModelLocator = SuperBillModelLocator.getInstance();
		
		private var m_oPendingBills:ArrayCollection;
		
		private var m_sVisitId:String;
		private var m_sPatientId:String;
		private var m_sVisitDate:String;
		private var m_sProviderId:String;
		private var m_sBillPayment:String;
		private var m_sQuivusId:String;
		private var m_sPatient:String;
		private var m_sProvider:String;
		private var m_sAction:String;
		
		private var m_sEncounterTypeId:String;
		private var m_sPlaceOfServiceTypeID:String;
		private var m_oHCFA:CMS1500DTO;
		
		private var m_sPatientUserId:String;		
		private var m_sCheckNumber:String;
		private var m_sCopay:String;
		private var m_sCurrentIllnessDate:String;
		
		private var m_bIsSavedSuperBill:Boolean;
		
		public function get IsSavedSuperBill():Boolean
		{
			return m_bIsSavedSuperBill;
		}
		
		public function set IsSavedSuperBill(value:Boolean):void
		{
			m_bIsSavedSuperBill = value;
		}
		
		public function get BillingProviderInfo():BillingProviderDTO
		{
			return m_oBillingProviderInfo;
		}
		
		public function set BillingProviderInfo(value:BillingProviderDTO):void
		{
			m_oBillingProviderInfo = value;
		}
		
		public function get CurrentIllnessDate():String
		{
			return m_sCurrentIllnessDate;
		}
		
		public function set CurrentIllnessDate(value:String):void
		{
			if( ! UtilityFunctions.IsNullOrEmpty(value))
				value = UtilityFunctions.FormatDate(value.substr(0,10),"MM/DD/YYYY");
			m_sCurrentIllnessDate = value ;
		}
		
		public function get Copay():String
		{
			return m_sCopay;
		}
		
		public function set Copay(value:String):void
		{
			m_sCopay = value ;
		}
		
		public function get CheckNumber():String
		{
			return m_sCheckNumber;
		}
		
		public function set CheckNumber(value:String):void
		{
			m_sCheckNumber = value ;
		}
		
		public function get PatientUserId():String
		{
			return m_sPatientUserId;
		}
		
		public function set PatientUserId(value:String):void
		{
			m_sPatientUserId = value ;
		}
		
		public function get HCFA():CMS1500DTO
		{
			return m_oHCFA;
		}
		
		public function set HCFA(value:CMS1500DTO):void
		{
			m_oHCFA = value ;
		}
		
		public function get ServiceTypeID():String
		{
			return m_sPlaceOfServiceTypeID;
		}
		
		public function set ServiceTypeID(value:String):void
		{
			m_sPlaceOfServiceTypeID = value ;
		}
		
		public function get EncounterTypeID():String
		{
			return m_sEncounterTypeId;
		}
		
		public function set EncounterTypeID(value:String):void
		{
			m_sEncounterTypeId = value ;
		}
		
		private var m_sBillingStatusTypeID:String; 
		
		private var m_sTerInsOrganizationID:String; 
		
		public function get TerInsOrganizationID():String
		{
			return m_sTerInsOrganizationID;
		}
		
		public function set TerInsOrganizationID(value:String):void
		{
			m_sTerInsOrganizationID = value ;
		}
		
		private var m_sSecInsOrganizationID:String; 
		
		public function get SecInsOrganizationID():String
		{
			return m_sSecInsOrganizationID;
		}
		
		public function set SecInsOrganizationID(value:String):void
		{
			m_sSecInsOrganizationID = value ;
		}
		
		private var m_sPriInsOrganizationID:String; 
		
		public function get PriInsOrganizationID():String
		{
			return m_sPriInsOrganizationID;
		}
		
		public function set PriInsOrganizationID(value:String):void
		{
			m_sPriInsOrganizationID = value ;
		}
		
		public function get BillingStatusTypeID():String
		{
			return m_sBillingStatusTypeID;
		}
		
		public function set BillingStatusTypeID(value:String):void
		{
			m_sBillingStatusTypeID = value ;
		}
		
		private var m_sPaymentTypeID:String; 
		
		public function get PaymentTypeID():String
		{
			return m_sPaymentTypeID;
		}
		
		public function set PaymentTypeID(value:String):void
		{
			m_sPaymentTypeID = value ;
		}
				
		private var m_oPatientInfo:SuperBillPatientInfoDTO;
		
		private var m_oProcedureInfo:ArrayCollection;
		
		private var m_oDiagnosisInfo:ArrayCollection;
		
		private var m_oWRSInfo:ArrayCollection;
		
		private var m_oBillingProviderInfo:BillingProviderDTO;
		
		public function get WRSInfo():ArrayCollection
		{
			return m_oWRSInfo;
		}
		
		public function set WRSInfo(value:ArrayCollection):void
		{
			m_oWRSInfo = value;
		}
		
		public function get DiagnosisInfo():ArrayCollection
		{
			return m_oDiagnosisInfo;
		}
		
		public function set DiagnosisInfo(value:ArrayCollection):void
		{
			m_oDiagnosisInfo = value;
		}
		
		public function get ProcedureInfo():ArrayCollection
		{
			return m_oProcedureInfo;
		}
		
		public function set ProcedureInfo(value:ArrayCollection):void
		{
			m_oProcedureInfo = value;
		}
		
		public function PendingBillsDTO()
		{
			PendingBills = new ArrayCollection;
		}
		
		public function get PatientInfo():SuperBillPatientInfoDTO
		{
			return m_oPatientInfo;
		}
		
		public function set PatientInfo(value:SuperBillPatientInfoDTO):void
		{
			m_oPatientInfo = value;
		}
		
		public function get PendingBills():ArrayCollection
		{
			return m_oPendingBills;
		}
		
		public function set PendingBills(value:ArrayCollection):void
		{
			m_oPendingBills = value;
		}
		
		public function get BillPayment():String
		{
			return m_sBillPayment;
		}
		
		public function set BillPayment(value:String):void
		{
			m_sBillPayment = value;
		}
		
		private var m_sSNo:String;
		
		public function get SNo():String
		{
			return m_sSNo;
		}
		
		public function set SNo(value:String):void
		{
			m_sSNo = value;
		}
		
		public function get VisitId():String
		{
			return m_sVisitId;
		}
		
		public function set VisitId(value:String):void
		{
			m_sVisitId = value;
		}
		
		public function get PatientId():String
		{
			return m_sPatientId;
		}
		
		public function set PatientId(value:String):void
		{
			m_sPatientId = value;
		}
		
		public function get VisitDate():String
		{
			return m_sVisitDate;
		}
		
		public function set VisitDate(value:String):void
		{			
			value = UtilityFunctions.FormatDate(value.substr(0,10),"MM/DD/YYYY");
			m_sVisitDate = value;
		}
		
		public function get ProviderId():String
		{
			return m_sProviderId;
		}
		
		public function set ProviderId(value:String):void
		{
			m_sProviderId = value;
		}
				
		public function get QuivusId():String
		{
			return m_sQuivusId;
		}
		
		public function set QuivusId(value:String):void
		{
			m_sQuivusId = value;
		}
				
		public function get Patient():String
		{
			return m_sPatient;
		}
		
		public function set Patient(value:String):void
		{
			m_sPatient = value;
		}
		
		public function get Provider():String
		{
			return m_sProvider;
		}
		
		public function set Provider(value:String):void
		{
			if( ! UtilityFunctions.IsNullOrEmpty(value) && value.indexOf(",") > -1)
				m_sProvider = UtilityFunctions.TrimString(value.split(',')[1]) + ' ' + value.split(',')[0];
			else
				m_sProvider = value;
		}
		
		public function get Action():String
		{
			return m_sAction;
		}
		
		public function set Action(value:String):void
		{
			m_sAction = value;
		}
		
		private var m_sHistoryLevelScale:String;
		
		public function get HistoryLevelScale():String
		{
			return m_sHistoryLevelScale;
		}		
		public function set HistoryLevelScale(value:String):void
		{
			m_sHistoryLevelScale = value;
		}
		
		private var m_sExaminationLevelScale:String;
		
		public function get ExaminationLevelScale():String
		{
			return m_sExaminationLevelScale;
		}		
		public function set ExaminationLevelScale(value:String):void
		{
			m_sExaminationLevelScale = value;
		}
		
		private var m_sDecisionLevelScale:String;
		
		public function get DecisionLevelScale():String
		{
			return m_sDecisionLevelScale;
		}		
		public function set DecisionLevelScale(value:String):void
		{
			m_sDecisionLevelScale = value;
		}
		
		private var m_oENMServiceInfo:ArrayCollection;
		
		public function get ENMServiceInfo():ArrayCollection
		{
			return m_oENMServiceInfo;
		}
		
		public function set ENMServiceInfo(value:ArrayCollection):void
		{
			m_oENMServiceInfo = value;
		}
		
		private var m_sPrimaryResponsibility:String;
		
		public function get PrimaryResponsibility():String
		{
			return m_sPrimaryResponsibility;
		}
		
		public function set PrimaryResponsibility(value:String):void
		{
			m_sPrimaryResponsibility = value;
		}
		
		private var m_sSecondaryResponsibility:String;
		
		public function get SecondaryResponsibility():String
		{
			return m_sSecondaryResponsibility;
		}
		
		public function set SecondaryResponsibility(value:String):void
		{
			m_sSecondaryResponsibility = value;
		}
		
		private var m_sBillingDisallowed:String;
		
		public function get BillingDisallowed():String
		{
			return m_sBillingDisallowed;
		}
		
		public function set BillingDisallowed(value:String):void
		{
			m_sBillingDisallowed = value;
		}
		
		private var m_sAdditionalPayment:String;
		
		public function get AdditionalPayment():String
		{
			return m_sAdditionalPayment;
		}
		
		public function set AdditionalPayment(value:String):void
		{
			m_sAdditionalPayment = value;
		}
		
		private var m_sWriteOff:String;
		
		public function get WriteOff():String
		{
			return m_sWriteOff;
		}
		
		public function set WriteOff(value:String):void
		{
			m_sWriteOff = value;
		}
		
		private var m_sMediaTypeID:String;
		
		public function get MediaTypeID():String
		{
			return m_sMediaTypeID;
		}
		
		public function set MediaTypeID(value:String):void
		{
			m_sMediaTypeID = value ;
		}
		
		public function FromXML( x:XML ):void
		{
			SNo									= x.@[XmlConstants.SNO];
			VisitId 							= x.@[XmlConstants.PBVISITID];
			PatientId 							= x.@[XmlConstants.PBPATIENTID];
			VisitDate 							= x.@[XmlConstants.VISITDATE];			
			ProviderId 							= x.@[XmlConstants.PBPROVIDERID];
			BillPayment 						= x.@[XmlConstants.BILLPAYMENT];
			HistoryLevelScale					= x.@[XmlConstants.HISTORYLEVELSCALE];
			ExaminationLevelScale				= x.@[XmlConstants.EXAMINATIONLEVELSCALE];
			DecisionLevelScale					= x.@[XmlConstants.DECISIONLEVELSCALE];
			QuivusId 							= x.@[XmlConstants.PBQUIVUSID];			
			Patient 							= x.@[XmlConstants.PATIENT];
			Provider 							= x.@[XmlConstants.PROVIDER];
			Action 								= "Process Bill";
			BillingStatusTypeID					= x.@[XmlConstants.BILLINGSTATUSTYPEID];
			MediaTypeID							= x.@[XmlConstants.MEDIATYPEID];
			PaymentTypeID						= x.@[XmlConstants.PAYMENTTYPEID];
			PriInsOrganizationID				= x.@[XmlConstants.PRIINSORGANIZATIONID];
			SecInsOrganizationID				= x.@[XmlConstants.SECINSORGANIZATIONID];
			TerInsOrganizationID				= x.@[XmlConstants.TERINSORGANIZATIONID];
			ManagedByUserId						= x.@[XmlConstants.MANAGEDBYUSERID];
			EncounterTypeID						= x.@[XmlConstants.ENCOUNTERTYPEID];
			ServiceTypeID						= x.@[XmlConstants.SERVICETYPEID];
			PatientUserId						= x.@[XmlConstants.PATIENTUSERID];
			CheckNumber							= x.@[XmlConstants.CHECKNUMBER];
			Copay								= x.@[XmlConstants.COPAY];
			CurrentIllnessDate					= x.@[XmlConstants.CURRENTILLNESSDATE];
			if(x.@["IsSuperBillSaved"] == "true")
				IsSavedSuperBill = true;
			else
				IsSavedSuperBill = false;
			
			PrimaryResponsibility				= x.@[XmlConstants.PRIMARYRESP];
			SecondaryResponsibility				= x.@[XmlConstants.SECONDARYRESP];
			BillingDisallowed					= x.@[XmlConstants.BILLINGDISALLOWED];
			AdditionalPayment					= x.@[XmlConstants.ADDITIONALPAYMENT];
			WriteOff							= x.@[XmlConstants.WRITEOFF];
			
			if(x.ProviderInfo[0])
			{
				var pvi:BillingProviderDTO = new BillingProviderDTO();			
				pvi.FromXML( x.ProviderInfo[0] );
				BillingProviderInfo = pvi;
			}
			var pi:SuperBillPatientInfoDTO = new SuperBillPatientInfoDTO();
			pi.FromXML( x.PatientInfo[0] );
			PatientInfo = pi;
			
			ENMServiceInfo = new ArrayCollection();			
			var xENMServices:XMLList = x.ENMServiceInfo.ENMService;
			var iENM:int = 0;
			for(iENM = 0; iENM < xENMServices.length(); iENM++)
			{
				var enmi:SuperBillENMServiceInfoDTO = new SuperBillENMServiceInfoDTO();
				enmi.FromXML( xENMServices[0] );
				ENMServiceInfo.addItem(enmi);
			}
			
			ProcedureInfo =new ArrayCollection();
			var xProcedures:XMLList = x.ProcedureInfo.Procedure;
			var i:int = 0;					
			for( i = 0; i < xProcedures.length(); i++ )
			{
				var ct:SuperBillProcedureInfoDTO = new SuperBillProcedureInfoDTO();
				ct.FromXML( xProcedures[i][0] );
				ProcedureInfo.addItem( ct );
			}
			
			DiagnosisInfo =new ArrayCollection();
			var xDiagnoses:XMLList = x.DiagnosisInfo.Diagnosis;
			var j:int = 0;					
			for( j = 0; j < xDiagnoses.length(); j++ )
			{
				var dct:SuperBillDiagnosisInfoDTO = new SuperBillDiagnosisInfoDTO();
				dct.FromXML( xDiagnoses[j][0] );
				DiagnosisInfo.addItem( dct );
			}
			
			WRSInfo =new ArrayCollection();
			var xWRS:XMLList = x.WRSInfo.Service;
			var k:int = 0;					
			for( k = 0; k < xWRS.length(); k++ )
			{
				var wct:WorkRelatedServiceDTO = new WorkRelatedServiceDTO();
				wct.FromXML( xWRS[k][0] );
				WRSInfo.addItem( wct );
			}
			if(x.HCFA[0])
			{
				var cms:CMS1500DTO = new CMS1500DTO();
				cms.FromXML( x.HCFA[0] );
				HCFA = cms;
			}
		}		
		
		private var m_sManagedByUserId:String;
		
		public function get ManagedByUserId():String
		{
			return m_sManagedByUserId;
		}
		
		public function set ManagedByUserId(value:String):void
		{
			m_sManagedByUserId = value;
		}		
		
		public function ToXML():XML
		{	
						
			var x:XML = XmlUtils.getNodeByTagName( "PendingBill" );			
			
			x.@[XmlConstants.PBVISITID]						=  VisitId;			
			x.@[XmlConstants.PBPATIENTID]					=  PatientId;
			x.@[XmlConstants.VISITDATE]                     =  UtilityFunctions.FormatDate(VisitDate);
			x.@[XmlConstants.PBPROVIDERID]					=  ProviderId;
			x.@[XmlConstants.BILLPAYMENT]					=  BillPayment;
			x.@[XmlConstants.HISTORYLEVELSCALE]				=  HistoryLevelScale;
			x.@[XmlConstants.EXAMINATIONLEVELSCALE]			=  ExaminationLevelScale;
			x.@[XmlConstants.DECISIONLEVELSCALE]			=  DecisionLevelScale;
			x.@[XmlConstants.PBQUIVUSID]					=  QuivusId;
			x.@[XmlConstants.CLINICBRANCHID]				=  model.LoggedInUserSelectedBranchId;
			x.@[XmlConstants.BILLINGSTATUSTYPEID]			=  BillingStatusTypeID;	
			x.@[XmlConstants.MEDIATYPEID]					=  MediaTypeID;	
			x.@[XmlConstants.PAYMENTTYPEID]					=  PaymentTypeID;
			x.@[XmlConstants.PRIINSORGANIZATIONID]			=  PriInsOrganizationID;
			x.@[XmlConstants.SECINSORGANIZATIONID]			=  SecInsOrganizationID;
			x.@[XmlConstants.TERINSORGANIZATIONID]			=  TerInsOrganizationID;
			x.@[XmlConstants.MANAGEDBYUSERID]				=  ManagedByUserId;
			x.@[XmlConstants.ENCOUNTERTYPEID]				=  EncounterTypeID;
			x.@[XmlConstants.SERVICETYPEID]					=  ServiceTypeID;
			x.@[XmlConstants.PATIENTUSERID]					=  PatientUserId;
			x.@[XmlConstants.CHECKNUMBER]					=  CheckNumber;
			x.@[XmlConstants.COPAY]							=  Copay;
			x.@[XmlConstants.CURRENTILLNESSDATE]			= ! UtilityFunctions.IsNullOrEmpty(CurrentIllnessDate)? UtilityFunctions.FormatDate(CurrentIllnessDate):"";		
			x.@[XmlConstants.PATIENT]						= Patient;
			x.@[XmlConstants.PROVIDER]						= Provider;
			x.@[XmlConstants.PRIMARYRESP]					= PrimaryResponsibility;
			x.@[XmlConstants.SECONDARYRESP]                 = SecondaryResponsibility;
			x.@[XmlConstants.BILLINGDISALLOWED]				= BillingDisallowed;
			x.@[XmlConstants.ADDITIONALPAYMENT]				= AdditionalPayment;
			x.@[XmlConstants.WRITEOFF]						= WriteOff;
			
			if(PatientInfo != null)
				x.appendChild(PatientInfo.ToXML());
			
			if(BillingProviderInfo != null)
				x.appendChild(BillingProviderInfo.ToXML());
			
			if(ENMServiceInfo != null && ENMServiceInfo.length > 0 )
			{
				var xENM:XML = XmlUtils.getNodeByTagName( "ENMServiceInfo" );
				
				for(var iENM:int = 0; iENM < ENMServiceInfo.length; iENM++)
				{
					var enmi:SuperBillENMServiceInfoDTO = ENMServiceInfo[iENM];				
					xENM.appendChild(enmi.ToXML());
				}
				x.appendChild(xENM);
			}
			if(DiagnosisInfo != null && DiagnosisInfo.length > 0 )
			{
				var xDiagnosis:XML = XmlUtils.getNodeByTagName( "DiagnosisInfo" );
				
				for(var iDx:int = 0; iDx < DiagnosisInfo.length; iDx++)
				{
					var dxi:SuperBillDiagnosisInfoDTO = DiagnosisInfo[iDx];				
					xDiagnosis.appendChild(dxi.ToXML());
				}
				x.appendChild(xDiagnosis);
			}
			
			if(ProcedureInfo != null && ProcedureInfo.length > 0 )
			{
				var xProcedures:XML = XmlUtils.getNodeByTagName( "ProcedureInfo" );
				
				for(var iCPT:int = 0; iCPT < ProcedureInfo.length; iCPT++)
				{
					var pi:SuperBillProcedureInfoDTO = ProcedureInfo[iCPT];				
					xProcedures.appendChild(pi.ToXML());
				}
				x.appendChild(xProcedures);
			}
			
			if(WRSInfo != null && WRSInfo.length > 0 )
			{
				var xWRS:XML = XmlUtils.getNodeByTagName( "WRSInfo" );
				
				for(var iWRS:int = 0; iWRS < WRSInfo.length; iWRS++)
				{
					var wrsi:WorkRelatedServiceDTO = WRSInfo[iWRS];				
					xWRS.appendChild(wrsi.ToXML());
				}
				x.appendChild(xWRS);
			}
			
			if(HCFA != null)
				x.appendChild(HCFA.ToXML());
			
			return x;
		}
	}
}