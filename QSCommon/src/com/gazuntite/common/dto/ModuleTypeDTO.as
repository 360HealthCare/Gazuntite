package com.gazuntite.common.dto
{
	[Bindable]
	public class ModuleTypeDTO
	{
		private var _Description:String;
		private var _ModuleName:String;
		private var _ModuleTypeId:int;
		
		public function ModuleTypeDTO()
		{
		}
		
		public function FromXML(x:XML):void
		{
			ModuleTypeId = x.@["ModuleTypeId"];
			ModuleName = x.@["ModuleName"];
			Description = x.@["Description"];
		}
		
		public function get ModuleTypeId():int
		{
			return _ModuleTypeId;
		}

		public function set ModuleTypeId(value:int):void
		{
			_ModuleTypeId = value;
		}

		public function get ModuleName():String
		{
			return _ModuleName;
		}

		public function set ModuleName(value:String):void
		{
			_ModuleName = value;
		}

		public function get Description():String
		{
			return _Description;
		}

		public function set Description(value:String):void
		{
			_Description = value;
		}
	}
}