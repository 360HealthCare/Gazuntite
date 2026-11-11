package com.gazuntite.provider.eprescription.services.patient.dto
{
	[Bindable]
	public class PharmacyDTO
	{
		public function PharmacyDTO()
		{
		}
		
		private var m_sPharmaciesID:String;
		private var m_srownum:String;
		private var m_sNCPDPID:String;
		private var m_sStoreName:String;
		private var m_sAddressLine1:String;
		private var m_sCity:String;
		private var m_sState:String;
		private var m_sZip:String;
		private var m_sPhonePrimary:String;
		private var m_sNPI:String;
		
		public function FromXML( x:XML ):void
		{
			
			PharmaciesID 	= x.@['PharmaciesID'];
			rownum 			= x.@['rownum'];
			NCPDPID 		= x.@['NCPDPID'];
			StoreName 		= x.@['StoreName'];
			AddressLine1 	= x.@['AddressLine1'];
			City 			= x.@['City'];
			State 			= x.@['State'];
			Zip 			= x.@['Zip'];
			PhonePrimary 	= x.@['Phone'];
			NPI 			= x.@['NPI'];
			
		}


		//********************** GETTER & SETTER *****************************
		public function get PharmaciesID():String
		{
			return m_sPharmaciesID;
		}

		public function set PharmaciesID(value:String):void
		{
			m_sPharmaciesID = value;
		}

		public function get rownum():String
		{
			return m_srownum;
		}

		public function set rownum(value:String):void
		{
			m_srownum = value;
		}

		public function get NCPDPID():String
		{
			return m_sNCPDPID;
		}

		public function set NCPDPID(value:String):void
		{
			m_sNCPDPID = value;
		}

		public function get StoreName():String
		{
			return m_sStoreName;
		}

		public function set StoreName(value:String):void
		{
			m_sStoreName = value;
		}

		public function get AddressLine1():String
		{
			return m_sAddressLine1;
		}

		public function set AddressLine1(value:String):void
		{
			m_sAddressLine1 = value;
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

		public function get Zip():String
		{
			return m_sZip;
		}

		public function set Zip(value:String):void
		{
			m_sZip = value;
		}

		public function get PhonePrimary():String
		{
			return m_sPhonePrimary;
		}

		public function set PhonePrimary(value:String):void
		{
			m_sPhonePrimary = value;
		}

		public function get NPI():String
		{
			return m_sNPI;
		}

		public function set NPI(value:String):void
		{
			m_sNPI = value;
		}

		
	}
}