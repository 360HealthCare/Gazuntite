package com.zigron.gazuntite.model.valueObjects.provider
{
	import com.zigron.gazuntite.model.valueObjects.common.BaseDTO;
	import com.gazuntite.utils.UtilityFunctions;

	[Bindable]
	public class ProviderDTO extends BaseDTO
	{
		private var _FirstName:String;
		private var _LastName:String;
		private var _MiddleName:String;
		private var _UserEmail:String;
		private var _HomePage:String;
		private var _GMapPage:String;
		private var _Notes:String;
		private var _Address:String;
		private var _LastUpdated:String;
		private var _Password:String;
		
		private var _Status:ProviderStatusDTO;

		private var _UserId:int;
		private var _PrefixTypeID:int;
		private var _Suffix:int;

		private var _IsAvailableForChat:Boolean = false;
	
		public function ProviderDTO()
		{
			_Status = new ProviderStatusDTO();
		}
		
		
		public function get Status():String
		{
			return _Status.status;
		}

		public function set Status(value:String):void
		{
			_Status.status = value;
		}
			
		public function get IsAvailableForChat():Boolean
		{
			return _IsAvailableForChat;
		}

		public function set IsAvailableForChat(value:Boolean):void
		{
			_IsAvailableForChat = value;
		}

		public function get Suffix():int
		{
			return _Suffix;
		}

		public function set Suffix(value:int):void
		{
			_Suffix = value;
		}

		public function get PrefixTypeID():int
		{
			return _PrefixTypeID;
		}

		public function set PrefixTypeID(value:int):void
		{
			_PrefixTypeID = value;
		}

		public function get UserId():int
		{
			return _UserId;
		}

		public function set UserId(value:int):void
		{
			_UserId = value;
		}

		public function get Password():String
		{
			return _Password;
		}

		public function set Password(value:String):void
		{
			_Password = value;
		}

		public function get LastUpdated():String
		{
			return _LastUpdated;
		}

		public function set LastUpdated(value:String):void
		{
			_LastUpdated = value;
		}

		public function get Address():String
		{
			return _Address;
		}

		public function set Address(value:String):void
		{
			_Address = value;
		}

		public function get Notes():String
		{
			return _Notes;
		}

		public function set Notes(value:String):void
		{
			_Notes = value;
		}

		public function get GMapPage():String
		{
			return _GMapPage;
		}

		public function set GMapPage(value:String):void
		{
			_GMapPage = value;
		}

		public function get HomePage():String
		{
			return _HomePage;
		}

		public function set HomePage(value:String):void
		{
			_HomePage = value;
		}

		public function get UserEmail():String
		{
			return _UserEmail;
		}

		public function set UserEmail(value:String):void
		{
			_UserEmail = value;
		}

		public function get MiddleName():String
		{
			return _MiddleName;
		}

		public function set MiddleName(value:String):void
		{
			_MiddleName = value;
		}

		public function get LastName():String
		{
			return _LastName;
		}

		public function set LastName(value:String):void
		{
			_LastName = value;
		}

		public function get FirstName():String
		{
			return _FirstName;
		}

		public function set FirstName(value:String):void
		{
			_FirstName = value;
		}
		
		public function set FullName(value:String):void
		{
		 	//do as roman do :)
		}

		public function get FullName():String
		{
			var name:String = FirstName + " ";
			
			if( UtilityFunctions.IsNotNullOrEmpty( MiddleName ) )
			{
				name += MiddleName + " ";
			}
			
			name += LastName;
			
			return name;
		}

		override public  function FromXML(x:XML):void
		{
			super.FromXML( x );
			
			this.FirstName 		= x.FirstName;
			this.LastName 		= x.LastName;
			this.MiddleName 	= x.MiddleName;
			this.PrefixTypeID 	= x.PrefixTypeID;
			this.Suffix 		= x.Suffix;
			this.UserEmail 		= x.UserEmail;
			this.UserId 		= x.UserId;
			this.HomePage 		= x.homePage;
			this.GMapPage 		= x.gmapPage;
			this.Notes 			= x.notes;
			this.Address 		= x.address;
			this.LastUpdated 	= x.LastUpdated;
			this.Password 		= x.Password;
			
		}

	}
}