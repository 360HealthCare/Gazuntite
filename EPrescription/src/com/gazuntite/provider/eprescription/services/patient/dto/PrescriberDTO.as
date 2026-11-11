package com.gazuntite.provider.eprescription.services.patient.dto
{
	[Bindable]
	public class PrescriberDTO
	{
		public function PrescriberDTO()
		{
		}
		
		private var m_sNPI:String;
		private var m_sLastName:String;
		private var m_sFirstName:String;
		private var m_sPhoneNumber:String;
		private var m_sLIECENCENUMBER:String;

		public function FromXML( x:XML ):void
		{
			NPI 			= x.@['NPI'];
			LastName 		= x.@['LastName'];
			FirstName 		= x.@['FirstName'];
			PhoneNumber 	= x.@['PhoneNumber'];
			LIECENCENUMBER 	= x.@['LIECENCENUMBER'];
		}
		//********************** GETTER & SETTER *****************************
		public function get NPI():String
		{
			return m_sNPI;
		}

		public function set NPI(value:String):void
		{
			m_sNPI = value;
		}

		public function get LastName():String
		{
			return m_sLastName;
		}

		public function set LastName(value:String):void
		{
			m_sLastName = value;
		}

		public function get FirstName():String
		{
			return m_sFirstName;
		}

		public function set FirstName(value:String):void
		{
			m_sFirstName = value;
		}

		public function get PhoneNumber():String
		{
			return m_sPhoneNumber;
		}

		public function set PhoneNumber(value:String):void
		{
			m_sPhoneNumber = value;
		}

		public function get LIECENCENUMBER():String
		{
			return m_sLIECENCENUMBER;
		}

		public function set LIECENCENUMBER(value:String):void
		{
			m_sLIECENCENUMBER = value;
		}


	}
}