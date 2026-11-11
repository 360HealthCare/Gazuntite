package com.gazuntite.history.dto
{
	[Binable]
	public class PatientVisitProviderDTO
	{
		private var _VisitId:int;
		private var _ProviderId:int;
		private var _ProviderFirstName:String;
		private var _ProviderLastName:String;
		private var _Speciality:String;
		private var _level1:String;
		private var _level2:String;
		private var _GAXEN_ID:String;
		
		public function PatientVisitProviderDTO()
		{
		}
		
		public function get GAXEN_ID():String
		{
			return _GAXEN_ID;
		}

		public function set GAXEN_ID(value:String):void
		{
			_GAXEN_ID = value;
		}

		public function get level2():String
		{
			return _level2;
		}

		public function set level2(value:String):void
		{
			_level2 = value;
		}

		public function get level1():String
		{
			return _level1;
		}

		public function set level1(value:String):void
		{
			_level1 = value;
		}

		public function get Speciality():String
		{
			return _Speciality;
		}

		public function set Speciality(value:String):void
		{
			_Speciality = value;
		}

		public function get ProviderLastName():String
		{
			return _ProviderLastName;
		}

		public function set ProviderLastName(value:String):void
		{
			_ProviderLastName = value;
		}

		public function get ProviderFirstName():String
		{
			return _ProviderFirstName;
		}

		public function set ProviderFirstName(value:String):void
		{
			_ProviderFirstName = value;
		}

		public function get ProviderId():int
		{
			return _ProviderId;
		}

		public function set ProviderId(value:int):void
		{
			_ProviderId = value;
		}

		public function get VisitId():int
		{
			return _VisitId;
		}

		public function set VisitId(value:int):void
		{
			_VisitId = value;
		}
		public function get ProviderFullName():String
		{
			return ProviderFirstName +' '+ ProviderLastName;
		}

		public function FromXML(x:XML):void
		{
			VisitId               =x.@VisitId;           
			ProviderFirstName     =x.@ProviderFirstName; 
			ProviderLastName      =x.@ProviderLastName;  
			ProviderId            =x.@ProviderId;        
			Speciality            =x.@Speciality;        
			level1                =x.@level1;            
			level2                =x.@level2;            
			GAXEN_ID                =x.@GaxenUserID;            
		}
		
	}
}