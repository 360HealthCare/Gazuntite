package com.gazuntite.common.dto
{
	import com.gazuntite.common.dto.baseDTO.BaseDTO;
	import com.gazuntite.utils.UtilityFunctions;

	public class ModuleNoteDTO extends BaseDTO
	{	
		private var _Note:String = "";
		private var _NoteSubject:String = "";
		private var _ModuleNoteId:int;
		private var _ModuleTypeId:int;
		private var _ManagedByUserId:int;
		private var _v:Date;
				
		public override  function FromXML(x:XML):void
		{
			super.FromXML(x);
			
			ModuleNoteId = x.@ModuleNoteId;
			ModuleTypeId = x.@ModuleTypeId;
			ManagedByUserId	= x.@ManagedByUserId;
			v = new Date (x.@v);
		}
		
		public override function ToXML():XML
		{
			this.nodeName = "ModuleNoteDTO";
			var x:XML = super.ToXML();
			
			x.@ModuleNoteId	= ModuleNoteId;
			x.@ModuleTypeId	= ModuleTypeId;
			x.@ManagedByUserId = ManagedByUserId;
			x.@v = UtilityFunctions.FormatDate(v, "MM-DD-YYYY");
			
			return x;
		}
		
		public function ModuleNoteDTO()
		{
			super();
		}

		public function get v():Date
		{
			return _v;
		}

		public function set v(value:Date):void
		{
			_v = value;
		}

		public function get ManagedByUserId():int
		{
			return _ManagedByUserId;
		}

		public function set ManagedByUserId(value:int):void
		{
			_ManagedByUserId = value;
		}

		public function get ModuleTypeId():int
		{
			return _ModuleTypeId;
		}

		public function set ModuleTypeId(value:int):void
		{
			_ModuleTypeId = value;
		}

		public function get ModuleNoteId():int
		{
			return _ModuleNoteId;
		}

		public function set ModuleNoteId(value:int):void
		{
			_ModuleNoteId = value;
		}	
	}
}