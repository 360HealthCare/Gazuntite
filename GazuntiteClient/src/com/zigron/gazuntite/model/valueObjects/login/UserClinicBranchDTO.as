package com.zigron.gazuntite.model.valueObjects.login
{
	import com.gazuntite.common.dto.ClinicBranchUserRoleDTO;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class UserClinicBranchDTO
	{
		private var _IsDeleted:Boolean;
		private var _IsDirty:Boolean;
		
		private var _ClinicBranch:ClinicBranchDTO = new ClinicBranchDTO();
		private var _ClinicBranchUserRole:ClinicBranchUserRoleDTO = new ClinicBranchUserRoleDTO();
		public var  StationList:ArrayCollection = new ArrayCollection();
		
		public var UserSelectedStation:StationDTO;
		
		public function UserClinicBranchDTO()
		{
			
		}
		
		public function get ClinicBranchUserRole():ClinicBranchUserRoleDTO
		{
			return _ClinicBranchUserRole;
		}

		public function set ClinicBranchUserRole(value:ClinicBranchUserRoleDTO):void
		{
			_ClinicBranchUserRole = value;
		}

		public function get ClinicBranch():ClinicBranchDTO
		{
			return _ClinicBranch;
		}

		public function set ClinicBranch(value:ClinicBranchDTO):void
		{
			_ClinicBranch = value;
		}

		public function FromXml(x:XML):void
		{
			IsDeleted 					= UtilityFunctions.StringToBoolean(x.@IsDeleted);
			IsDirty 					= UtilityFunctions.StringToBoolean(x.@IsDirty);
			
			ClinicBranch.FromXml(x.ClinicBranch[0]);
			ClinicBranchUserRole.FromXml(x.ClinicBranchUserRole[0]);
			
			for each (var xStation:XML in x.StationList.Station)
			{
				var obj:StationDTO = new StationDTO();
				obj.FromXml(xStation);
				StationList.addItem(obj);
				
				if( obj.IsDefault )
					UserSelectedStation = obj;
			}
		}
		
		/*public function ToXml():XML
		{
			
		}*/
		
		
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