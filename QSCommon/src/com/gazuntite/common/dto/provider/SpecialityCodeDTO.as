package com.gazuntite.common.dto.provider
{
	public class SpecialityCodeDTO
	{
		private var _SpecialtyID:String;
		private var _SpecialityCode:String;
		private var _SpecialityName:String;

		public function get SpecialtyID():String
		{
			return _SpecialtyID;
		}

		public function set SpecialtyID(value:String):void
		{
			_SpecialtyID = value;
		}

		public function get SpecialityCode():String
		{
			return _SpecialityCode;
		}

		public function set SpecialityCode(value:String):void
		{
			_SpecialityCode = value;
		}


		public function get SpecialityName():String
		{
			return _SpecialityName;
		}

		public function set SpecialityName(value:String):void
		{
			_SpecialityName = value;
		}

		public function FromXML(x:XML):void
		{
			SpecialtyID 				= x.@["SpecialtyID"];
			SpecialityCode 				= x.@["SpecialityCode"];
			SpecialityName 				= x.@["SpecialityName"];			
		}
	}
}