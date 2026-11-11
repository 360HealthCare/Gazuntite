package com.gazuntite.common.dto
{
	import com.gazuntite.utils.UtilityFunctions;
	
	[Bindable]
	public class ClinicBranchUserRoleDTO
	{
		
		private var _IsDeleted:Boolean;
		private var _IsDirty:Boolean;
		private var _UserTypeProfileID:int;
		private var _IsProfileComplete:Boolean;
		
		private var _UserTypeRole:UserTypeRoleDTO = new UserTypeRoleDTO();
		
		
		public function ClinicBranchUserRoleDTO()
		{
		}
		
		public function get UserTypeRole():UserTypeRoleDTO
		{
			return _UserTypeRole;
		}

		public function set UserTypeRole(value:UserTypeRoleDTO):void
		{
			_UserTypeRole = value;
		}

		public function get IsProfileComplete():Boolean
		{
			return _IsProfileComplete;
		}

		public function set IsProfileComplete(value:Boolean):void
		{
			_IsProfileComplete = value;
		}

		public function get UserTypeProfileID():int
		{
			return _UserTypeProfileID;
		}

		public function set UserTypeProfileID(value:int):void
		{
			_UserTypeProfileID = value;
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

		public function FromXml(x:XML):void
		{
			IsDeleted				=UtilityFunctions.StringToBoolean(x.@IsDeleted);
			IsDirty					=UtilityFunctions.StringToBoolean(x.@IsDirty);
			IsProfileComplete		=UtilityFunctions.StringToBoolean(x.@IsProfileComplete);
			UserTypeProfileID		=x.@UserTypeProfileID;
			
			UserTypeRole.FromXml(x.UserTypeRole[0]);
		}
		
		/*public function ToXml():XML
		{
			
		}*/
	}
}