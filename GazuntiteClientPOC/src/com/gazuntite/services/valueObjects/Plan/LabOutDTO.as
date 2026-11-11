package com.gazuntite.services.valueObjects.Plan
{	
	[Bindable]
	public class LabOutDTO
	{
		private var _all:String;
		
		private var _orderMethod:String;
		private var _testCode:String;
		private var _testName:String;
		
		private var _associatedDiagnosis:String;
		private var _priority:String;
		private var _specimen:String;
		private var _collectionDate:Date;
		private var _laboratory:String;
		
		
		public function LabOutDTO()
		{
			
		}

		public function get all():String
		{
			return _all;
		}

		public function set all(value:String):void
		{
			_all = value;
		}

		public function get laboratory():String
		{
			return _laboratory;
		}

		public function set laboratory(value:String):void
		{
			_laboratory = value;
		}

		public function get collectionDate():Date
		{
			return _collectionDate;
		}

		public function set collectionDate(value:Date):void
		{
			_collectionDate = value;
		}

		public function get specimen():String
		{
			return _specimen;
		}

		public function set specimen(value:String):void
		{
			_specimen = value;
		}

		public function get associatedDiagnosis():String
		{
			return _associatedDiagnosis;
		}

		public function set associatedDiagnosis(value:String):void
		{
			_associatedDiagnosis = value;
		}

		public function get testName():String
		{
			return _testName;
		}

		public function set testName(value:String):void
		{
			_testName = value;
		}

		public function get testCode():String
		{
			return _testCode;
		}

		public function set testCode(value:String):void
		{
			_testCode = value;
		}

		public function get priority():String
		{
			return _priority;
		}

		public function set priority(value:String):void
		{
			_priority = value;
		}

		public function get orderMethod():String
		{
			return _orderMethod;
		}

		public function set orderMethod(value:String):void
		{
			_orderMethod = value;
		}

	}
}