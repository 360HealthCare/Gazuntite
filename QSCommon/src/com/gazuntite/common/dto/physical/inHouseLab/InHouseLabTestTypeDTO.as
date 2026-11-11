package com.gazuntite.common.dto.physical.inHouseLab
{
	import com.gazuntite.common.dto.baseDTO.GeneralTypeDTO;

	[Bindable]
	public class InHouseLabTestTypeDTO extends GeneralTypeDTO
	{
		
		private var _ClinicBranchID :String;
		private var _Code :String;
		private var _Amount :String;
		private var _NormalRange:String;
		//private var _Result:String;
		
		public function InHouseLabTestTypeDTO()
		{
		}

		/*public function get Result():String
		{
			return _Result;
		}

		public function set Result(value:String):void
		{
			_Result = value;
		}*/

		public function get NormalRange():String
		{
			return _NormalRange;
		}

		public function set NormalRange(value:String):void
		{
			_NormalRange = value;
		}

		public function get Amount():String
		{
			return _Amount;
		}

		public function set Amount(value:String):void
		{
			_Amount = value;
		}


		public function get Code():String
		{
			return _Code;
		}

		public function set Code(value:String):void
		{
			_Code = value;
		}

		public function get ClinicBranchID():String
		{
			return _ClinicBranchID;
		}

		public function set ClinicBranchID(value:String):void
		{
			_ClinicBranchID = value;
		}

		
		public override function ToXML():XML
		{
			nodeName = "InHouseLabTestType";
			var x:XML = super.ToXML();
			
			x.@ClinicBranchID		= ClinicBranchID;
			x.@Code					= Code;
			x.@Amount				= Amount;
			x.@Range  				= NormalRange;
			//x.@Result  				= Result;
			
			
			return x;
		}
		
		
		public override function FromXML(x:XML):void
		{
			this.ID 							= x.@ID;
			this.ClinicBranchID 				= x.@ClinicBranchID;
			this.Code 							= x.@Code;
			this.Name 							= x.@Name;
			this.Amount 						= x.@Amount;
			this.NormalRange 					= x.@Range;
			//this.Result 						= x.@Result;
					
			
		}

	}
}