package com.gazuntite.common.dto
{
	[Bindable]
	public class CitiesDTO
	{
		public function CitiesDTO()
		{
		}
		
		private var m_sCityName:String;
		private var m_sCityCode:String;

		
		public function FromXML( x:XML ):void
		{
			CityName 					= x.@['CityName'];			
			CityCode 					= x.@['CityCode'];			
		}
		
		//**** GETTER and SETTER *************
		
		public function get CityName():String
		{
			return m_sCityName;
		}

		public function set CityName(value:String):void
		{
			m_sCityName = value;
		}

		public function get CityCode():String
		{
			return m_sCityCode;
		}

		public function set CityCode(value:String):void
		{
			m_sCityCode = value;
		}


	}
}