package com.gazuntite.patient.visit.dto.visit
{
	import com.gazuntite.common.util.xml.XmlUtils;

	[Bindable]
	public class UserTypeDTO
	{
		private var _UserTypeId:int, _IsProvider:Boolean, _IsClinicUser:Boolean, _ClinicBranchID:int;
		private var _Name:String;
		
		public function UserTypeDTO()
		{
		}

		public function get Name():String
		{
			return _Name;
		}

		public function set Name(value:String):void
		{
			_Name = value;
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

		public function get ID():int
		{
			return _UserTypeId;
		}

		public function set ID(value:int):void
		{
			_UserTypeId = value;
		}
		
		public function ToXML():XML
		{
			var x:XML = XmlUtils.getNodeByTagName("UserType");
			
			x.@["UserTypeId"] 		= ID;
			x.@["IsProvider"] 		= IsProvider;
			x.@["IsClinicUser"] 	= IsClinicUser;			
			x.@["ClinicBranchID"] 	= ClinicBranchID;	
			x.@["Name"] 			= Name;	
			
			return x;
		}
		
		public function FromXML(x:XML):void
		{
			ID 							= x.@["UserTypeId"];
			IsProvider 					= x.@["IsProvider"];
			IsClinicUser 				= x.@["IsClinicUser"];			
			ClinicBranchID 				= x.@["ClinicBranchID"];	
			Name						= x.@["Name"];
		}

	}
}