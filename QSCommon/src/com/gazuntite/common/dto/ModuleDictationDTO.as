package com.gazuntite.common.dto
{
	import com.gazuntite.common.dto.baseDTO.BaseDTO;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.formatters.Formatter;

	[Bindable]
	public class ModuleDictationDTO extends BaseDTO
	{
		private var _ModuleDictationId:int;
		private var _ModuleTypeID:int;
		private var _ManagedByUserId:int;
		private var _ManagedByUserTypeId:int;
		private var _DictationTimeStamp:Date;
		
		public function ModuleDictationDTO()
		{
			super();
			DictationTimeStamp = new  Date();
		}
		
		public function get DictationTimeStamp():Date
		{
			return _DictationTimeStamp;
		}

		public function set DictationTimeStamp(value:Date):void
		{
			_DictationTimeStamp = value;
		}

		public function get ManagedByUserTypeId():int
		{
			return _ManagedByUserTypeId;
		}

		public function set ManagedByUserTypeId(value:int):void
		{
			_ManagedByUserTypeId = value;
		}

		public function get ManagedByUserId():int
		{
			return _ManagedByUserId;
		}

		public function set ManagedByUserId(value:int):void
		{
			_ManagedByUserId = value;
		}

		public function get ModuleTypeID():int
		{
			return _ModuleTypeID;
		}

		public function set ModuleTypeID(value:int):void
		{
			_ModuleTypeID = value;
		}

		public function get ModuleDictationId():int
		{
			return _ModuleDictationId;
		}

		public function set ModuleDictationId(value:int):void
		{
			_ModuleDictationId = value;
		}

		public override function ToXML():XML
		{
			this.nodeName = "ModuleDictationDTO";
			var x:XML = super.ToXML();
			
			x.@ModuleDictationId = ModuleDictationId;
			x.@ModuleTypeID = ModuleTypeID;
			x.@ManagedByUserId = ManagedByUserId;
			x.@ManagedByUserTypeId = ManagedByUserTypeId;
			x.@DictationTimeStamp =UtilityFunctions.FormatDate(DictationTimeStamp, "MM-DD-YYYY");
			
			return x;
		}
		
		public override  function FromXML(x:XML):void
		{
			super.FromXML(x);
			
			ModuleDictationId			=x.@ModuleDictationId;
			ModuleTypeID				=x.@ModuleTypeID;
			ManagedByUserId				=x.@ManagedByUserId;
			ManagedByUserTypeId			=x.@ManagedByUserTypeId;
		}
	}
}