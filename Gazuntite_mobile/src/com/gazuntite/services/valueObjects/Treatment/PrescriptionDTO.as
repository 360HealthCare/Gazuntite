package com.gazuntite.services.valueObjects.Treatment
{	
	import org.spicefactory.lib.reflect.types.Private;

	[Bindable]
	public class PrescriptionDTO
	{
		private var _pharmacyName:String;
		
		protected var _NcpdpID:String;
		
	
		private var _MedicineName:String;
		
		protected var _dose:String;
		
		private var _Frequency:String;
		
		
		public function PrescriptionDTO()
		{
		}

		public function get Frequency():String
		{
			return _Frequency;
		}

		public function set Frequency(value:String):void
		{
			_Frequency = value;
		}

		public function get MedicineName():String
		{
			return _MedicineName;
		}

		public function set MedicineName(value:String):void
		{
			_MedicineName = value;
		}

		public function get dose():String
		{
			return _dose;
		}

		public function set dose(value:String):void
		{
			_dose = value;
		}

		public function get NcpdpID():String
		{
			return _NcpdpID;
		}

		public function set NcpdpID(value:String):void
		{
			_NcpdpID = value;
		}

		public function get pharmacyName():String
		{
			return _pharmacyName;
		}

		public function set pharmacyName(value:String):void
		{
			_pharmacyName = value;
		}

	}
}