package com.gazuntite.common.dto.visit
{
	import com.gazuntite.common.util.xml.XmlUtils;
	

	[Bindable]
	public class ListProvidersDTO
	{
		public function ListProvidersDTO()
		{
		}
		// IsDeleted="false" IsDirty="false" FirstName="SABA" LastName="RIAZ" MiddleName="" UserId="598" StationId="0" ProviderId="0" UserTypeID="3" isDefault="false"/>
		private var _IsDeleted:String;
		private var _IsDirty:String;
		private var _FirstName:String;
		private var _LastName:String;
		private var _MiddleName:String;
		private var _UserId:String;
		private var _StationId:String;
		private var _ProviderId:String;
		private var _UserTypeID:String;
		private var _isDefault:String;
		
		private var _Name:String;
		
		public function ToXML():XML
		{
			var x:XML = XmlUtils.getNodeByTagName("ListProvidersDTO");
			
			x.@["IsDeleted"] 		= IsDeleted;
			x.@["IsDirty"] 			= IsDirty;
			x.@["FirstName"] 		= FirstName;			
			x.@["LastName"] 		= LastName;	
			x.@["MiddleName"] 		= MiddleName;	
			x.@["UserId"] 			= UserId;	
			x.@["StationId"] 		= StationId;	
			x.@["ProviderId"] 		= ProviderId;	
			x.@["UserTypeID"] 		= UserTypeID;	
			x.@["isDefault"] 		= isDefault;	
			
			return x;
		}
		
		public function FromXML(x:XML):void
		{
			IsDeleted 				= x.@["IsDeleted"];
			IsDirty 				= x.@["IsDirty"];
			FirstName 				= x.@["FirstName"];			
			LastName 				= x.@["LastName"];	
			MiddleName				= x.@["MiddleName"];
			UserId					= x.@["UserId"];
			StationId				= x.@["StationId"];
			ProviderId				= x.@["ProviderId"];
			UserTypeID				= x.@["UserTypeID"];
			isDefault				= x.@["isDefault"];
			
			Name					= FirstName +' '+MiddleName+' '+LastName;
		}
		
		public function get IsDeleted():String
		{
			return _IsDeleted;
		}

		public function set IsDeleted(value:String):void
		{
			_IsDeleted = value;
		}

		public function get IsDirty():String
		{
			return _IsDirty;
		}

		public function set IsDirty(value:String):void
		{
			_IsDirty = value;
		}

		public function get FirstName():String
		{
			return _FirstName;
		}

		public function set FirstName(value:String):void
		{
			_FirstName = value;
		}

		public function get LastName():String
		{
			return _LastName;
		}

		public function set LastName(value:String):void
		{
			_LastName = value;
		}

		public function get MiddleName():String
		{
			return _MiddleName;
		}

		public function set MiddleName(value:String):void
		{
			_MiddleName = value;
		}

		public function get UserId():String
		{
			return _UserId;
		}

		public function set UserId(value:String):void
		{
			_UserId = value;
		}

		public function get StationId():String
		{
			return _StationId;
		}

		public function set StationId(value:String):void
		{
			_StationId = value;
		}

		public function get ProviderId():String
		{
			return _ProviderId;
		}

		public function set ProviderId(value:String):void
		{
			_ProviderId = value;
		}

		public function get UserTypeID():String
		{
			return _UserTypeID;
		}

		public function set UserTypeID(value:String):void
		{
			_UserTypeID = value;
		}

		public function get isDefault():String
		{
			return _isDefault;
		}

		public function set isDefault(value:String):void
		{
			_isDefault = value;
		}

		public function get Name():String
		{
			return _Name;
		}

		public function set Name(value:String):void
		{
			_Name = value;
		}


	}
}