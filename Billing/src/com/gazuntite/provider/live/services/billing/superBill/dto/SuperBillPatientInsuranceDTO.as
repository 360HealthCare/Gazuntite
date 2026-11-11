package com.gazuntite.provider.live.services.billing.superBill.dto
{
	import com.gazuntite.common.util.QSConstants;
	import com.gazuntite.common.util.xml.XmlConstants;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.utils.UtilityFunctions;

	[Bindable]
	public class SuperBillPatientInsuranceDTO
	{
		private var m_sInsOrganizationID:String;
		private var m_sInsuranceName:String;
		private var m_sExpiryDate:String;
		private var m_sIsEligible:String;
		private var m_sInsuranceTypeName:String;
		private var m_sPolicyNumber:String;
		private var m_sInsurancePlan:String;
		private var m_sCopay:String;
		
		public function FromXML( x:XML ):void
		{
			InsOrganizationID				= x.@[XmlConstants.INSORGANIZATIONID];
			InsuranceName 					= x.@[XmlConstants.INSURANCENAME];			
			ExpiryDate 						= x.@[XmlConstants.EXPIRYDATE];
			IsEligible 						= x.@[XmlConstants.ISELIGIBLE];			
			InsuranceTypeName 				= x.@[XmlConstants.INSURANCETYPENAME];
			PolicyNumber 					= x.@[XmlConstants.POLICYNUMBER];
			InsurancePlan 					= x.@[XmlConstants.INSURANCEPLAN];
			Copay 							= x.@[XmlConstants.COPAY];
			GroupNumber						= x.@[XmlConstants.GROUPNUMBER];
			InsuranceNatureId			    = x.@[XmlConstants.INSURANCENATUREID];
			NatureCode			    		= x.@[XmlConstants.NATURECODE];
			NatureDescription			    = x.@[XmlConstants.NATUREDESCRIPTION];
			Address							= x.@[XmlConstants.ADDRESS];
			City							= x.@[XmlConstants.CITY];
			State							= x.@[XmlConstants.STATE];
			ZIP								= x.@[XmlConstants.ZIP];
			
		}		
		
		public function ToXML():XML
		{
			var x:XML = XmlUtils.getNodeByTagName( "Insurance" );
			
			x.@[XmlConstants.INSORGANIZATIONID]					= InsOrganizationID;			
			x.@[XmlConstants.INSURANCENAME]						= InsuranceName;
			
			if( UtilityFunctions.IsNullOrEmpty( ExpiryDate ) || ExpiryDate.indexOf("N") > -1)
				ExpiryDate = UtilityFunctions.FormatDate(QSConstants.NULL_DATE);			
			x.@[XmlConstants.EXPIRYDATE]						= UtilityFunctions.FormatDate(ExpiryDate);
			
			x.@[XmlConstants.ISELIGIBLE]						= IsEligible;
			x.@[XmlConstants.INSURANCETYPENAME]					= InsuranceTypeName;
			x.@[XmlConstants.POLICYNUMBER]						= PolicyNumber;
			x.@[XmlConstants.INSURANCEPLAN]						= InsurancePlan;
			x.@[XmlConstants.COPAY]								= Copay;
			x.@[XmlConstants.ADDRESS]							= Address;
			x.@[XmlConstants.CITY]								= City;
			x.@[XmlConstants.STATE]								= State;
			x.@[XmlConstants.ZIP]								= ZIP;
			x.@[XmlConstants.NATURECODE]						= NatureCode;
			x.@[XmlConstants.GROUPNUMBER]						= GroupNumber;
			
			return x;
		}
		

		private var m_sAddress:String;
		private var m_sCity:String;
		private var m_sState:String;
		private var m_sZIP:String;
		
		private var m_sGroupNumber:String;
		private var m_sInsuranceNatureId:String;
		private var m_sNatureCode:String;
		private var m_sNatureDescription:String;
		
		public function get NatureDescription():String
		{
			return m_sNatureDescription;
		}
		
		public function set NatureDescription(value:String):void
		{
			m_sNatureDescription = value;
		}
		
		public function get NatureCode():String
		{
			return m_sNatureCode;
		}
		
		public function set NatureCode(value:String):void
		{
			m_sNatureCode = value;
		}
		
		public function get InsuranceNatureId():String
		{
			return m_sInsuranceNatureId;
		}
		
		public function set InsuranceNatureId(value:String):void
		{
			m_sInsuranceNatureId = value;
		}
		
		//private var m_sSubscriberInfo:PatientSubscriberDTO;
		
		public function get GroupNumber():String
		{
			return m_sGroupNumber;
		}
		
		public function set GroupNumber(value:String):void
		{
			m_sGroupNumber = value;
		}
		
		public function get Address():String
		{
			return m_sAddress;
		}
		
		public function set Address(value:String):void
		{
			m_sAddress = value;
		}
		
		public function get City():String
		{
			return m_sCity;
		}
		
		public function set City(value:String):void
		{
			m_sCity = value;
		}
		
		public function get State():String
		{
			return m_sState;
		}
		
		public function set State(value:String):void
		{
			m_sState = value;
		}
		
		public function get ZIP():String
		{
			return m_sZIP;
		}
		
		public function set ZIP(value:String):void
		{
			m_sZIP = value;
		}
		
		public function get InsOrganizationID():String
		{
			return m_sInsOrganizationID;
		}
		
		public function set InsOrganizationID(value:String):void
		{
			m_sInsOrganizationID = value;
		}
		
		public function get Copay():String
		{
			return m_sCopay;
		}
		
		public function set Copay(value:String):void
		{
			m_sCopay = value;
		}
		
		public function get InsuranceName():String
		{
			return m_sInsuranceName;
		}
		
		public function set InsuranceName(value:String):void
		{
			m_sInsuranceName = value;
		}
		
		public function get ExpiryDate():String
		{
			return m_sExpiryDate;
		}
		
		public function set ExpiryDate(value:String):void
		{
			value = UtilityFunctions.FormatDate(value.substr(0,10),"MM/DD/YYYY");
			m_sExpiryDate = value;
		}
		public function get IsEligible():String
		{
			return m_sIsEligible;
		}
		
		public function set IsEligible(value:String):void
		{
			m_sIsEligible = value;
		}
		public function get InsuranceTypeName():String
		{
			return m_sInsuranceTypeName;
		}
		
		public function set InsuranceTypeName(value:String):void
		{
			m_sInsuranceTypeName = value;
		}
		public function get PolicyNumber():String
		{
			return m_sPolicyNumber;
		}
		
		public function set PolicyNumber(value:String):void
		{			
			m_sPolicyNumber = value;
		}
		public function get InsurancePlan():String
		{
			return m_sInsurancePlan;
		}
		
		public function set InsurancePlan(value:String):void
		{
			m_sInsurancePlan = value;
		}
	}
}