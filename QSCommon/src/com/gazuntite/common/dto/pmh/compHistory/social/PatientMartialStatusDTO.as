package com.gazuntite.common.dto.pmh.compHistory.social
{
	import com.gazuntite.common.dto.baseDTO.BaseDTO;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.dictation.utils.DictationConstants;

	[Bindable]
	public class PatientMartialStatusDTO
	{
		private var _ID:int;
		private var _MartialStatusID:int;
		private var _MartialStatusNotes:String = '';
		private var _DictationID:String = DictationConstants.GUID_FORMAT;
		private var _isNone:Boolean;
		private var _CreatedBy 			: int;
		private var _ModifiedBy 		: int;
		private var _ModifiedAt 		: String;
		private var _CreatedAt 			: String;

		public function FromXML(x:XML):void
		{
			ID 								= x.@ID;				
			MartialStatusID 				= x.@MartialStatusID;				
			MartialStatusNotes 				= x.@MartialStatusNotes;				
			DictationID 					= x.@DictationID;	
			isNone 							= String(x.@isNone).toLowerCase() == 'true';
			CreatedBy 						= x.@CreatedBy;
			CreatedAt 						= x.@CreatedDate;
			ModifiedBy 						= x.@ModifiedBy;
			ModifiedAt						= x.@ModifiedDate;
		}
		
		public function ToXML():XML
		{
			var x:XML = XmlUtils.getNodeByTagName("PatientMartialStatus");
			
			x.@ID							= ID;				
			x.@MartialStatusID				= MartialStatusID;				
			x.@MartialStatusNotes			= MartialStatusNotes;				
			x.@DictationID					= DictationID;	
			x.@isNone						= isNone.toString();
			x.@CreatedBy					= CreatedBy;
			x.@CreatedDate				= CreatedAt;
			x.@ModifiedBy					= ModifiedBy;
			x.@ModifiedDate				= ModifiedAt;
						
			return x;
		}
		
		public function get ID():int
		{
			return _ID;
		}

		public function set ID(value:int):void
		{
			_ID = value;
		}

		public function get MartialStatusID():int
		{
			return _MartialStatusID;
		}

		public function set MartialStatusID(value:int):void
		{
			_MartialStatusID = value;
		}

		public function get MartialStatusNotes():String
		{
			return _MartialStatusNotes;
		}

		public function set MartialStatusNotes(value:String):void
		{
			_MartialStatusNotes = value;
		}

		public function get DictationID():String
		{
			return _DictationID;
		}

		public function set DictationID(value:String):void
		{
			_DictationID = value;
		}

		public function get isNone():Boolean
		{
			return _isNone;
		}

		public function set isNone(value:Boolean):void
		{
			_isNone = value;
		}

		public function get CreatedBy():int
		{
			return _CreatedBy;
		}
		
		public function set CreatedBy(value:int):void
		{
			_CreatedBy = value;
		}
		
		public function get ModifiedBy():int
		{
			return _ModifiedBy;
		}
		
		public function set ModifiedBy(value:int):void
		{
			_ModifiedBy = value;
		}
		
		public function get ModifiedAt():String
		{
			return _ModifiedAt;
		}
		
		public function set ModifiedAt(value:String):void
		{
			_ModifiedAt = value;
		}
		
		public function get CreatedAt():String
		{
			return _CreatedAt;
		}
		
		public function set CreatedAt(value:String):void
		{
			_CreatedAt = value;
		}
	}
}