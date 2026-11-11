package com.gazuntite.provider.live.services.billing.superBill.dto
{
	import com.gazuntite.common.util.xml.XmlConstants;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.provider.live.services.billing.superBill.model.SuperBillModelLocator;
	import com.gazuntite.utils.UtilityFunctions;
	
	[Bindable]
	public class SuperBillProcedureInfoDTO
	{
		private var m_sProcedureID:String;
		private var m_sVisitID:String;
		private var m_sPatientID:String;
		private var m_sCPTMedicalTypeID:String;
		private var m_sProcedureCode:String;
		private var m_sProcedureDescription:String;
		private var m_sCreatedBy:String;
		private var m_sModifiedBy:String;
		private var m_sVisitDate:String;		
		private var m_sIncludeInBilling:String;
		private var m_sIsCreatedFromSuperBill:String;
		private var m_sModifier1:String;
		private var m_sModifier2:String;
		private var m_sModifier3:String;
		private var m_sModifier4:String;
		
		private var m_sModifierTypeId1:String;
		private var m_sModifierTypeId2:String;
		private var m_sModifierTypeId3:String;
		private var m_sModifierTypeId4:String;
		
		private var m_sFee:String;
		private var m_sUnit:String;	
		private var m_sIsDeleted:String;
		
		public function get IsDeleted():String
		{
			return m_sIsDeleted;
		}
		
		public function set IsDeleted(value:String):void
		{
			m_sIsDeleted = value;
		}
		
		public function get ProcedureID():String
		{
			return m_sProcedureID;
		}
		
		public function set ProcedureID(value:String):void
		{
			m_sProcedureID = value;
		}
		
		public function get VisitID():String
		{
			return m_sVisitID;
		}
		
		public function set VisitID(value:String):void
		{
			m_sVisitID = value;
		}
		
		public function get PatientID():String
		{
			return m_sPatientID;
		}
		
		public function set PatientID(value:String):void
		{
			m_sPatientID = value;
		}
		
		public function get CPTMedicalTypeID():String
		{
			return m_sCPTMedicalTypeID;
		}
		
		public function set CPTMedicalTypeID(value:String):void
		{
			m_sCPTMedicalTypeID = value;
		}
		
		public function get ProcedureCode():String
		{
			return m_sProcedureCode;
		}
		
		public function set ProcedureCode(value:String):void
		{
			m_sProcedureCode = value;
		}
		
		public function get ProcedureDescription():String
		{
			return m_sProcedureDescription;
		}
		
		public function set ProcedureDescription(value:String):void
		{
			m_sProcedureDescription = value;
		}
		
		public function get CreatedBy():String
		{
			return m_sCreatedBy;
		}
		
		public function set CreatedBy(value:String):void
		{
			m_sCreatedBy = value;
		}
		
		public function get ModifiedBy():String
		{
			return m_sModifiedBy;
		}
		
		public function set ModifiedBy(value:String):void
		{
			m_sModifiedBy = value;
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
		
		public function get IncludeInBilling():String
		{
			return m_sIncludeInBilling;
		}
		
		public function set IncludeInBilling(value:String):void
		{
			m_sIncludeInBilling = value;
		}
		
		public function get IsCreatedFromSuperBill():String
		{
			return m_sIsCreatedFromSuperBill;
		}
		
		public function set IsCreatedFromSuperBill(value:String):void
		{
			m_sIsCreatedFromSuperBill = value;
		}
		
		public function get Modifier1():String
		{
			return m_sModifier1;
		}
		
		public function set Modifier1(value:String):void
		{
			m_sModifier1 = value;
		}
		
		public function get Modifier2():String
		{
			return m_sModifier2;
		}
		
		public function set Modifier2(value:String):void
		{
			m_sModifier2 = value;
		}
		
		public function get Modifier3():String
		{
			return m_sModifier3;
		}
		
		public function set Modifier3(value:String):void
		{
			m_sModifier3 = value;
		}
		
		public function get Modifier4():String
		{
			return m_sModifier4;
		}
		
		public function set Modifier4(value:String):void
		{
			m_sModifier4 = value;
		}
		
		public function get ModifierTypeId1():String
		{
			return m_sModifierTypeId1;
		}
		
		public function set ModifierTypeId1(value:String):void
		{
			m_sModifierTypeId1 = value;
		}
		
		public function get ModifierTypeId2():String
		{
			return m_sModifierTypeId2;
		}
		
		public function set ModifierTypeId2(value:String):void
		{
			m_sModifierTypeId2 = value;
		}
		
		public function get ModifierTypeId3():String
		{
			return m_sModifierTypeId3;
		}
		
		public function set ModifierTypeId3(value:String):void
		{
			m_sModifierTypeId3 = value;
		}
		
		public function get ModifierTypeId4():String
		{
			return m_sModifierTypeId4;
		}
		
		public function set ModifierTypeId4(value:String):void
		{
			m_sModifierTypeId4 = value;
		}
		
		public function get Fee():String
		{
			return m_sFee;
		}
		
		public function set Fee(value:String):void
		{
			m_sFee = String(Number(value).toFixed(2));
		}
		
		public function get Unit():String
		{
			return m_sUnit;
		}
		
		public function set Unit(value:String):void
		{
			m_sUnit = String(Number(value).toFixed(2));
		}
		
		public function FromXML( x:XML ):void
		{
			ProcedureID 					= x.@[XmlConstants.CPTPROCEDUREID];
			VisitID 						= x.@[XmlConstants.CPTVISITID];
			PatientID 						= x.@[XmlConstants.CPTPATIENTID];			
			CPTMedicalTypeID 				= x.@[XmlConstants.CPTMEDICALTYPEID];
			ProcedureCode 					= x.@[XmlConstants.CPTPROCEDURECODE];
			ProcedureDescription 			= x.@[XmlConstants.PROCEDUREDESCRIPTION];			
			CreatedBy 						= x.@[XmlConstants.CPTCREATEDBY];
			ModifiedBy 						= x.@[XmlConstants.CPTMODIFIEDBY];			
			VisitDate 						= x.@[XmlConstants.CPTVISITDATE];
			IncludeInBilling 				= x.@[XmlConstants.INCLUDEINBILLING];
			IsCreatedFromSuperBill 			= x.@[XmlConstants.ISCREATEDFROMSUPERBILL];
			Modifier1 						= x.@[XmlConstants.MODIFIER1];
			Modifier2 						= x.@[XmlConstants.MODIFIER2];
			Modifier3 						= x.@[XmlConstants.MODIFIER3];
			Modifier4 						= x.@[XmlConstants.MODIFIER4];
			ModifierTypeId1 				= x.@[XmlConstants.MODIFIERTYPEID1];
			ModifierTypeId2 				= x.@[XmlConstants.MODIFIERTYPEID2];
			ModifierTypeId3 				= x.@[XmlConstants.MODIFIERTYPEID3];
			ModifierTypeId4 				= x.@[XmlConstants.MODIFIERTYPEID4];			
			Fee 							= x.@[XmlConstants.FEE];
			Unit 							= x.@[XmlConstants.UNIT];
			IsDeleted 						= x.@[XmlConstants.CPTISDELETED];
			Type 						    = x.@[XmlConstants.TYPE];
		}		
		
		public var model : SuperBillModelLocator = SuperBillModelLocator.getInstance();
		
		private var m_sType:String;
		public function get Type():String
		{
			return m_sType;
		}
		
		public function set Type(value:String):void
		{
			m_sType = value;
		}
		
		public function ToXML():XML
		{
			var x:XML = XmlUtils.getNodeByTagName( "Procedure" );
			
			x.@[XmlConstants.CPTPROCEDUREID]			= ProcedureID;	
			x.@[XmlConstants.CPTVISITID]				= VisitID;
			x.@[XmlConstants.CPTPATIENTID]				= PatientID;			
			x.@[XmlConstants.CPTMEDICALTYPEID]			= CPTMedicalTypeID;
			x.@[XmlConstants.CPTPROCEDURECODE]			= ProcedureCode;
			x.@[XmlConstants.PROCEDUREDESCRIPTION]		= ProcedureDescription;			
			x.@[XmlConstants.CPTCREATEDBY]				= CreatedBy;
			x.@[XmlConstants.CPTMODIFIEDBY]				= ModifiedBy;			
			x.@[XmlConstants.CPTVISITDATE]				= UtilityFunctions.FormatDate(VisitDate);
			x.@[XmlConstants.INCLUDEINBILLING]			= IncludeInBilling;
			x.@[XmlConstants.ISCREATEDFROMSUPERBILL]	= IsCreatedFromSuperBill;
			x.@[XmlConstants.MODIFIER1]					= Modifier1;
			x.@[XmlConstants.MODIFIER2]					= Modifier2;
			x.@[XmlConstants.MODIFIER3]					= Modifier3;
			x.@[XmlConstants.MODIFIER4]					= Modifier4;
			x.@[XmlConstants.MODIFIERTYPEID1]			= ModifierTypeId1;
			x.@[XmlConstants.MODIFIERTYPEID2]			= ModifierTypeId2;
			x.@[XmlConstants.MODIFIERTYPEID3]			= ModifierTypeId3;
			x.@[XmlConstants.MODIFIERTYPEID4]			= ModifierTypeId4;
			x.@[XmlConstants.FEE]						= Fee;
			x.@[XmlConstants.UNIT]						= Unit;			
			x.@[XmlConstants.CPTISDELETED]				= IsDeleted;			
			x.@[XmlConstants.TYPE]					    = Type;
			
			return x;
		}	
		
	}
}