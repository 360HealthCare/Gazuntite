package com.gazuntite.common.dto.typeDTO
{
	import com.gazuntite.common.util.xml.XmlUtils;
	

	[Bindable]
	public class UserTypeDTO
	{
		private var _UserTypeId:int, _IsProvider:Boolean, _IsClinicUser:Boolean, _ClinicBranchID:int;
		private var _UserTypeName:String;
		
		public function UserTypeDTO()
		{
		}

		public function get UserTypeName():String
		{
			return _UserTypeName;
		}

		public function set UserTypeName(value:String):void
		{
			_UserTypeName = value;
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
		
		public function ToXML(isForBaseUser:Boolean = false):XML
		{
			var x:XML = null;
			if(!isForBaseUser)
				 x = XmlUtils.getNodeByTagName("UserType");
			else
				x = XmlUtils.getNodeByTagName("ActiveUserType");
			
			x.@["UserTypeId"] 		= ID;
			x.@["IsProvider"] 		= IsProvider;
			x.@["IsClinicUser"] 	= IsClinicUser;			
			x.@["ClinicBranchID"] 	= ClinicBranchID;	
			x.@["UserTypeName"] 	= UserTypeName;	
			
			return x;
		}
		
		public function FromXML(x:XML):void
		{
			ID 							= x.@["UserTypeId"];
			IsProvider 					= x.@["IsProvider"];
			IsClinicUser 				= x.@["IsClinicUser"];			
			ClinicBranchID 				= x.@["ClinicBranchID"];	
			UserTypeName				= x.@["UserTypeName"];
		}

	}
}