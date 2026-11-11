package com.gazuntite.provider.live.services.billing.claimManagement.dto
{
	import com.gazuntite.common.util.xml.XmlConstants;
	import com.gazuntite.common.util.xml.XmlUtils;
	
	[Bindable]
	public class CMSearchDTO
	{
		private var m_sType:String;
		private var m_sListType:String;
		private var m_sInsOrganizationID:String;
		private var m_sInsuranceTypeId:String;
		private var m_sStatusTypeID:String;
		private var m_sMediaTypeID:String;
		private var m_sClaimID:String;
		private var m_sEDIReceiverTypeID:String;
		private var m_sPatientID:String;
		private var m_sQuivusID:String;
		private var m_sVisitDate:String;
		private var m_sDateCreated:String;
		private var m_sBillDate:String;
		private var m_sBatchID:String;
		private var m_sExcludeDone:String;
		private var m_sClinicBranchId:String;
		private var m_sPageNo:String;
		private var m_sSearchString:String;
		
		public function CMSearchDTO()
		{
		}
		
		public function ToXML():XML
		{
			var x:XML = XmlUtils.getNodeByTagName( "ClaimSearch" );
			
			x.@[XmlConstants.TYPE]						= Type;			
			x.@[XmlConstants.LISTTYPE]					= ListType;
			x.@[XmlConstants.PATIENTID]					= PatientID;
			x.@[XmlConstants.BATCHID]					= BatchID;			
			x.@[XmlConstants.PAGENO]					= PageNo;			
			x.@[XmlConstants.CLAIMTID]					= ClaimID;
			x.@[XmlConstants.INSORGANIZATIONID]			= InsOrganizationID;
			x.@[XmlConstants.INSURANCETYPEID]			= InsuranceTypeId;
			x.@[XmlConstants.STATUSTYPEID]				= StatusTypeID;			
			x.@[XmlConstants.MEDIATYPEID]				= MediaTypeID;
			x.@[XmlConstants.CLINICBRANCHID]			= ClinicBranchId;
			x.@[XmlConstants.EDIRECEIVERTYPEID]			= EDIReceiverTypeID;
			x.@[XmlConstants.EXCLUDEDONE]				= ExcludeDone;	
			x.@[XmlConstants.DATECREATED]				= DateCreated;	
			x.@[XmlConstants.VISITDATE]					= VisitDate;
			x.@[XmlConstants.QUIVUS_ID]					= QuivusID;
			x.@[XmlConstants.BILLDATE]					= BillDate;
			x.@[XmlConstants.SEARCHSTRING]				= SearchString;
			
			return x;
		}
		
		public function get SearchString():String
		{
			return m_sSearchString;
		}
		
		public function set SearchString(value:String):void
		{			
			m_sSearchString = value;
		}
		
		public function get VisitDate():String
		{
			return m_sVisitDate;
		}
		
		public function set VisitDate(value:String):void
		{			
			m_sVisitDate = value;
		}
		
		public function get QuivusID():String
		{
			return m_sQuivusID;
		}
		
		public function set QuivusID(value:String):void
		{			
			m_sQuivusID = value;
		}
		
		public function get Type():String
		{
			return m_sType;
		}
		
		public function set Type(value:String):void
		{			
			m_sType = value;
		}
		
		public function get ListType():String
		{
			return m_sListType;
		}
		
		public function set ListType(value:String):void
		{
			m_sListType = value;
		}
		
		public function get BillDate():String
		{
			return m_sBillDate;
		}
		
		public function set BillDate(value:String):void
		{			
			m_sBillDate = value.substring(0,10);
		}
		
		public function get PageNo():String
		{
			return m_sPageNo;
		}
		
		public function set PageNo(value:String):void
		{
			m_sPageNo = value;
		}
		
		public function get ClaimID():String
		{
			return m_sClaimID;
		}
		
		public function set ClaimID(value:String):void
		{
			m_sClaimID = value;
		}
		
		public function get ClinicBranchId():String
		{
			return m_sClinicBranchId;
		}
		
		public function set ClinicBranchId(value:String):void
		{
			m_sClinicBranchId = value;
		}
		
		public function get InsOrganizationID():String
		{
			return m_sInsOrganizationID;
		}
		
		public function set InsOrganizationID(value:String):void
		{
			m_sInsOrganizationID = value;
		}
		
		public function get InsuranceTypeId():String
		{
			return m_sInsuranceTypeId;
		}
		
		public function set InsuranceTypeId(value:String):void
		{
			m_sInsuranceTypeId = value;
		}
		
		public function get StatusTypeID():String
		{
			return m_sStatusTypeID;
		}
		
		public function set StatusTypeID(value:String):void
		{			
			m_sStatusTypeID = value;
		}
		
		public function get MediaTypeID():String
		{
			return m_sMediaTypeID;
		}
		
		public function set MediaTypeID(value:String):void
		{
			m_sMediaTypeID = value;
		}
		
		public function get DateCreated():String
		{
			return m_sDateCreated;
		}
		public function set DateCreated(value:String):void
		{
			m_sDateCreated = value;
		}
		
		public function get EDIReceiverTypeID():String
		{
			return m_sEDIReceiverTypeID;
		}
		
		public function set EDIReceiverTypeID(value:String):void
		{
			m_sEDIReceiverTypeID = value;
		}
		
		public function get BatchID():String
		{
			return m_sBatchID;
		}
		
		public function set BatchID(value:String):void
		{
			m_sBatchID = value;
		}
		
		public function get ExcludeDone():String
		{
			return m_sExcludeDone;
		}
		
		public function set ExcludeDone(value:String):void
		{			
			m_sExcludeDone = value;
		}
		
		public function get PatientID():String
		{
			return m_sPatientID;
		}
		
		public function set PatientID(value:String):void
		{
			m_sPatientID = value;
		}
	}
}