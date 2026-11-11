package com.gazuntite.provider.eprescription.services.patient.dto
{
	[Bindable]
	public class MedicationProductDTO
	{
		private var _GenericName:String = "";
		private var _CSA_CODE:int;
		
		public function MedicationProductDTO()
		{
		}
		
		public function get CSA_CODE():int
		{
			return _CSA_CODE;
		}

		public function set CSA_CODE(value:int):void
		{
			_CSA_CODE = value;
		}

		public function get GenericName():String
		{
			return _GenericName;
		}

		public function set GenericName(value:String):void
		{
			_GenericName = value;
		}

		public function FromXml(x:XML):void
		{
			GenericName = x.@GenericName;
			CSA_CODE	= x.@CSA_CODE;
		}
	}
}