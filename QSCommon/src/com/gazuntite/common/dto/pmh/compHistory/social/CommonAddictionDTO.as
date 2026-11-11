package com.gazuntite.common.dto.pmh.compHistory.social
{
	import com.gazuntite.common.dto.baseDTO.BaseDTO;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.dictation.utils.DictationConstants;

	[Bindable]
	public class CommonAddictionDTO
	{
		private var _ID:int;
		private var _AddictionStatusID:int;
		private var _TypeID:int;
		private var _AmountID:int;
		private var _isPresent:Boolean;
		private var _Amount:String;
		private var _Type:String;
		private var _onset:String='';
		private var _EndDate:String= '';
		private var _Notes:String = '';
		private var _DictationID:String=DictationConstants.GUID_FORMAT;
		private var _isCounseled:Boolean;
		private var _isNone:Boolean;		
		private var _CreatedBy 			: int;
		private var _ModifiedBy 		: int;
		private var _ModifiedAt 		: String;
		private var _CreatedAt 			: String;
		
		public var addictionName		:String;

		public function FromXML(x:XML):void
		{
			ID 								= x.@ID;				
			AddictionStatusID 				= x.@AddictionStatusID;				
			TypeID 							= x.@TypeID;				
			AmountID 						= x.@AmountID;				
			isPresent 						= String(x.@isPresent).toLowerCase() == 'true';				
			Amount 							= x.@Amount;				
			Type 							= x.@Type;				
			onset 							= x.@onset;				
			EndDate 						= x.@EndDate;				
			Notes 							= x.@Notes;				
			DictationID 					= x.@DictationID;				
			isCounseled 					= String(x.@isCounseled).toLowerCase() == 'true';				
			isNone 							= String(x.@isNone).toLowerCase() == 'true';
			CreatedBy 						= x.@CreatedBy;
			CreatedAt 						= x.@CreatedDate;
			ModifiedBy 						= x.@ModifiedBy;
			ModifiedAt						= x.@ModifiedDate;
		}
		
		public function ToXML():XML
		{	
			
			var x:XML = XmlUtils.getNodeByTagName("CommonAddictionDTO");
			
			x.@ID							= ID;				
			x.@AddictionStatusID			= AddictionStatusID;				
			x.@TypeID						= TypeID;				
			x.@AmountID						= AmountID;				
			x.@isPresent					= isPresent.toString();				
			x.@Amount						= Amount;				
			x.@Type							= Type;				
			x.@onset						= onset;				
			x.@EndDate						= EndDate;				
			x.@Notes						= Notes;				
			x.@DictationID					= DictationID;				
			x.@isCounseled					= isCounseled.toString();	
			x.@isNone						= isNone.toString();
			x.@CreatedBy					= CreatedBy;
			x.@CreatedDate					= CreatedAt;
			x.@ModifiedBy					= ModifiedBy;
			x.@ModifiedDate					= ModifiedAt;
			
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

		public function get AddictionStatusID():int
		{
			return _AddictionStatusID;
		}

		public function set AddictionStatusID(value:int):void
		{
			_AddictionStatusID = value;
		}

		public function get Amount():String
		{
			return _Amount;
		}

		public function set Amount(value:String):void
		{
			_Amount = value;
		}

		public function get onset():String
		{
			return _onset;
		}

		public function set onset(value:String):void
		{
			_onset = value;
		}

		public function get EndDate():String
		{
			return _EndDate;
		}

		public function set EndDate(value:String):void
		{
			_EndDate = value;
		}

		public function get Notes():String
		{
			return _Notes;
		}

		public function set Notes(value:String):void
		{
			_Notes = value;
		}

		public function get DictationID():String
		{
			return _DictationID;
		}

		public function set DictationID(value:String):void
		{
			_DictationID = value;
		}

		public function get isCounseled():Boolean
		{
			return _isCounseled;
		}

		public function set isCounseled(value:Boolean):void
		{
			_isCounseled = value;
		}

		public function get isPresent():Boolean
		{
			return _isPresent;
		}

		public function set isPresent(value:Boolean):void
		{
			_isPresent = value;
		}

		public function get Type():String
		{
			return _Type;
		}

		public function set Type(value:String):void
		{
			_Type = value;
		}

		public function get isNone():Boolean
		{
			return _isNone;
		}

		public function set isNone(value:Boolean):void
		{
			_isNone = value;
		}

		public function get TypeID():int
		{
			return _TypeID;
		}

		public function set TypeID(value:int):void
		{
			_TypeID = value;
		}

		public function get AmountID():int
		{
			return _AmountID;
		}

		public function set AmountID(value:int):void
		{
			_AmountID = value;
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