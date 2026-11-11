package com.gazuntite.common.dto
{
	import com.gazuntite.common.util.xml.XmlConstants;

	[Bindable]
	public class InsOrganizationDTO
	{
		private var m_sInsuranceName:String;
		private var m_sAddress:String;
		private var m_sInsOrganizationID:String;
		private var m_sCity:String;
		private var m_sStateName:String;
		private var m_sZIP:String;
		private var m_sState:String;
		private var m_sPhone:String;
		private var m_sAlternatePhone:String;
		private var m_sFAX:String;
		private var m_sEmail:String;
		private var m_sContactPerson:String;
		private var m_sIDNumber:String;
		private var m_sStatus:String;
		
		public function InsOrganizationDTO()
		{
		}
		
		public function FromXML( x:XML ):void
		{
			InsuranceName 				= x.@[XmlConstants.INSURANCENAME];
			InsOrganizationID 			= x.@[XmlConstants.INSORGANIZATIONID];
			Address 					= x.@[XmlConstants.ADDRESS];
			City 						= x.@[XmlConstants.CITY];			
			StateName 					= x.@[XmlConstants.STATENAME];
			ZIP 						= x.@[XmlConstants.ZIP];			
			State		 				= x.@[XmlConstants.STATE];
			Phone 						= x.@[XmlConstants.PHONE];
			AlternatePhone				= x.@[XmlConstants.ALTERNATEPHONE];
			FAX							= x.@[XmlConstants.FAX];	
			Email						= x.@[XmlConstants.EMAIL];	
			ContactPerson				= x.@[XmlConstants.CONTACTPERSON];
			IDNumber					= x.@[XmlConstants.IDNUMBER];	
			Status						= x.@[XmlConstants.STATUS];
			
		}
		
		public function get Status():String
		{
			return m_sStatus;
		}
		
		public function set Status(value:String):void
		{
			m_sStatus = value;
		}
		
		public function get IDNumber():String
		{
			return m_sIDNumber;
		}
		
		public function set IDNumber(value:String):void
		{
			m_sIDNumber = value;
		}
		
		public function get ContactPerson():String
		{
			return m_sContactPerson;
		}
		
		public function set ContactPerson(value:String):void
		{
			m_sContactPerson = value;
		}
		
		public function get InsuranceName():String
		{
			return m_sInsuranceName;
		}
		
		public function set InsuranceName(value:String):void
		{
			m_sInsuranceName = value;
		}
		
		public function get Address():String
		{
			return m_sAddress;
		}
		
		public function set Address(value:String):void
		{
			m_sAddress = value;
		}
		
		public function get InsOrganizationID():String
		{
			return m_sInsOrganizationID;
		}
		
		public function set InsOrganizationID(value:String):void
		{
			m_sInsOrganizationID = value;
		}		
		
		
		public function get City():String
		{
			return m_sCity;
		}
		
		public function set City(value:String):void
		{
			m_sCity = value;
		}
		
		public function get StateName():String
		{
			return m_sStateName;
		}
		
		public function set StateName(value:String):void
		{			
			m_sStateName = value;
		}
		
		public function get ZIP():String
		{
			return m_sZIP;
		}
		
		public function set ZIP(value:String):void
		{
			m_sZIP = value;
		}
		
		public function get State():String
		{
			return m_sState;
		}
		public function set State(value:String):void
		{
			m_sState = value;
		}
		
		public function get Phone():String
		{
			return m_sPhone;
		}
		
		public function set Phone(value:String):void
		{
			m_sPhone = value;
		}
		
		public function get AlternatePhone():String
		{
			return m_sAlternatePhone;
		}
		
		public function set AlternatePhone(value:String):void
		{
			m_sAlternatePhone = value;
		}
		
		public function get FAX():String
		{
			return m_sFAX;
		}
		
		public function set FAX(value:String):void
		{			
			m_sFAX = value;
		}
		
		public function get Email():String
		{
			return m_sEmail;
		}
		
		public function set Email(value:String):void
		{
			m_sEmail = value;
		}
	}
}