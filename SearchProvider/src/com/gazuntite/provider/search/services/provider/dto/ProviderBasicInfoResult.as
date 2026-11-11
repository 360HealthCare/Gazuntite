package com.gazuntite.provider.search.services.provider.dto
{
	///Added by zahid
	import com.gazuntite.common.dto.ProviderSearchDTO;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.provider.search.services.provider.dto.providerdto;
	import com.gazuntite.utils.UtilityFunctions;
	
	import flash.utils.ByteArray;
	import flash.xml.XMLDocument;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Image;
	import mx.rpc.xml.SimpleXMLDecoder;
	import mx.utils.Base64Decoder;

	[Bindable]
	public class ProviderBasicInfoResult
	{
		public function ProviderBasicInfoResult()
		{
		}
		
		private var _userID				:int;
		private var _SSN				:String;
		private var _Gender				:String;
		private var _LicenseNumber				:String;
		private var _EIN				:String;
		private var _NPI				:String;
		private var _DAE				:String;
		private var _UPIN				:String;
		private var _TPI				:String;
		private var _WorkDays				:String;
		private var _WorkStart				:String;
		private var _WorkEnd				:String;
		private var _FederalTaxId				:String;
		private var _ImageData				:ByteArray;
		private var _Phone				:String;
		private var _State				:String;
		private var _Address				:String;
		private var _City				:String;
		private var _Zip				:String;
		private var _PrefixTypeID				:String;
		private var _FirstName				:String;
		private var _LastName				:String;
		private var _MiddleName				:String;
		private var _Suffix				:String;
		private var _UserEmail				:String;
		private var _Title				:String;
		private var _sessionStatus		:String;
		private var _StreetName		:String;

		
		private var _HomePage:String;
		private var _GMapPage:String;
		private var _Notes:String;
		private var _LastUpdated:String;

		
		
		
		
		public function get StreetName():String
		{
			return _StreetName;
		}

		public function set StreetName(value:String):void
		{
			_StreetName = value;
		}

		public function get LastUpdated():String
		{
			return _LastUpdated;
		}

		public function set LastUpdated(value:String):void
		{
			_LastUpdated = value;
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
		
		public function get ImageData():ByteArray
		{
			return _ImageData;
		}
		
		public function set ImageData(value:ByteArray):void
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
		
		public function FromXML(x:XML):void
		{	
			var xmlDoc:XMLDocument = new XMLDocument(x);
			var decoder:SimpleXMLDecoder = new SimpleXMLDecoder(true);
			var resultObj:Object = decoder.decodeXML(xmlDoc);
			var i:int = 0;
			//var objProviderSearchDetails:ProviderSearchDTO=new ProviderSearchDTO();
			
			/*for( i = 0; i < resultObj.ArrayOfContactSearchDTO.ContactSearchDTO.length; i++ )
			{
			*/
			if(resultObj.ClinicProviderSearchDTO.FirstName != null)
				FirstName=resultObj.ClinicProviderSearchDTO.FirstName;
			else
				FirstName="";
			if(resultObj.ClinicProviderSearchDTO.LastName != null)
				LastName=resultObj.ClinicProviderSearchDTO.LastName;
			else
				LastName="";
			if(resultObj.ClinicProviderSearchDTO.MiddleName != null)
				MiddleName=resultObj.ClinicProviderSearchDTO.MiddleName;
			else
				MiddleName="";
			
			if(resultObj.ClinicProviderSearchDTO.EIN != null)
				EIN = resultObj.ClinicProviderSearchDTO.EIN;
			else
				EIN = "";
			if(resultObj.ClinicProviderSearchDTO.DAE != null)
				DAE = resultObj.ClinicProviderSearchDTO.DAE;
			else
				DAE = "";
			if(resultObj.ClinicProviderSearchDTO.ImageData != null)
			{
				//var arr:ByteArray = new ByteArray();
				//arr.writeObject(resultObj.ClinicProviderSearchDTO.ImageData);
				 var base64Dec:Base64Decoder;
				base64Dec = new Base64Decoder();
				base64Dec.decode(resultObj.ClinicProviderSearchDTO.ImageData.toString());
				ImageData = base64Dec.toByteArray();
				
				//ImageData = arr;
			}
			
			
			if(resultObj.ClinicProviderSearchDTO.HomePage != null)
				HomePage=resultObj.ClinicProviderSearchDTO.HomePage;
			else
				HomePage="";
			if(resultObj.ClinicProviderSearchDTO.GMapPage != null)
				GMapPage=resultObj.ClinicProviderSearchDTO.GMapPage;
			else
				GMapPage="";
			if(resultObj.ClinicProviderSearchDTO.Notes != null)
				Notes=resultObj.ClinicProviderSearchDTO.Notes;
			else
				Notes="";
			if(resultObj.ClinicProviderSearchDTO.LastUpdated != null)
				LastUpdated=resultObj.ClinicProviderSearchDTO.LastUpdated;
			else
				LastUpdated="";
			if(resultObj.ClinicProviderSearchDTO.FederalTaxId != null)
				FederalTaxId=resultObj.ClinicProviderSearchDTO.FederalTaxId;
			else
				FederalTaxId="";
			if(resultObj.ClinicProviderSearchDTO.GenderName != null)
				Gender=resultObj.ClinicProviderSearchDTO.GenderName;
			else
				Gender="";
			if(resultObj.ClinicProviderSearchDTO.City != null)
				City=resultObj.ClinicProviderSearchDTO.City;
			else
				City="";
			if(resultObj.ClinicProviderSearchDTO.State != null)
				State=resultObj.ClinicProviderSearchDTO.State;
			else
				State="";
			if(resultObj.ClinicProviderSearchDTO.StreetName != null)
				StreetName=resultObj.ClinicProviderSearchDTO.StreetName;
			else
				StreetName="";
			if(resultObj.ClinicProviderSearchDTO.Zip != null)
				Zip=resultObj.ClinicProviderSearchDTO.Zip;
			else
				Zip="";
			if(resultObj.ClinicProviderSearchDTO.SSN != null)
				SSN=resultObj.ClinicProviderSearchDTO.SSN;
			else
				SSN="";
			if(resultObj.ClinicProviderSearchDTO.WorkDays != null)
				WorkDays=resultObj.ClinicProviderSearchDTO.WorkDays;
			else
				WorkDays="";
			if(resultObj.ClinicProviderSearchDTO.WorkEnd != null)
				WorkEnd=resultObj.ClinicProviderSearchDTO.WorkEnd;
			else
				WorkEnd="";
			if(resultObj.ClinicProviderSearchDTO.WorkStart != null)
				WorkStart=resultObj.ClinicProviderSearchDTO.WorkStart;
			else
				WorkStart="";
			if(resultObj.ClinicProviderSearchDTO.Address != null)
				Address=resultObj.ClinicProviderSearchDTO.Address;
			else
				Address="";
			if(resultObj.ClinicProviderSearchDTO.UPIN != null)
				UPIN=resultObj.ClinicProviderSearchDTO.UPIN;
			else
				UPIN="";
			if(resultObj.ClinicProviderSearchDTO.TPI != null)
				TPI=resultObj.ClinicProviderSearchDTO.TPI;
			else
				TPI="";
			if(resultObj.ClinicProviderSearchDTO.Phone != null)
				Phone=resultObj.ClinicProviderSearchDTO.Phone;
			else
				Phone="";
			if(resultObj.ClinicProviderSearchDTO.LicenseNumber != null)
				LicenseNumber=resultObj.ClinicProviderSearchDTO.LicenseNumber;
			else
				LicenseNumber="";
			if(resultObj.ClinicProviderSearchDTO.NPI != null)
			NPI = resultObj.ClinicProviderSearchDTO.NPI;// Address;
			else
				NPI="";
			
			if(resultObj.ClinicProviderSearchDTO.UserEmail != null)
				UserEmail=resultObj.ClinicProviderSearchDTO.UserEmail;
			else
				UserEmail="";
			
			if(resultObj.ClinicProviderSearchDTO.UserId != null)
				userID=resultObj.ClinicProviderSearchDTO.UserId;
			
			if(resultObj.ClinicProviderSearchDTO.Title != null)
				Title = resultObj.ClinicProviderSearchDTO.Title;
			
			if(resultObj.ClinicProviderSearchDTO.USER_STATUS_DESCRIPTION != null)
				sessionStatus = resultObj.ClinicProviderSearchDTO.USER_STATUS_DESCRIPTION;
			else
				sessionStatus = "Offline";
		}
	}
}