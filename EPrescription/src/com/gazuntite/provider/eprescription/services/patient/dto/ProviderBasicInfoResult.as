package com.gazuntite.provider.eprescription.services.patient.dto
{
	///Added by zahid
	
	
	[Bindable]
	public class ProviderBasicInfoResult
	{
		public function ProviderBasicInfoResult()
		{
		}
		
		private var _userID				:int;
		private var _SSN				:String;
		private var _Gender				:String;
		private var _LicenseNumber		:String;
		private var _EIN				:String;
		private var _NPI				:String;
		private var _DAE				:String;
		private var _UPIN				:String;
		private var _TPI				:String;
		private var _WorkDays			:String;
		private var _WorkStart			:String;
		private var _WorkEnd			:String;
		
		private var _WorkingDays		:XML;
		
		private var _FederalTaxId		:String;
		private var _ImageData			:String;
		private var _Phone				:String;
		private var _State				:String;
		private var _Address			:String;
		private var _City				:String;
		private var _Zip				:String;
		private var _PrefixTypeID		:String;
		private var _FirstName			:String;
		private var _LastName			:String;
		private var _MiddleName			:String;
		private var _Suffix				:String;
		private var _UserEmail			:String;
		private var _Title				:String;
		private var _SpecialityID		:String='';
		private var _sessionStatus		:String= 'Offline';
		private var _EUserName			:String;
		private var _EPassword			:String;
		private var _GAXENID			:String;
		private var _FaxNumber			:String;
		private var _RecGuid			:String;
		private var _PhoneExtension		:String;
		private var _StreetName			:String;
		private var _CLIANumber			:String;
		private var _IsHospice			:String;
		private var _SignatureOnFile	:String;
		private var _SignatureDate		:String;
		private var _IsParticipating	:String;
		private var _StopSubmission		:String;
		private var _AddressBookID		:String = '0';
		private var _AddressID			:String	= '0';
		
		public function FromXML(x:XML):void
		{	
			FirstName  			= x.FirstName;
			MiddleName  		= x.MiddleName;
			LastName  			= x.LastName;
			EIN 				= x.EIN;
			AddressBookID		= x.AddressBookID;
			AddressID			= x.AddressID;
			DAE 				= x.DAE;
			ImageData 			= x.ImageData;
			FederalTaxId		= x.FederalTaxId;
			Gender				= x.GenderName;
			City				= x.City;
			State				= x.State;
			Zip					= x.Zip;
			SSN					= x.SSN;
			WorkDays			= x.WorkDays;
			WorkEnd				= x.WorkEnd;
			WorkStart			= x.WorkStart;
			//WorkingDays			= x.WorkingDays[0] as XML;
			Address				= x.Address;
			UPIN				= x.UPIN;
			TPI					= x.TPI;
			Phone				= x.Phone;
			LicenseNumber		= x.LicenseNumber;
			NPI 				= x.NPI;
			UserEmail			= x.UserEmail;
			userID				= x.UserId;
			Title 				= x.Title;
			SpecialityID 		= x.SpecialityID;
			EUserName 			= x.EUserName;
			PhoneExtension 		= x.PhoneExtension;
			StreetName 			= x.StreetName;
			EPassword 			= x.EPassword;
			GAXENID 			= x.GAXENID;
			RecGuid 			= x.RecGuid;
			FaxNumber 			= x.FaxNumber;
			PhoneExtension 		= x.PhoneExtension;
			Suffix 				= x.Suffix;
			PrefixTypeID 		= x.PrefixTypeID;
			sessionStatus 		= x.USER_STATUS_DESCRIPTION;
			CLIANumber 			= x.CLIANumber;
			IsHospice 			= x.IsHospiceEmployee;
			SignatureOnFile 	= x.SignatureOnFile;
			SignatureDate 		= x.SignatureDate;
			IsParticipating 	= x.IsMedicareParticipating;
			StopSubmission 		= x.StopSubmission;
			
		}
		//------------- GETTER SETTERS ------------------------
		public function get AddressBookID():String
		{
			return _AddressBookID;
		}
		public function set AddressBookID(value:String):void
		{
			_AddressBookID = value;
		}
		public function get AddressID():String
		{
			return _AddressID;
		}
		public function set AddressID(value:String):void
		{
			_AddressID = value;
		}
		public function get PhoneExtension():String
		{
			return _PhoneExtension;
		}
		public function set PhoneExtension(value:String):void
		{
			_PhoneExtension = value;
		}
		public function get StreetName():String
		{
			return _StreetName;
		}
		public function set StreetName(value:String):void
		{
			_StreetName = value;
		}
		public function get RecGuid():String
		{
			return _RecGuid;
		}
		public function set RecGuid(value:String):void
		{
			_RecGuid = value;
		}
		public function get WorkingDays():XML
		{
			return _WorkingDays;
		}
		public function set WorkingDays(value:XML):void
		{
			_WorkingDays = value;
		}
		public function get CLIANumber():String
		{
			return _CLIANumber;
		}
		public function set CLIANumber(value:String):void
		{
			_CLIANumber = value;
		}
		public function get IsHospice():String
		{
			return _IsHospice;
		}
		public function set IsHospice(value:String):void
		{
			_IsHospice = value;
		}
		public function get SignatureOnFile():String
		{
			return _SignatureOnFile;
		}
		public function set SignatureOnFile(value:String):void
		{
			_SignatureOnFile = value;
		}
		public function get SignatureDate():String
		{
			return _SignatureDate;
		}
		public function set SignatureDate(value:String):void
		{
			_SignatureDate = value;
		}
		public function get IsParticipating():String
		{
			return _IsParticipating;
		}
		public function set IsParticipating(value:String):void
		{
			_IsParticipating = value;
		}
		public function get StopSubmission():String
		{
			return _StopSubmission;
		}
		
		public function set StopSubmission(value:String):void
		{
			_StopSubmission = value;
		}
		
		
		public function get FaxNumber():String
		{
			return _FaxNumber;
		}
		
		public function set FaxNumber(value:String):void
		{
			_FaxNumber = value;
		}
		
		public function get GAXENID():String
		{
			return _GAXENID;
		}
		
		public function set GAXENID(value:String):void
		{
			_GAXENID = value;
		}
		
		public function get EPassword():String
		{
			return _EPassword;
		}
		
		public function set EPassword(value:String):void
		{
			_EPassword = value;
		}
		
		public function get EUserName():String
		{
			return _EUserName;
		}
		
		public function set EUserName(value:String):void
		{
			_EUserName = value;
		}
		
		public function get userID():int
		{
			return _userID;
		}
		
		public function set userID(value:int):void
		{
			_userID = value;
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
		
		public function get LicenseNumber():String
		{
			return _LicenseNumber;
		}
		
		public function set LicenseNumber(value:String):void
		{
			_LicenseNumber = value;
		}
		
		public function get EIN():String
		{
			return _EIN;
		}
		
		public function set EIN(value:String):void
		{
			_EIN = value;
		}
		
		public function get NPI():String
		{
			return _NPI;
		}
		
		public function set NPI(value:String):void
		{
			_NPI = value;
		}
		
		public function get DAE():String
		{
			return _DAE;
		}
		
		public function set DAE(value:String):void
		{
			_DAE = value;
		}
		
		public function get UPIN():String
		{
			return _UPIN;
		}
		
		public function set UPIN(value:String):void
		{
			_UPIN = value;
		}
		
		public function get TPI():String
		{
			return _TPI;
		}
		
		public function set TPI(value:String):void
		{
			_TPI = value;
		}
		
		public function get WorkDays():String
		{
			return _WorkDays;
		}
		
		public function set WorkDays(value:String):void
		{
			_WorkDays = value;
		}
		
		public function get WorkStart():String
		{
			return _WorkStart;
		}
		
		public function set WorkStart(value:String):void
		{
			_WorkStart = value;
		}
		
		public function get WorkEnd():String
		{
			return _WorkEnd;
		}
		
		public function set WorkEnd(value:String):void
		{
			_WorkEnd = value;
		}
		
		public function get FederalTaxId():String
		{
			return _FederalTaxId;
		}
		
		public function set FederalTaxId(value:String):void
		{
			_FederalTaxId = value;
		}
		
		public function get ImageData():String
		{
			return _ImageData;
		}
		
		public function set ImageData(value:String):void
		{
			_ImageData = value;
		}
		
		public function get Phone():String
		{
			return _Phone;
		}
		
		public function set Phone(value:String):void
		{
			_Phone = value;
		}
		
		public function get State():String
		{
			return _State;
		}
		
		public function set State(value:String):void
		{
			_State = value;
		}
		
		public function get Address():String
		{
			return _Address;
		}
		
		public function set Address(value:String):void
		{
			_Address = value;
		}
		
		public function get City():String
		{
			return _City;
		}
		
		public function set City(value:String):void
		{
			_City = value;
		}
		
		public function get Zip():String
		{
			return _Zip;
		}
		
		public function set Zip(value:String):void
		{
			_Zip = value;
		}
		
		public function get PrefixTypeID():String
		{
			return _PrefixTypeID;
		}
		
		public function set PrefixTypeID(value:String):void
		{
			_PrefixTypeID = value;
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
		
		public function get Suffix():String
		{
			return _Suffix;
		}
		
		public function set Suffix(value:String):void
		{
			_Suffix = value;
		}
		
		public function get UserEmail():String
		{
			return _UserEmail;
		}
		
		public function set UserEmail(value:String):void
		{
			_UserEmail = value;
		}
		
		public function get Title():String
		{
			return _Title;
		}
		
		public function set Title(value:String):void
		{
			_Title = value;
		}
		
		public function get sessionStatus():String
		{
			return _sessionStatus;
		}
		
		public function set sessionStatus(value:String):void
		{
			_sessionStatus = value;
		}
		public function get SpecialityID():String
		{
			return _SpecialityID;
		}
		
		public function set SpecialityID(value:String):void
		{
			_SpecialityID = value;
		}
		//------------- GETTER SETTERS ------------------------
		
	}
}