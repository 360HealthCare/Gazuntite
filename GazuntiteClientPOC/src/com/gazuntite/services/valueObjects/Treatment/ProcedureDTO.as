package com.gazuntite.services.valueObjects.Treatment
{
	[Bindable]
	public class ProcedureDTO
	{
		private var _CPTCode:String;
		private var _Procedure:String;
		
		public function ProcedureDTO()
		{
			
		}

		public function get Procedure():String
		{
			return _Procedure;
		}

		public function set Procedure(value:String):void
		{
			_Procedure = value;
		}

		public function get CPTCode():String
		{
			return _CPTCode;
		}

		public function set CPTCode(value:String):void
		{
			_CPTCode = value;
		}

	}
}