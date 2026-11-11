package com.gazuntite.common.dto
{
	import com.gazuntite.utils.UtilityFunctions;

	[Bindable]
	public class UserTypeRoleDTO
	{
		private var _UserTypeId:int;
		private var _ClinicBranchID:int;
		private var _UserTypeName:String;
		private var _IsProvider:Boolean;
		private var _IsClinicUser:Boolean;
		
		
			
		public function UserTypeRoleDTO()
		{
		}
		
		public function get ClinicBranchID():int
		{
			return _ClinicBranchID;
		}

		public function set ClinicBranchID(value:int):void
		{
			_ClinicBranchID = value;
		}

		public function FromXml(x:XML):void
		{
			UserTypeId			 = x.@UserTypeId;
			ClinicBranchID		 = x.@ClinicBranchID;
			UserTypeName		 = x.@UserTypeName;
			IsProvider			 =UtilityFunctions.StringToBoolean( x.@IsProvider);
			IsClinicUser		 = UtilityFunctions.StringToBoolean(x.@IsClinicUser);
		}
		
		/*public function ToXml():XML
		{
			
		}*/

		public function get IsClinicUser():Boolean
		{
			return _IsClinicUser;
		}

		public function set IsClinicUser(value:Boolean):void
		{
			_IsClinicUser = value;
		}

		public function get IsProvider():Boolean
		{
			return _IsProvider;
		}

		public function set IsProvider(value:Boolean):void
		{
			_IsProvider = value;
		}

		public function get UserTypeName():String
		{
			return _UserTypeName;
		}

		public function set UserTypeName(value:String):void
		{
			_UserTypeName = value;
		}

		public function get UserTypeId():int
		{
			return _UserTypeId;
		}

		public function set UserTypeId(value:int):void
		{
			_UserTypeId = value;
		}

	}
}