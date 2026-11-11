package com.gazuntite.common.dto.pmh.compHistory.social
{
	import com.gazuntite.common.dto.baseDTO.BaseDTO;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.dictation.utils.DictationConstants;

	[Bindable]
	public class PatientWorkStatusDTO
	{
		private var _ID:int;
		private var _EmployementStatusID:int;
		private var _Notes:String = '';
		private var _DictationID:String = DictationConstants.GUID_FORMAT;
		private var _isWorkStatusEmployedFullTime:Boolean;
		private var _WorkStatusEmployedEmployerInfo:String = '';
		private var _WorkStatusUnEmployedDate:String = '';
		private var _WorkStatusUnEmployedinfo:String = '';
		private var _isNone:Boolean;
		private var _CreatedBy 			: int;
		private var _ModifiedBy 		: int;
		private var _ModifiedAt 		: String;
		private var _CreatedAt 			: String;

		public function FromXML(x:XML):void
		{
			ID 								= x.@ID;				
			EmployementStatusID 			= x.@EmployementStatusID;				
			Notes 							= x.@Notes;				
			DictationID 					= x.@DictationID;				
			isWorkStatusEmployedFullTime 	= String(x.@isWorkStatusEmployedFullTime).toLowerCase() == 'true';				
			WorkStatusEmployedEmployerInfo 	= x.@WorkStatusEmployedEmployerInfo;				
			WorkStatusUnEmployedDate 		= x.@WorkStatusUnEmployedDate;				
			WorkStatusUnEmployedinfo 		= x.@WorkStatusUnEmployedinfo;
			isNone 							= String(x.@isNone).toLowerCase() == 'true';
			CreatedBy 						= x.@CreatedBy;
			CreatedAt 						= x.@CreatedDate;
			ModifiedBy 						= x.@ModifiedBy;
			ModifiedAt						= x.@ModifiedDate;
			
		}
		
		public function ToXML():XML
		{
			var x:XML = XmlUtils.getNodeByTagName("PatientWorkStatus");
			
			x.@ID								= ID;				
			x.@EmployementStatusID				= EmployementStatusID;				
			x.@Notes							= Notes;				
			x.@DictationID						= DictationID;				
			x.@isWorkStatusEmployedFullTime		= isWorkStatusEmployedFullTime.toString();				
			x.@WorkStatusEmployedEmployerInfo	= WorkStatusEmployedEmployerInfo;				
			x.@WorkStatusUnEmployedDate			= WorkStatusUnEmployedDate;				
			x.@WorkStatusUnEmployedinfo			= WorkStatusUnEmployedinfo;				
			x.@isNone							= isNone.toString();
			x.@CreatedBy						= CreatedBy;
			x.@CreatedDate						= CreatedAt;
			x.@ModifiedBy						= ModifiedBy;
			x.@ModifiedDate						= ModifiedAt;
			
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

		public function get EmployementStatusID():int
		{
			return _EmployementStatusID;
		}

		public function set EmployementStatusID(value:int):void
		{
			_EmployementStatusID = value;
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

		public function get isWorkStatusEmployedFullTime():Boolean
		{
			return _isWorkStatusEmployedFullTime;
		}

		public function set isWorkStatusEmployedFullTime(value:Boolean):void
		{
			_isWorkStatusEmployedFullTime = value;
		}

		public function get WorkStatusEmployedEmployerInfo():String
		{
			return _WorkStatusEmployedEmployerInfo;
		}

		public function set WorkStatusEmployedEmployerInfo(value:String):void
		{
			_WorkStatusEmployedEmployerInfo = value;
		}

		public function get WorkStatusUnEmployedDate():String
		{
			return _WorkStatusUnEmployedDate;
		}

		public function set WorkStatusUnEmployedDate(value:String):void
		{
			_WorkStatusUnEmployedDate = value;
		}

		public function get WorkStatusUnEmployedinfo():String
		{
			return _WorkStatusUnEmployedinfo;
		}

		public function set WorkStatusUnEmployedinfo(value:String):void
		{
			_WorkStatusUnEmployedinfo = value;
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