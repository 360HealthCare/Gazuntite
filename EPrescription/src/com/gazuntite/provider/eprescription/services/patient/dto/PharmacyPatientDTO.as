package com.gazuntite.provider.eprescription.services.patient.dto
{
	[Bindable]
	public class PharmacyPatientDTO
	{
		public function PharmacyPatientDTO()
		{
		}

		private  var m_sLastName:String;
		private  var m_sFirstName:String;
		private  var m_sDOB:String;
		private  var m_sSSN:String;
		private  var m_sGender:String;
		private  var m_sGaxenPatientID:String;
		
		public function FromXML( x:XML ):void
		{
			LastName 			= x.@['LastName'];
			FirstName 			= x.@['FirstName'];
			DOB 				= x.@['DOB'];
			SSN 				= x.@['SSN'];
			Gender 				= x.@['Gender'];
			GaxenPatientID 		= x.@['GaxenPatientID'];
		}

		//********************** GETTER & SETTER *****************************
		
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

		public function get DOB():String
		{
			return m_sDOB;
		}

		public function set DOB(value:String):void
		{
			m_sDOB = value;
		}

		public function get SSN():String
		{
			return m_sSSN;
		}

		public function set SSN(value:String):void
		{
			m_sSSN = value;
		}

		public function get Gender():String
		{
			return m_sGender;
		}

		public function set Gender(value:String):void
		{
			m_sGender = value;
		}

		public function get GaxenPatientID():String
		{
			return m_sGaxenPatientID;
		}

		public function set GaxenPatientID(value:String):void
		{
			m_sGaxenPatientID = value;
		}


	}
}