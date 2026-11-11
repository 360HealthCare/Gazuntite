package com.gazuntite.patient.visit.dto.ch
{
	import com.gazuntite.patient.visit.dto.common.BaseDTO;
	
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class FamilyHistoryDTO extends BaseDTO
	{
		private var _IsYesSelected: String;
		private var _IsPresent: Boolean;
		private var _id: int;
		
		public var PatientDiseaseList: ArrayCollection;
		
		public function FamilyHistoryDTO()
		{
			super();
		}

		public function get id():int
		{
			return _id;
		}

		public function set id(value:int):void
		{
			_id = value;
		}

		public function get IsPresent():Boolean
		{
			return _IsPresent;
		}

		public function set IsPresent(value:Boolean):void
		{
			_IsPresent = value;
		}

		public function get IsYesSelected():String
		{
			return _IsYesSelected;
		}

		public function set IsYesSelected(value:String):void
		{
			_IsYesSelected = value;
		}

	}
}