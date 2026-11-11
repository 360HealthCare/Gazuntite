package com.gazuntite.common.dto.visit
{
	import com.gazuntite.common.util.xml.XmlUtils;
	

	[Bindable]
	public class OwnerUserTypeDTO
	{
		private var _UserTypeId:int, _IsProvider:Boolean, _IsClinicUser:Boolean, _ClinicBranchID:int;
		
		public function OwnerUserTypeDTO()
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

		public function get UserTypeId():int
		{
			return _UserTypeId;
		}

		public function set UserTypeId(value:int):void
		{
			_UserTypeId = value;
		}
		
		public function ToXML():XML
		{
			var x:XML = XmlUtils.getNodeByTagName("OwnerUserType");
			
			x.@["UserTypeId"] 		= UserTypeId;
			x.@["IsProvider"] 		= IsProvider;
			x.@["IsClinicUser"] 	= IsClinicUser;			
			x.@["ClinicBranchID"] 	= ClinicBranchID;	
			
			return x;
		}
		
		public function FromXML(x:XML):void
		{
			UserTypeId 			= x.@["UserTypeId"];
			IsProvider			= x.@["IsProvider"];
			IsClinicUser		= x.@["IsClinicUser"];			
			ClinicBranchID		= x.@["ClinicBranchID"];	
		}

	}
}