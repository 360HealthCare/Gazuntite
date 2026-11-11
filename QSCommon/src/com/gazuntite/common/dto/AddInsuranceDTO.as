package com.gazuntite.common.dto
{
	import com.gazuntite.common.util.xml.XmlConstants;
	import com.gazuntite.common.util.xml.XmlUtils;
	
	import mx.states.OverrideBase;
	
	[Bindable]
	public class AddInsuranceDTO extends InsOrganizationDTO
	{
		public function AddInsuranceDTO()
		{
			
		}
		
		//Address Properties
		private var _Extension						:String;
		private var _Name							:String;
		private var _Note							:String;
		private var _PlanName						:String;
		private var _StatusTypeID					:String;
		private var _ModifiedBy						:String;
		private var _CreatedBy						:String;
		private var _IsDeleted						:String;
		
		//Options and  Codes Properties
		private var _InsuranceCategoryTypeID 		:String;
		private var _ProcedureCodeSet 				:String;
		private var _DiagnosisCodeSet				:String;
		private var _PatientSignatureOnFile			:String;
		private var _InsuredSignatureOnFile			:String;
		private var _PhysicianSignatureOnFile		:String;
		private var _PrintPINsOnInsForm				:String;
		private var _PrimaryMediaTypeID				:String;
		private var _SecondaryMediaTypeID			:String;
		private var _TertiaryMediaTypeID			:String;
		private var _PaymentCode					:String;
		private var _WriteOffCode					:String;
		private var _WithHoldCode					:String;
		private var _DeductibleCode					:String;
		private var _TakeBackCode					:String;
		
		
		//EDI/Eligibility Properties
		
		private var _PrimaryEDIReceiverTypeID 		:String;
		private var _PrimaryClaimsPayerID			:String;
		private var _PrimaryEligibilityPayerID 		:String;
		private var _PrimaryNationalPlanID 			:String;
		
		private var _SecondaryEDIReceiverTypeID 	:String;
		private var _SecondaryClaimsPayerID			:String;
		private var _SecondaryEligibilityPayerID 	:String;
		private var _SecondaryNationalPlanID		:String;
		
		
		private var _MaxTransactions 				:String;
		private var _Extra1							:String;
		private var _Extra2 						:String;
		private var _Crossover						:Boolean;
		private var _DelaySecondaryBilling			:Boolean;
		private var _SendOrderingProvider			:Boolean;
		private var _SendPracticeTaxonomy 			:Boolean;
		private var _AlternateIDNumber				:String;
		private var _Type							:String;
		
		private var m_sAddressLine2:String;
		
		public function get AddressLine2():String
		{
			return m_sAddressLine2;
		}
		
		public function set AddressLine2(value:String):void
		{
			m_sAddressLine2 = value;
		}
		
		public function ToXML():XML
		{
			var xmlRoot:XML = XmlUtils.getNodeByTagName("BillingInsurances") ;
			var xml:XML = XmlUtils.getNodeByTagName("BillingInsurance");
			xml.@[XmlConstants.INSURANCENAME]				=  InsuranceName;
			xml.@[XmlConstants.PHONE]						=  Phone;
			xml.@[XmlConstants.EXTENSION]					= Extension;
			xml.@[XmlConstants.ADDRESS]						= Address + "^" + AddressLine2;
			xml.@[XmlConstants.FAX]							= FAX;
			//xml.@[XmlConstants.CONTACTPERSON] 				= ContactPerson;
			xml.@[XmlConstants.CITY]						= City;
			xml.@[XmlConstants.STATE]		 				= State;
			xml.@[XmlConstants.ZIP]							= ZIP;
			xml.@[XmlConstants.PLANNAME]					= PlanName;
			xml.@[XmlConstants.ISDELETED]					= IsDeleted;
			xml.@[XmlConstants.CREATEDBY]					= CreatedBy;
			xml.@[XmlConstants.MODIFIEDBY]					= ModifiedBy;
			xml.@[XmlConstants.STATUSTYPEID]				= StatusTypeID;
			
			xml.@[XmlConstants.NOTE]						= Note;
			xml.@[XmlConstants.INSORGANIZATIONID]			= InsOrganizationID;
			
			xml.@[XmlConstants.CATEGORYTYPEID]		        =	CategoryTypeID;
			/*xml.@[XmlConstants.PROCEDURECODE]				=	ProcedureCodeSet;
			xml.@[XmlConstants.DIAGNOSISCODESET]			=	DiagnosisCodeSet;*/
			xml.@[XmlConstants.INSUREDSIGNATUREONFILE]		=	InsuredSignatureOnFile;
			xml.@[XmlConstants.PHYSICIANSIGNATUREONFILE]	=	PhysicianSignatureOnFile;
			xml.@[XmlConstants.PRINTPINSONINSFORM]			=	PrintPINsOnInsForm;
			xml.@[XmlConstants.PRIMARYMEDIATYPEID]			=	PrimaryMediaTypeID;
			xml.@[XmlConstants.SECONDARYMEDIATYPEID]		=	SecondaryMediaTypeID;
			xml.@[XmlConstants.TERTIARYMEDIATYPEID]			=	TertiaryMediaTypeID;
			/*xml.@[XmlConstants.PAYMENTCODE]					=	PaymentCode;
			xml.@[XmlConstants.WRITEOFFCODE]				=	WriteOffCode;
			xml.@[XmlConstants.WITHHOLDCODE]				=	WithHoldCode;
			xml.@[XmlConstants.DEDUCTIBLECODE]				=	DeductibleCode;
			xml.@[XmlConstants.TAKEBACKCODE]				=	TakeBackCode ;*/
			
			
			xml.@[XmlConstants.PRIMARYEDIRECEIVERTYPEID]	=	PrimaryEDIReceiverTypeID;
			xml.@[XmlConstants.PRIMARYCLAIMSPAYERID]		= 	PrimaryClaimsPayerID;
			xml.@[XmlConstants.PRIMARYELIGIBILITYPAYERID]	=	PrimaryEligibilityPayerID;
			xml.@[XmlConstants.PRIMARYNATIONALPLANID]		=	PrimaryNationalPlanID;
			xml.@[XmlConstants.SECONDARYEDIRECEIVERTYPEID]	=	SecondaryEDIReceiverTypeID;
			xml.@[XmlConstants.SECONDARYCLAIMSPAYERID]		= 	SecondaryClaimsPayerID;
			xml.@[XmlConstants.SECONDARYELIGIBILITYPAYERID]	=	SecondaryEligibilityPayerID;
			xml.@[XmlConstants.SECONDARYNATIONALPLANID]		=	SecondaryNationalPlanID;
			xml.@[XmlConstants.MAXTRANSACTIONS]				=	MaxTransactions;
			xml.@[XmlConstants.EXTRA1]						=	Extra1;
			xml.@[XmlConstants.EXTRA2]						=	Extra2;
			xml.@[XmlConstants.CROSSOVERCODE]				=	Crossover.toString();
			xml.@[XmlConstants.DELAYSECONDAYBILLING]		=	DelaySecondaryBilling.toString() ;
			xml.@[XmlConstants.SENDORDERINGPROVIDER]		=	SendOrderingProvider.toString();
			xml.@[XmlConstants.SENDPRACTICETAXANOMY]		=	SendPracticeTaxonomy.toString() ;
			xml.@[XmlConstants.ALTERNATECARRIERID] 			=	AlternateIDNumber;
			xml.@[XmlConstants.PATIENTSIGNATUREONFILE]		=	PatientSignatureOnFile ;
			//xml.@[XmlConstants.TYPE]						=  	Type;
			xmlRoot.appendChild(xml);
			trace(xml);
			return xmlRoot;
			
		}
		
		
		override public  function  FromXML(xml:XML):void
		{
			SNo											= xml.@[XmlConstants.SNO];
			Phone 										= xml.@[XmlConstants.PHONE];
			Extension 									= xml.@[XmlConstants.EXTENSION];
			Address 									= xml.@[XmlConstants.ADDRESS];
			if(Address.indexOf("^") > -1)
			{	
				AddressLine2 = Address.split('^')[1];
				Address = Address.split('^')[0];				
			}
			InsuranceName 								= xml.@[XmlConstants.INSURANCENAME];
			FAX 										= xml.@[XmlConstants.FAX];
			ContactPerson 								= xml.@[XmlConstants.CONTACTPERSON];
			City										= xml.@[XmlConstants.CITY];
			State										= xml.@[XmlConstants.STATE];
			ZIP 										= xml.@[XmlConstants.ZIP];
			PlanName									= xml.@[XmlConstants.PLANNAME];
			Note 										= xml.@[XmlConstants.NOTE];
			StatusTypeID         						=xml.@[XmlConstants.STATUSTYPEID];
			CreatedBy									=xml.@[XmlConstants.CREATEDBY];
			ModifiedBy									=xml.@[XmlConstants.MODIFIEDBY];
			
			CategoryTypeID								= xml.@[XmlConstants.CATEGORYTYPEID];
			ProcedureCodeSet 							= xml.@[XmlConstants.PROCEDURECODE];
			DiagnosisCodeSet 							= xml.@[XmlConstants.DIAGNOSISCODESET];
			PatientSignatureOnFile						= xml.@[XmlConstants.PATIENTSIGNATUREONFILE];
			InsuredSignatureOnFile						= xml.@[XmlConstants.INSUREDSIGNATUREONFILE];
			PhysicianSignatureOnFile 					= xml.@[XmlConstants.PHYSICIANSIGNATUREONFILE];
			PrintPINsOnInsForm 							= xml.@[XmlConstants.PRINTPINSONINSFORM];
			PrimaryMediaTypeID 							= xml.@[XmlConstants.PRIMARYMEDIATYPEID];
			SecondaryMediaTypeID 						= xml.@[XmlConstants.SECONDARYMEDIATYPEID];
			TertiaryMediaTypeID							= xml.@[XmlConstants.TERTIARYMEDIATYPEID];
			PaymentCode									= xml.@[XmlConstants.PAYMENTCODE];	
			WriteOffCode								= xml.@[XmlConstants.WRITEOFFCODE];
			WithHoldCode								= xml.@[XmlConstants.WITHHOLDCODE];
			DeductibleCode								= xml.@[XmlConstants.DEDUCTIBLECODE];
			TakeBackCode								= xml.@[XmlConstants.TAKEBACKCODE];
			PrimaryEDIReceiverTypeID					= xml.@[XmlConstants.PRIMARYEDIRECEIVERTYPEID];
			PrimaryClaimsPayerID 						= xml.@[XmlConstants.PRIMARYCLAIMSPAYERID];
			PrimaryEligibilityPayerID 					= xml.@[XmlConstants.PRIMARYELIGIBILITYPAYERID];
			PrimaryNationalPlanID						= xml.@[XmlConstants.PRIMARYNATIONALPLANID];
			SecondaryEDIReceiverTypeID 					= xml.@[XmlConstants.SECONDARYEDIRECEIVERTYPEID];
			SecondaryClaimsPayerID						= xml.@[XmlConstants.SECONDARYCLAIMSPAYERID];
			SecondaryEligibilityPayerID					= xml.@[XmlConstants.SECONDARYELIGIBILITYPAYERID];
			SecondaryNationalPlanID						= xml.@[XmlConstants.SECONDARYNATIONALPLANID];
			MaxTransactions								= xml.@[XmlConstants.MAXTRANSACTIONS];
			Extra1										= xml.@[XmlConstants.EXTRA1];
			Extra2										= xml.@[XmlConstants.EXTRA2];
			TakeBackCode 								= xml.@[XmlConstants.TAKEBACKCODE] 			
			Crossover									= xml.@[XmlConstants.CROSSOVERCODE] 		== XmlConstants.STRING_TRUE ;
			DelaySecondaryBilling						= xml.@[XmlConstants.DELAYSECONDAYBILLING] 	== XmlConstants.STRING_TRUE ;
			SendOrderingProvider						= xml.@[XmlConstants.SENDORDERINGPROVIDER] 	== XmlConstants.STRING_TRUE ;
			SendPracticeTaxonomy						= xml.@[XmlConstants.SENDPRACTICETAXANOMY]	== XmlConstants.STRING_TRUE ;
			AlternateIDNumber							= xml.@[XmlConstants.ALTERNATECARRIERID];
			Type										= xml.@[XmlConstants.TYPE];
			InsOrganizationID							= xml.@[XmlConstants.INSORGANIZATIONID];	
			
		}
		
		//Address Getters & Setters
		
		private var m_sSNo:String;
		
		public function get SNo():String
		{
			return m_sSNo;
		}
		
		public function set SNo(value:String):void
		{
			m_sSNo = value;
		}
		
		public function get Extension():String
		{
			return _Extension;
		}
		
		public function set Extension(value:String):void
		{
			_Extension = value;
		}
		
		public function get Name():String
		{
			return _Name;
		}
		
		public function set Name(value:String):void
		{
			_Name = value;
		}
		
		public function get Note():String
		{
			return _Note;
		}
		
		public function set Note(value:String):void
		{
			_Note = value;
		}
		
		public function get PlanName():String
		{
			return _PlanName;
		}
		
		public function set PlanName(value:String):void
		{
			_PlanName = value;
		}
		
		
		//Options and  Codes Getters & Setters
		public function get CategoryTypeID():String
		{
			return _InsuranceCategoryTypeID;
		}
		
		public function set CategoryTypeID(value:String):void
		{
			_InsuranceCategoryTypeID = value;
		}
		
		public function get ProcedureCodeSet():String
		{
			return _ProcedureCodeSet;
		}
		
		public function set ProcedureCodeSet(value:String):void
		{
			_ProcedureCodeSet = value;
		}
		
		public function get DiagnosisCodeSet():String
		{
			return _DiagnosisCodeSet;
		}
		
		public function set DiagnosisCodeSet(value:String):void
		{
			_DiagnosisCodeSet = value;
		}
		
		public function get InsuredSignatureOnFile():String
		{
			return _InsuredSignatureOnFile;
		}
		
		public function set InsuredSignatureOnFile(value:String):void
		{
			_InsuredSignatureOnFile = value;
		}
		
		public function get PhysicianSignatureOnFile():String
		{
			return _PhysicianSignatureOnFile;
		}
		
		public function set PhysicianSignatureOnFile(value:String):void
		{
			_PhysicianSignatureOnFile = value;
		}
		
		public function get PrintPINsOnInsForm():String
		{
			return _PrintPINsOnInsForm;
		}
		
		public function set PrintPINsOnInsForm(value:String):void
		{
			_PrintPINsOnInsForm = value;
		}
		
		public function get PrimaryMediaTypeID():String
		{
			return _PrimaryMediaTypeID;
		}
		
		public function set PrimaryMediaTypeID(value:String):void
		{
			_PrimaryMediaTypeID = value;
		}
		
		public function get SecondaryMediaTypeID():String
		{
			return _SecondaryMediaTypeID;
		}
		
		public function set SecondaryMediaTypeID(value:String):void
		{
			_SecondaryMediaTypeID = value;
		}
		
		public function get TertiaryMediaTypeID():String
		{
			return _TertiaryMediaTypeID;
		}
		
		public function set TertiaryMediaTypeID(value:String):void
		{
			_TertiaryMediaTypeID = value;
		}
		
		public function get PaymentCode():String
		{
			return _PaymentCode;
		}
		
		public function set PaymentCode(value:String):void
		{
			_PaymentCode = value;
		}
		
		public function get WriteOffCode():String
		{
			return _WriteOffCode;
		}
		
		public function set WriteOffCode(value:String):void
		{
			_WriteOffCode = value;
		}
		
		public function get WithHoldCode():String
		{
			return _WithHoldCode;
		}
		
		public function set WithHoldCode(value:String):void
		{
			_WithHoldCode = value;
		}
		
		public function get DeductibleCode():String
		{
			return _DeductibleCode;
		}
		
		public function set DeductibleCode(value:String):void
		{
			_DeductibleCode = value;
		}
		
		public function get TakeBackCode():String
		{
			return _TakeBackCode;
		}
		
		public function set TakeBackCode(value:String):void
		{
			_TakeBackCode = value;
		}
		
		

		//EDI/Eligibility Getters & Setters
		
		public function get PrimaryEDIReceiverTypeID():String
		{
			return _PrimaryEDIReceiverTypeID;
		}
		
		public function set PrimaryEDIReceiverTypeID(value:String):void
		{
			_PrimaryEDIReceiverTypeID = value;
		}
		
		public function get PrimaryClaimsPayerID():String
		{
			return _PrimaryClaimsPayerID;
		}
		
		public function set PrimaryClaimsPayerID(value:String):void
		{
			_PrimaryClaimsPayerID = value;
		}
		
		public function get PrimaryEligibilityPayerID():String
		{
			return _PrimaryEligibilityPayerID;
		}
		
		public function set PrimaryEligibilityPayerID(value:String):void
		{
			_PrimaryEligibilityPayerID = value;
		}
		
		public function get PrimaryNationalPlanID():String
		{
			return _PrimaryNationalPlanID;
		}
		
		public function set PrimaryNationalPlanID(value:String):void
		{
			_PrimaryNationalPlanID = value;
		}
		
		public function get SecondaryEDIReceiverTypeID():String
		{
			return _SecondaryEDIReceiverTypeID;
		}
		
		public function set SecondaryEDIReceiverTypeID(value:String):void
		{
			_SecondaryEDIReceiverTypeID = value;
		}
		
		public function get SecondaryClaimsPayerID():String
		{
			return _SecondaryClaimsPayerID;
		}
		
		public function set SecondaryClaimsPayerID(value:String):void
		{
			_SecondaryClaimsPayerID = value;
		}
		
		public function get SecondaryEligibilityPayerID():String
		{
			return _SecondaryEligibilityPayerID;
		}
		
		public function set SecondaryEligibilityPayerID(value:String):void
		{
			_SecondaryEligibilityPayerID = value;
		}
		
		public function get SecondaryNationalPlanID():String
		{
			return _SecondaryNationalPlanID;
		}
		
		public function set SecondaryNationalPlanID(value:String):void
		{
			_SecondaryNationalPlanID = value;
		}
		
		public function get MaxTransactions():String
		{
			return _MaxTransactions;
		}
		
		public function set MaxTransactions(value:String):void
		{
			_MaxTransactions = value;
		}
		
		public function get Extra1():String
		{
			return _Extra1;
		}
		
		public function set Extra1(value:String):void
		{
			_Extra1 = value;
		}
		
		public function get Extra2():String
		{
			return _Extra2;
		}
		
		public function set Extra2(value:String):void
		{
			_Extra2 = value;
		}
		
		public function get Crossover():Boolean
		{
			return _Crossover;
		}
		
		public function set Crossover(value:Boolean):void
		{
			_Crossover = value;
		}
		
		public function get DelaySecondaryBilling():Boolean
		{
			return _DelaySecondaryBilling;
		}
		
		public function set DelaySecondaryBilling(value:Boolean):void
		{
			_DelaySecondaryBilling = value;
		}
		
		public function get SendOrderingProvider():Boolean
		{
			return _SendOrderingProvider;
		}
		
		public function set SendOrderingProvider(value:Boolean):void
		{
			_SendOrderingProvider = value;
		}
		
		public function get SendPracticeTaxonomy():Boolean
		{
			return _SendPracticeTaxonomy;
		}
		
		public function set SendPracticeTaxonomy(value:Boolean):void
		{
			_SendPracticeTaxonomy = value;
		}

		public function get AlternateIDNumber():String
		{
			return _AlternateIDNumber;
		}

		public function set AlternateIDNumber(value:String):void
		{
			_AlternateIDNumber = value;
		}

		public function get PatientSignatureOnFile():String
		{
			return _PatientSignatureOnFile;
		}
		
		public function set PatientSignatureOnFile(value:String):void
		{
			_PatientSignatureOnFile = value;
		}

		public function get Type():String
		{
			return _Type;
		}

		public function set Type(value:String):void
		{
			_Type = value;
		}

		public function get ModifiedBy():String
		{
			return _ModifiedBy;
		}

		public function set ModifiedBy(value:String):void
		{
			_ModifiedBy = value;
		}

		public function get CreatedBy():String
		{
			return _CreatedBy;
		}

		public function set CreatedBy(value:String):void
		{
			_CreatedBy = value;
		}

		public function get IsDeleted():String
		{
			return _IsDeleted;
		}

		public function set IsDeleted(value:String):void
		{
			_IsDeleted = value;
		}

		public function get StatusTypeID():String
		{
			return _StatusTypeID;
		}

		public function set StatusTypeID(value:String):void
		{
			_StatusTypeID = value;
		}

		
		
	}
	
	
}