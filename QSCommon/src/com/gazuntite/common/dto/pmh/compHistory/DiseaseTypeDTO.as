package com.gazuntite.common.dto.pmh.compHistory
{
	import com.gazuntite.common.dto.baseDTO.BaseDTO;
	import com.gazuntite.utils.UtilityFunctions;

	public class DiseaseTypeDTO extends BaseDTO
	{
		
		private var _DiseaseTypeCode:String;
		private var _Description:String;
		private var _DiseaseTypeID:int;
		private var _ClinicBranchID : int;
		private var _DiseaseTypeName : String;
		private var _FamilyHistoryTypeId : int;
		private var _IsSystemSpecified : Boolean;
		private var _UserID : int;
		private var _UserTypeID : int;
		
		public function DiseaseTypeDTO()
		{
		}
		
		public override function FromXML(x:XML):void
		{
			super.FromXML(x);
			
			DiseaseTypeCode 		= x.@DiseaseTypeCode;
			Description 			= x.@Description;
			DiseaseTypeID 			= x.@DiseaseTypeID;
			ClinicBranchID  		= x.@ClinicBranchID;
			DiseaseTypeName 		= x.@DiseaseTypeName;
			FamilyHistoryTypeId 	= x.@FamilyHistoryTypeId;
			IsSystemSpecified 		= UtilityFunctions.StringToBoolean(x.@IsSystemSpecified);
			UserID 					= x.@UserID;
			UserTypeID 				= x.@UserTypeID;
			
		}
		
		public override function ToXML():XML
		{
			this.nodeName = "DiseaseTypeDTO ";
			var x:XML = super.ToXML();
			
			x.@DiseaseTypeCode			=this.DiseaseTypeCode ;
			x.@Description				=this.Description ;
			x.@DiseaseTypeID			=this.DiseaseTypeID ;
			x.@ClinicBranchID			=this.ClinicBranchID ;
			x.@DiseaseTypeName			=this.DiseaseTypeName  ;
			x.@FamilyHistoryTypeId		=this.FamilyHistoryTypeId ;
			x.@IsSystemSpecified		=this.IsSystemSpecified ;
			x.@UserID					=this.UserID ;
			x.@UserTypeID				=this.UserTypeID ;
			
			
			return x;
		}

		public function get UserTypeID():int
		{
			return _UserTypeID;
		}

		public function set UserTypeID(value:int):void
		{
			_UserTypeID = value;
		}

		public function get UserID():int
		{
			return _UserID;
		}

		public function set UserID(value:int):void
		{
			_UserID = value;
		}

		public function get IsSystemSpecified():Boolean
		{
			return _IsSystemSpecified;
		}

		public function set IsSystemSpecified(value:Boolean):void
		{
			_IsSystemSpecified = value;
		}

		public function get FamilyHistoryTypeId():int
		{
			return _FamilyHistoryTypeId;
		}

		public function set FamilyHistoryTypeId(value:int):void
		{
			_FamilyHistoryTypeId = value;
		}

		public function get DiseaseTypeName():String
		{
			return _DiseaseTypeName;
		}

		public function set DiseaseTypeName(value:String):void
		{
			_DiseaseTypeName = value;
		}

		public function get ClinicBranchID():int
		{
			return _ClinicBranchID;
		}

		public function set ClinicBranchID(value:int):void
		{
			_ClinicBranchID = value;
		}

		public function get DiseaseTypeID():int
		{
			return _DiseaseTypeID;
		}

		public function set DiseaseTypeID(value:int):void
		{
			_DiseaseTypeID = value;
		}

		public function get Description():String
		{
			return _Description;
		}

		public function set Description(value:String):void
		{
			_Description = value;
		}

		public function get DiseaseTypeCode():String
		{
			return _DiseaseTypeCode;
		}

		public function set DiseaseTypeCode(value:String):void
		{
			_DiseaseTypeCode = value;
		}

	}
}