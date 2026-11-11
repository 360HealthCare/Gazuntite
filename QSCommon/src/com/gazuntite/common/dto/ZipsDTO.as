package com.gazuntite.common.dto
{
	[Bindable]
	public class ZipsDTO
	{
		public function ZipsDTO()
		{
		}
		
		private var m_sZipCodeID:String;
		private var m_sZipCode:String;
		private var m_sStateID:String;
		
		
		public function FromXML( x:XML ):void
		{
			ZipCodeID 					= x.@['ZipCodeID'];			
			ZipCode 					= x.@['ZipCode'];			
			StateID 					= x.@['StateID'];			
		}

		public function get ZipCodeID():String
		{
			return m_sZipCodeID;
		}

		public function set ZipCodeID(value:String):void
		{
			m_sZipCodeID = value;
		}

		public function get ZipCode():String
		{
			return m_sZipCode;
		}

		public function set ZipCode(value:String):void
		{
			m_sZipCode = value;
		}

		public function get StateID():String
		{
			return m_sStateID;
		}

		public function set StateID(value:String):void
		{
			m_sStateID = value;
		}


	}
}