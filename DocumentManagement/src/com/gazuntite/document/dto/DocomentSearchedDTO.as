package com.gazuntite.document.dto
{
	[Bindable]
	public class DocomentSearchedDTO
	{
		private var _Name:String;
		private var _patientName:String;
		private var _age:String;
		private var _DOB:String;
		private var _Gender:String;
		private var _id:int;
		
		
		
		public function DocomentSearchedDTO()
		{
		}

		public function get id():int
		{
			return _id;
		}

		public function set id(value:int):void
		{
			_id = value;
		}

		public function get Gender():String
		{
			return _Gender;
		}

		public function set Gender(value:String):void
		{
			_Gender = value;
		}

		public function get DOB():String
		{
			return _DOB;
		}

		public function set DOB(value:String):void
		{
			_DOB = value;
		}

		public function get age():String
		{
			return _age;
		}

		public function set age(value:String):void
		{
			_age = value;
		}

		public function get patientName():String
		{
			return _patientName;
		}

		public function set patientName(value:String):void
		{
			_patientName = value;
		}

		public function get Name():String
		{
			return _Name;
		}

		public function set Name(value:String):void
		{
			_Name = value;
		}

	}
}