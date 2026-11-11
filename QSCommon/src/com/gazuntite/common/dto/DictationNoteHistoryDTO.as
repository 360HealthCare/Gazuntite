package com.gazuntite.common.dto
{
	import com.gazuntite.common.dto.baseDTO.BaseDTO;
	import com.gazuntite.common.util.QSConstants;
	import com.gazuntite.viewModel.PatientDictationNoteViewModel;

	[Bindable]
	public class DictationNoteHistoryDTO extends BaseDTO
	{
		private var _IsNewRecord:Boolean;
		private var _ModuleDictationID:int;
		private var _ModuleNoteID:int;
		private var _ModuleTypeID:int;
		private var _ManagedByUserId:int;
		private var _ManagedByUserTypeId:int;
		
		private var _hasNotes:Boolean;
		private var _hasDictation:Boolean;
		
		public var dictationNoteViewModel:PatientDictationNoteViewModel;
		
		public function DictationNoteHistoryDTO()
		{
			dictationNoteViewModel = new PatientDictationNoteViewModel();
			dictationNoteViewModel.inlineEditing = true;
		}
		
		public function get IsNewRecord():Boolean
		{
			return _IsNewRecord;
		}
		
		public function set IsNewRecord(value:Boolean):void
		{
			_IsNewRecord = value;
		}
		
		public function get ModuleDictationID():int
		{
			return _ModuleDictationID;
		}
		
		public function set ModuleDictationID(value:int):void
		{
			_ModuleDictationID = value;
		}
		
		public function get ModuleNoteID():int
		{
			return _ModuleNoteID;
		}
		
		public function set ModuleNoteID(value:int):void
		{
			_ModuleNoteID = value;
		}

		public function get ModuleTypeID():int
		{
			return _ModuleTypeID;
		}
		
		public function set ModuleTypeID(value:int):void
		{
			_ModuleTypeID = value;
		}
		
		public function get ManagedByUserId():int
		{
			return _ManagedByUserId;
		}
		
		public function set ManagedByUserId(value:int):void
		{
			_ManagedByUserId = value;
		}
		
		public function get ManagedByUserTypeId():int
		{
			return _ManagedByUserTypeId;
		}

		public function set ManagedByUserTypeId(value:int):void
		{
			_ManagedByUserTypeId = value;
		}
		
		public function get hasNotes():Boolean
		{
			return _hasNotes;
		}
		
		public function set hasNotes(value:Boolean):void
		{
			_hasNotes = value;
		}
		
		public function get hasDictation():Boolean
		{
			return _hasDictation;
		}
		
		public function set hasDictation(value:Boolean):void
		{
			_hasDictation = value;
		}
		
		override public function FromXML(x:XML):void
		{
			super.FromXML(x);
			
			this.IsNewRecord = x.@IsNewRecord;
			this.ModuleDictationID = x.@ModuleDictationID;
			this.ModuleNoteID = x.@ModuleNoteID;
			this.ModuleTypeID = x.@ModuleTypeID;
			this.ManagedByUserId = x.@ManagedByUserId;
			this.ManagedByUserTypeId = x.@ManagedByUserTypeId;
			this.Note = x.@Notes;
			
			if (Note && Note.length > 0)
			{
				hasNotes = true;
			}
			
			if (DictationID && DictationID != QSConstants.GUID_FORMAT)
			{
				hasDictation = true;
			}
		}
	}
}