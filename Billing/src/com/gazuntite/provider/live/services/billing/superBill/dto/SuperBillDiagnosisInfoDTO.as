package com.gazuntite.provider.live.services.billing.superBill.dto
{
	import com.gazuntite.common.util.xml.XmlConstants;
	import com.gazuntite.common.util.xml.XmlUtils;
	[Bindable]
	[Bindable]
	public class SuperBillDiagnosisInfoDTO
	{
		private var m_sDiagnosisID:String;
		private var m_sVisitID:String;
		private var m_sPatientID:String;
		private var m_sICDCodeID:String;
		private var m_sICDCodeName:String;
		private var m_sICDCodeDescription:String;
		private var m_sCreatedBy:String;
		private var m_sModifiedBy:String;
		private var m_sVisitDate:String;		
		private var m_sIncludeInBilling:String;
		private var m_sIsCreatedFromSuperBill:String;
		
		public function get IsCreatedFromSuperBill():String
		{
			return m_sIsCreatedFromSuperBill;
		}
		
		public function set IsCreatedFromSuperBill(value:String):void
		{
			m_sIsCreatedFromSuperBill = value;
		}
		
		public function get DiagnosisID():String
		{
			return m_sDiagnosisID;
		}
		
		public function set DiagnosisID(value:String):void
		{
			m_sDiagnosisID = value;
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
		
		public function get ICDCodeID():String
		{
			return m_sICDCodeID;
		}
		
		public function set ICDCodeID(value:String):void
		{
			m_sICDCodeID = value;
		}
		
		public function get ICDCodeName():String
		{
			return m_sICDCodeName;
		}
		
		public function set ICDCodeName(value:String):void
		{
			m_sICDCodeName = value;
		}
		
		public function get ICDCodeDescription():String
		{
			return m_sICDCodeDescription;
		}
		
		public function set ICDCodeDescription(value:String):void
		{
			m_sICDCodeDescription = value;
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
		
		public function FromXML( x:XML ):void
		{
			DiagnosisID 					= x.@[XmlConstants.DIAGNOSISID];
			VisitID 						= x.@[XmlConstants.DXVISITID];
			PatientID 						= x.@[XmlConstants.DXPATIENTID];			
			ICDCodeID		 				= x.@[XmlConstants.ICDCODEID];
			ICDCodeDescription 				= x.@[XmlConstants.ICDCODEDESCRIPTION];
			ICDCodeName 					= x.@[XmlConstants.ICDCODENAME];			
			CreatedBy 						= x.@[XmlConstants.DXCREATEDBY];
			ModifiedBy 						= x.@[XmlConstants.DXMODIFIEDBY];			
			VisitDate 						= x.@[XmlConstants.DXVISITDATE];
			IncludeInBilling 				= x.@[XmlConstants.DXINCLUDEINBILLING];
			IsCreatedFromSuperBill			= x.@[XmlConstants.DXISCREATEDFROMSUPERBILL];
		}		
		
		public function ToXML():XML
		{
			var x:XML = XmlUtils.getNodeByTagName( "Diagnosis" );
			
			x.@[XmlConstants.DIAGNOSISID]				= DiagnosisID;	
			x.@[XmlConstants.DXVISITID]					= VisitID;
			x.@[XmlConstants.DXPATIENTID]				= PatientID;			
			x.@[XmlConstants.ICDCODEID]					= ICDCodeID;
			x.@[XmlConstants.ICDCODENAME]				= ICDCodeName;
			x.@[XmlConstants.ICDCODEDESCRIPTION]		= ICDCodeDescription;			
			x.@[XmlConstants.DXCREATEDBY]				= CreatedBy;
			x.@[XmlConstants.DXMODIFIEDBY]				= ModifiedBy;			
			x.@[XmlConstants.DXVISITDATE]				= VisitDate;
			x.@[XmlConstants.DXINCLUDEINBILLING]		= IncludeInBilling;	
			x.@[XmlConstants.DXISCREATEDFROMSUPERBILL]  = IsCreatedFromSuperBill;
			
			return x;
		}	
	}
}