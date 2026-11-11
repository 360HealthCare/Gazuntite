package com.zigron.gazuntite.model.valueObjects.login
{
	
	import com.gazuntite.utils.UtilityFunctions;
	import com.zigron.gazuntite.model.valueObjects.common.BaseDTO;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class LoginDTO extends BaseDTO
	{
		private var _IsPatient:Boolean;
		private var _isLocked:Boolean;
		private var _isPasswordExpired:Boolean;
		private var _IsPracticeExpired:Boolean;
		private var _isAlertUser:Boolean;
		private var _isValidUser:Boolean;
		private var _isActive:Boolean;
		
		private var _RemainingDaysBeforeExpiry:int;
		private var _UserId:int;

		private var _UserEmail:String;
		private var _FirstName:String;
		private var _LastName:String;
		private var _MiddleName:String;
		private var _Suffix:String;
		private var _Prefix:String;
		private var _Gender:String;
		private var _SSN:String;
		
		//private var _Address:String; // = '95 South Main St.';  // remove this initilization , in actuall implemenration.
		
		public var AllUserTypes:ArrayCollection = new ArrayCollection();
		public var UserClinicBranchesList:ArrayCollection = new ArrayCollection();
		
		public var UserSelectedClinicBranchDTO:UserClinicBranchDTO;
		
		public function LoginDTO()
		{
		}


		public function FromXml(x:XML):void
		{
			
			super.FromXML(x);
			
			IsPatient						=UtilityFunctions.StringToBoolean(x.@IsPatient);
			isLocked						=UtilityFunctions.StringToBoolean(x.@isLocked);
			isPasswordExpired				=UtilityFunctions.StringToBoolean(x.@isPasswordExpired);
			IsPracticeExpired				=UtilityFunctions.StringToBoolean(x.@IsPracticeExpired);
			isAlertUser						=UtilityFunctions.StringToBoolean(x.@isAlertUser);
			isValidUser						=UtilityFunctions.StringToBoolean(x.@isValidUser);
			isActive						=UtilityFunctions.StringToBoolean(x.@isActive);
			
			RemainingDaysBeforeExpiry		=x.@RemainingDaysBeforeExpiry;
			UserId     						=x.@UserId;
			
			UserEmail						=x.@UserEmail;
			FirstName						=x.@FirstName;
			LastName						=x.@LastName;
			MiddleName						=x.@MiddleName;
			Suffix  						=x.@Suffix;
			Prefix							=x.@Prefix;
			Gender							=x.@Gender;
			SSN     						=x.@SSN;
			
			for each (var xtype:XML in x.AllUserTypes.UserType)
			{
				var obj:UserTypeDTO = new UserTypeDTO();
				obj.FromXml(xtype);
				AllUserTypes.addItem(obj);
			}
			
			for each (var xclinicBranch:XML in x.UserClinicBranchesList.UserClinicBranchDTO)
			{
				var ob:UserClinicBranchDTO = new UserClinicBranchDTO();
				ob.FromXml(xclinicBranch);
				UserClinicBranchesList.addItem(ob);
				
				if( null != ob.UserSelectedStation )
					UserSelectedClinicBranchDTO = ob;
			}
		}
		
		
		public function set FullName(value:String):void
		{
			//do as Romans do :)
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
		
		public function get SSN():String
		{
			return _SSN;
		}

		public function set SSN(value:String):void
		{
			_SSN = value;
		}

		public function get Gender():String
		{
			return _Gender;
		}

		public function set Gender(value:String):void
		{
			_Gender = value;
		}

		public function get Prefix():String
		{
			return _Prefix;
		}

		public function set Prefix(value:String):void
		{
			_Prefix = value;
		}

		public function get Suffix():String
		{
			return _Suffix;
		}

		public function set Suffix(value:String):void
		{
			_Suffix = value;
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

		public function get UserEmail():String
		{
			return _UserEmail;
		}

		public function set UserEmail(value:String):void
		{
			_UserEmail = value;
		}

		public function get UserId():int
		{
			return _UserId;
		}

		public function set UserId(value:int):void
		{
			_UserId = value;
		}

		public function get RemainingDaysBeforeExpiry():int
		{
			return _RemainingDaysBeforeExpiry;
		}

		public function set RemainingDaysBeforeExpiry(value:int):void
		{
			_RemainingDaysBeforeExpiry = value;
		}


		public function get isActive():Boolean
		{
			return _isActive;
		}

		public function set isActive(value:Boolean):void
		{
			_isActive = value;
		}

		public function get isValidUser():Boolean
		{
			return _isValidUser;
		}

		public function set isValidUser(value:Boolean):void
		{
			_isValidUser = value;
		}

		public function get isAlertUser():Boolean
		{
			return _isAlertUser;
		}

		public function set isAlertUser(value:Boolean):void
		{
			_isAlertUser = value;
		}

		public function get IsPracticeExpired():Boolean
		{
			return _IsPracticeExpired;
		}

		public function set IsPracticeExpired(value:Boolean):void
		{
			_IsPracticeExpired = value;
		}

		public function get isPasswordExpired():Boolean
		{
			return _isPasswordExpired;
		}

		public function set isPasswordExpired(value:Boolean):void
		{
			_isPasswordExpired = value;
		}

		public function get isLocked():Boolean
		{
			return _isLocked;
		}

		public function set isLocked(value:Boolean):void
		{
			_isLocked = value;
		}

		public function get IsPatient():Boolean
		{
			return _IsPatient;
		}

		public function set IsPatient(value:Boolean):void
		{
			_IsPatient = value;
		}

	}
}