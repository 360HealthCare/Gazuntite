package com.gazuntite.common.dto.assessment.diagnosis
{
	import com.gazuntite.common.dto.baseDTO.BaseDTO;
	import com.gazuntite.common.util.xml.XmlUtils;
	
	[Bindable]
	public class ICDCodeDTO extends BaseDTO
	{
		
		private var _ID:int;
		private var _IcdCodeName:String = "";
		private var _IcdCodeDescription:String = "";
		private var _DiagnosisId:int;
		private var _ReletionshipTypeID:int;
		private var _IsActive:Boolean;
		private var _Notes:String = "";
		private var _ReletionshipTypeName:String = "";
		
		public function ICDCodeDTO()
		{
		}
	
		public function get ReletionshipTypeName():String
		{
			return _ReletionshipTypeName;
		}

		public function set ReletionshipTypeName(value:String):void
		{
			_ReletionshipTypeName = value;
		}

		public function get DiagnosisId():int
		{
			return _DiagnosisId;
		}

		public function set DiagnosisId(value:int):void
		{
			_DiagnosisId = value;
		}

		public function get Notes():String
		{
			return _Notes;
		}

		public function set Notes(value:String):void
		{
			_Notes = value;
		}

		public function get IsActive():Boolean
		{
			return _IsActive;
		}

		public function set IsActive(value:Boolean):void
		{
			_IsActive = value;
		}

		public function get ReletionshipTypeID():int
		{
			return _ReletionshipTypeID;
		}

		public function set ReletionshipTypeID(value:int):void
		{
			_ReletionshipTypeID = value;
		}

		public function set nodename(value:String):void
		{
			this.nodeName = value;
		}

		public function get IcdCodeDescription():String
		{
			return _IcdCodeDescription;
		}

		public function set IcdCodeDescription(value:String):void
		{
			_IcdCodeDescription = value;
		}

		public function get IcdCodeName():String
		{
			return _IcdCodeName;
		}

		public function set IcdCodeName(value:String):void
		{
			_IcdCodeName = value;
		}

		public function get ID():int
		{
			return _ID;
		}

		public function set ID(value:int):void
		{
			_ID = value;
		}

		public override function ToXML():XML
		{
			var x:XML = XmlUtils.getNodeByTagName(nodeName);
			
			x.@["ID"] 					= this.ID;
			x.@["IcdCodeName"] 			= this.IcdCodeName;
			x.@["IcdCodeDescription"] 	= this.IcdCodeDescription;
			x.@["DiagnosisId"] 			= this.DiagnosisId;
			x.@["DictationID"] 			= this.DictationID;
			x.@["ReletionshipTypeID"] 	= this.ReletionshipTypeID;
			x.@["Notes"] 				= this.Notes;
			
			return x;
			
		}
		
		public override function FromXML( x:XML ):void
		{
			ID = x.@["ID"];
			IcdCodeName = x.@["IcdCodeName"];
			IcdCodeDescription = x.@["IcdCodeDescription"];
			DictationID = x.@["DictationID"];
			ReletionshipTypeID = x.@["ReletionshipTypeID"];
			Notes = x.@["Notes"];	
		}
	}
}