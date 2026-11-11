package com.gazuntite.common.dto.baseDTO
{
	import com.gazuntite.common.dto.ImageDTO;
	import com.gazuntite.common.dto.typeDTO.GenderTypeDTO;
	import com.gazuntite.common.dto.typeDTO.PrefixTypeDTO;
	import com.gazuntite.common.dto.typeDTO.StatusTypeDTO;
	import com.gazuntite.common.dto.typeDTO.UserTypeDTO;
	import com.gazuntite.common.util.xml.XmlUtils;
	
	import mx.graphics.shaderClasses.SaturationShader;

	public class BaseUserDTO
	{
		public function BaseUserDTO()
		{
		}
		
		private var _IsDeleted : Boolean;
		private var _IsDirty : Boolean;
		private var _AccountStatus : StatusTypeDTO;
		private var _ActiveUserType : UserTypeDTO;
		private var _ActiveUserTypeLabel : String;
		private var _ClinicBranhId : int;
		private var _CreatedAt : Date;
		private var _CreatedBy : int;
		private var _CreatedDate : Date;
		private var _EIN : String;
		private var _FederalTaxId : String;
		private var _FirstName : String;
		private var _Gender : GenderTypeDTO;
		private var _Image : ImageDTO;
		private var _IsActive : Boolean;
		private var _IsLockedOut : Boolean;
		private var _IsSSNSelected : Boolean;
		private var _LastName : String;
		private var _LicenseNumber : String;
		private var _MiddleName : String;
		private var _ModifiedAt : Date;
		private var _ModifiedBy : int;
		private var _OtherID : String;
		private var _Prefix : PrefixTypeDTO;
		private var _QuivusUserID : String;
		private var _SSN : String;
		private var _Suffix : String;
		private var _TextPassword : String;
		private var _UserEmail : String;
		private var _UserId : int;
		private var _UserName : String;
		private var _UserPassword : String;
		private var _label : String;

		public function ToXML():XML
		{
			var x:XML = XmlUtils.getNodeByTagName("BaseUserDTO");
			
			if(Prefix)			
				x.appendChild(Prefix.ToXML());
			if(Gender)
				x.appendChild(Gender.ToXML());
			if(AccountStatus)
				x.appendChild(AccountStatus.ToXML());
			if(ActiveUserType)
				x.appendChild(ActiveUserType.ToXML(true));
			if(Image)
			{
				x.appendChild(Image.ToXML(true));
			}
			
			x.@["FirstName"] 		= FirstName;
			x.@["LastName"] 		= LastName;
			x.@["MiddleName"] 		= MiddleName;			
			x.@["UserPassword"] 	= UserPassword;	
			x.@["Suffix"] 			= Suffix;	
			x.@["SSN"] 				= SSN;	
			x.@["LicenseNumber"] 	= LicenseNumber;	
			x.@["FederalTaxId"] 	= FederalTaxId;	
			x.@["EIN"] 				= EIN;	
			x.@["QuivusUserID"] 	= QuivusUserID;	
			x.@["ClinicBranhId"] 	= ClinicBranhId;	
			x.@["UserName"] 		= UserName;	
			x.@["CreatedBy"] 		= CreatedBy;	
			x.@["UserEmail"] 		= UserEmail;	
			x.@["UserId"] 			= UserId;	
			x.@["ModifiedBy"] 		= ModifiedBy;	
			x.@["OtherID"] 			= OtherID;	
			
			return x;
		}
		
		public function FromXML(x:XML):void
		{
			if(x.Prefix)
			{
				Prefix = new PrefixTypeDTO();
				Prefix.FromXML(x.Prefix);
			}
			
			if(x.Gender)
			{
				Gender = new GenderTypeDTO();
				Gender.FromXML(x.Gender);
			}
			if(x.AccountStatus)
			{
				AccountStatus = new StatusTypeDTO();
				AccountStatus.FromXML(x.AccountStatus);
			}
			if(x.ActiveUserType)
			{
				ActiveUserType = new UserTypeDTO();
				ActiveUserType.FromXML(x.ActiveUserType);
			}
			if(x.Image)
			{
				Image = new ImageDTO();
				Image.FromXML(x.Image);
			}
						
			FirstName				= x.@["FirstName"];
			LastName				= x.@["LastName"];
			MiddleName				= x.@["MiddleName"];			
			UserPassword			= x.@["UserPassword"];	
			Suffix					= x.@["Suffix"];	
			SSN						= x.@["SSN"];	
			LicenseNumber			= x.@["LicenseNumber"];	
			FederalTaxId			= x.@["FederalTaxId"];	
			EIN						= x.@["EIN"];	
			QuivusUserID			= x.@["QuivusUserID"];	
			ClinicBranhId			= x.@["ClinicBranhId"];	
			UserName				= x.@["UserName"];	
			CreatedBy				= x.@["CreatedBy"];	
			UserEmail				= x.@["UserEmail"];	
			UserId					= x.@["UserId"];	
			ModifiedBy				= x.@["ModifiedBy"];	
			OtherID					= x.@["OtherID"];	
		}
		
		public function get IsDeleted():Boolean
		{
			return _IsDeleted;
		}

		public function set IsDeleted(value:Boolean):void
		{
			_IsDeleted = value;
		}

		public function get IsDirty():Boolean
		{
			return _IsDirty;
		}

		public function set IsDirty(value:Boolean):void
		{
			_IsDirty = value;
		}

		public function get ActiveUserType():UserTypeDTO
		{
			return _ActiveUserType;
		}

		public function set ActiveUserType(value:UserTypeDTO):void
		{
			_ActiveUserType = value;
		}

		public function get ActiveUserTypeLabel():String
		{
			return _ActiveUserTypeLabel;
		}

		public function set ActiveUserTypeLabel(value:String):void
		{
			_ActiveUserTypeLabel = value;
		}

		public function get ClinicBranhId():int
		{
			return _ClinicBranhId;
		}

		public function set ClinicBranhId(value:int):void
		{
			_ClinicBranhId = value;
		}

		public function get CreatedAt():Date
		{
			return _CreatedAt;
		}

		public function set CreatedAt(value:Date):void
		{
			_CreatedAt = value;
		}

		public function get CreatedBy():int
		{
			return _CreatedBy;
		}

		public function set CreatedBy(value:int):void
		{
			_CreatedBy = value;
		}

		public function get CreatedDate():Date
		{
			return _CreatedDate;
		}

		public function set CreatedDate(value:Date):void
		{
			_CreatedDate = value;
		}

		public function get EIN():String
		{
			return _EIN;
		}

		public function set EIN(value:String):void
		{
			_EIN = value;
		}

		public function get FederalTaxId():String
		{
			return _FederalTaxId;
		}

		public function set FederalTaxId(value:String):void
		{
			_FederalTaxId = value;
		}

		public function get FirstName():String
		{
			return _FirstName;
		}

		public function set FirstName(value:String):void
		{
			_FirstName = value;
		}

		public function get Gender():GenderTypeDTO
		{
			return _Gender;
		}

		public function set Gender(value:GenderTypeDTO):void
		{
			_Gender = value;
		}

		public function get IsActive():Boolean
		{
			return _IsActive;
		}

		public function set IsActive(value:Boolean):void
		{
			_IsActive = value;
		}

		public function get IsLockedOut():Boolean
		{
			return _IsLockedOut;
		}

		public function set IsLockedOut(value:Boolean):void
		{
			_IsLockedOut = value;
		}

		public function get IsSSNSelected():Boolean
		{
			return _IsSSNSelected;
		}

		public function set IsSSNSelected(value:Boolean):void
		{
			_IsSSNSelected = value;
		}

		public function get LastName():String
		{
			return _LastName;
		}

		public function set LastName(value:String):void
		{
			_LastName = value;
		}

		public function get LicenseNumber():String
		{
			return _LicenseNumber;
		}

		public function set LicenseNumber(value:String):void
		{
			_LicenseNumber = value;
		}

		public function get MiddleName():String
		{
			return _MiddleName;
		}

		public function set MiddleName(value:String):void
		{
			_MiddleName = value;
		}

		public function get ModifiedAt():Date
		{
			return _ModifiedAt;
		}

		public function set ModifiedAt(value:Date):void
		{
			_ModifiedAt = value;
		}

		public function get ModifiedBy():int
		{
			return _ModifiedBy;
		}

		public function set ModifiedBy(value:int):void
		{
			_ModifiedBy = value;
		}

		public function get OtherID():String
		{
			return _OtherID;
		}

		public function set OtherID(value:String):void
		{
			_OtherID = value;
		}

		public function get QuivusUserID():String
		{
			return _QuivusUserID;
		}

		public function set QuivusUserID(value:String):void
		{
			_QuivusUserID = value;
		}

		public function get SSN():String
		{
			return _SSN;
		}

		public function set SSN(value:String):void
		{
			_SSN = value;
		}

		public function get Suffix():String
		{
			return _Suffix;
		}

		public function set Suffix(value:String):void
		{
			_Suffix = value;
		}

		public function get TextPassword():String
		{
			return _TextPassword;
		}

		public function set TextPassword(value:String):void
		{
			_TextPassword = value;
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

		public function get UserName():String
		{
			return _UserName;
		}

		public function set UserName(value:String):void
		{
			_UserName = value;
		}

		public function get UserPassword():String
		{
			return _UserPassword;
		}

		public function set UserPassword(value:String):void
		{
			_UserPassword = value;
		}

		public function get label():String
		{
			return _label;
		}

		public function set label(value:String):void
		{
			_label = value;
		}

		public function get Prefix():PrefixTypeDTO
		{
			return _Prefix;
		}

		public function set Prefix(value:PrefixTypeDTO):void
		{
			_Prefix = value;
		}

		public function get AccountStatus():StatusTypeDTO
		{
			return _AccountStatus;
		}

		public function set AccountStatus(value:StatusTypeDTO):void
		{
			_AccountStatus = value;
		}

		public function get Image():ImageDTO
		{
			return _Image;
		}

		public function set Image(value:ImageDTO):void
		{
			_Image = value;
		}

		

	}
}