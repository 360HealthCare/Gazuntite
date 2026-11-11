package com.zigron.gazuntite.model.valueObjects.login
{
	import com.gazuntite.utils.UtilityFunctions;

	[Bindable]
	public class StationDTO
	{
		
		private var _IsDeleted:Boolean;
		private var _IsDirty:Boolean;
		private var _IsDefault:Boolean;
		
		private var _ClinicBranchID:int;
		private var _StationID:int;
		private var _CreatedBy:int;
		private var _ModifiedBy:int;
		
		private var _StationName:String;
		private var _Address:String;
		private var _CreatedAt:String;
		private var _ModifiedAt:String;
		
		
		public function StationDTO()
		{
		}

		/*<Station IsDeleted="false" IsDirty="false" IsNewRecord="false" StationID="1" 
		StationName="Alabama" ClinicBranchID="7" CreatedAt="0001-01-01T00:00:00" 
		CreatedBy="0" ModifiedAt="0001-01-01T00:00:00" 
		ModifiedBy="0" IsDefault="true" Address="68 lancer branch"/>*/
		
		public function FromXml(x:XML):void
		{
			IsDeleted			=UtilityFunctions.StringToBoolean(x.@IsDeleted);
			IsDirty				=UtilityFunctions.StringToBoolean(x.@IsDirty);
			IsDefault			=UtilityFunctions.StringToBoolean(x.@IsDefault);
			
			ClinicBranchID		=x.@ClinicBranchID;
			StationID			=x.@StationID;
			CreatedBy			=x.@CreatedBy;
			ModifiedBy			=x.@ModifiedBy;
			
			StationName			=x.@StationName;
			Address				=x.@Address;
			CreatedAt			=x.@CreatedAt;
			ModifiedAt			=x.@ModifiedAt;
			
		}
		
		/*public function ToXml():XML
		{
			
		}*/
		
		public function get label():String
		{
			return StationName + " ( " + Address + " )"
		}
		
		public function get Address():String
		{
			return _Address;
		}
		
		public function set Address(value:String):void
		{
			_Address = value;
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

		public function get StationName():String
		{
			return _StationName;
		}

		public function set StationName(value:String):void
		{
			_StationName = value;
		}

		public function get ModifiedBy():int
		{
			return _ModifiedBy;
		}

		public function set ModifiedBy(value:int):void
		{
			_ModifiedBy = value;
		}

		public function get CreatedBy():int
		{
			return _CreatedBy;
		}

		public function set CreatedBy(value:int):void
		{
			_CreatedBy = value;
		}

		public function get StationID():int
		{
			return _StationID;
		}

		public function set StationID(value:int):void
		{
			_StationID = value;
		}

		public function get ClinicBranchID():int
		{
			return _ClinicBranchID;
		}

		public function set ClinicBranchID(value:int):void
		{
			_ClinicBranchID = value;
		}

		public function get IsDefault():Boolean
		{
			return _IsDefault;
		}

		public function set IsDefault(value:Boolean):void
		{
			_IsDefault = value;
		}

		public function get IsDirty():Boolean
		{
			return _IsDirty;
		}

		public function set IsDirty(value:Boolean):void
		{
			_IsDirty = value;
		}

		public function get IsDeleted():Boolean
		{
			return _IsDeleted;
		}

		public function set IsDeleted(value:Boolean):void
		{
			_IsDeleted = value;
		}

	}
}