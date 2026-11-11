package com.gazuntite.provider.eprescription.services.patient.dto
{
	[Bindable]
	public class MedicationDrugDTO
	{
		private var _DRUG_ID:String;
		private var _DrugName:String;
		private var _rownum:int;
		
		
		/*<Drug DRUG_ID="d00857" DrugName="thiethylperazine" rownum="1"/>*/
		
		public function MedicationDrugDTO()
		{
		}
		
		public function get rownum():int
		{
			return _rownum;
		}

		public function set rownum(value:int):void
		{
			_rownum = value;
		}

		public function get DrugName():String
		{
			return _DrugName;
		}

		public function set DrugName(value:String):void
		{
			_DrugName = value;
		}

		public function get DRUG_ID():String
		{
			return _DRUG_ID;
		}

		public function set DRUG_ID(value:String):void
		{
			_DRUG_ID = value;
		}

		public function FromXml(x:XML):void
		{
			DRUG_ID			=x.@DRUG_ID;
			DrugName		=x.@DrugName;
			rownum			=x.@rownum;
		}
	}
}