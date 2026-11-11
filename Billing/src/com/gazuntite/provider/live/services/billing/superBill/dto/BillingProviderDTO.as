package com.gazuntite.provider.live.services.billing.superBill.dto
{
	import com.gazuntite.common.util.xml.XmlConstants;
	import com.gazuntite.common.util.xml.XmlUtils;

	[Bindable]
	public class BillingProviderDTO
	{
		
		

		public function FromXML( x:XML ):void
		{
			UserId 							= x.@[XmlConstants.USERID];
			FirstName 						= x.@[XmlConstants.FIRST_NAME];
			LastName 						= x.@[XmlConstants.LAST_NAME];			
			MiddleName 						= x.@[XmlConstants.MIDDLE_NAME];
			UserEmail 						= x.@[XmlConstants.USEREMAIL];
			SSN 							= x.@[XmlConstants.SSN];			
			DoctorId 						= x.@[XmlConstants.DOCTORID];
			NPI 							= x.@[XmlConstants.NPI];			
			UPIN 							= x.@[XmlConstants.UPIN];
			DAE 							= x.@[XmlConstants.DAE];
			TPI 							= x.@[XmlConstants.TPI];
			PriorAuthorization 				= x.@[XmlConstants.PRIORAUTHORIZATION];
			RecGuid 						= x.@[XmlConstants.RECGUID];
			SpecialityID 					= x.@[XmlConstants.SPECIALITYID];
			SpecialityName 					= x.@[XmlConstants.SPECIALITYNAME];
			PracticeName 					= x.@[XmlConstants.PRACTICENAME];
			PracticeAddress 				= x.@[XmlConstants.PRACTICEADDRESS];
			PracticeCity 					= x.@[XmlConstants.PRACTICECITY];
			PracticeState 					= x.@[XmlConstants.PRACTICESTATE];
			PracticeZIP 					= x.@[XmlConstants.PRACTICEZIP];
			PracticePhone 					= x.@[XmlConstants.PRACTICEPHONE];
			ContactPerson 					= x.@[XmlConstants.CONTACTPERSON];			
			CLIANumber 						= x.@["CLIANumber"];
			IsHospice 						= x.@["IsHospice"];
			SignatureOnFile 				= x.@["SignatureOnFile"];
			SignatureDate 					= x.@["SignatureDate"];
			IsParticipating 				= x.@["IsParticipating"];
			StopSubmission 					= x.@["StopSubmission"];
			PracticeNPI 					= x.@["PracticeNPI"];
			PracticeTaxonomy 				= x.@["PracticeTaxonomy"];
			PracticeTPI 					= x.@["PracticeTPI"];
		}
		
		public function ToXML():XML
		{
			var x:XML = XmlUtils.getNodeByTagName( "ProviderInfo" );
			
			x.@[XmlConstants.USERID]						= UserId;
			x.@[XmlConstants.FIRST_NAME]					= FirstName;
			x.@[XmlConstants.LAST_NAME]						= LastName;
			x.@[XmlConstants.MIDDLE_NAME]					= MiddleName;
			x.@[XmlConstants.USEREMAIL]						= UserEmail;
			x.@[XmlConstants.SSN]							= SSN;
			x.@[XmlConstants.DOCTORID]						= DoctorId;
			x.@[XmlConstants.NPI]							= NPI;
			x.@[XmlConstants.UPIN]							= UPIN;
			x.@[XmlConstants.DAE]							= DAE;
			x.@[XmlConstants.TPI]							= TPI;
			x.@[XmlConstants.PRIORAUTHORIZATION]			= PriorAuthorization;
			x.@[XmlConstants.SPECIALITYNAME]				= SpecialityName;
			x.@[XmlConstants.PRACTICENAME]					= PracticeName;
			x.@[XmlConstants.PRACTICEADDRESS]				= PracticeAddress;
			x.@[XmlConstants.PRACTICECITY]					= PracticeCity;
			x.@[XmlConstants.PRACTICESTATE]					= PracticeState;
			x.@[XmlConstants.PRACTICEZIP]					= PracticeZIP;
			x.@[XmlConstants.PRACTICEPHONE]					= PracticePhone;
			x.@[XmlConstants.CONTACTPERSON]					= ContactPerson;			
			x.@["CLIANumber"]								= CLIANumber;
			x.@["IsHospice"]								= IsHospice;
			x.@["SignatureOnFile"]							= SignatureOnFile;
			x.@["SignatureDate"]							= SignatureDate;
			x.@["IsParticipating"]							= IsParticipating;
			x.@["StopSubmission"]  							= StopSubmission;	
			x.@["PracticeNPI"]  							= PracticeNPI;
			x.@["PracticeTaxonomy"]  						= PracticeTaxonomy;
			x.@["PracticeTPI"]  							= PracticeTPI;
			
			
			return x
		}
		
		private var m_sUserId:String;
		
		private var m_sCLIANumber:String;
		private var m_sIsHospice:String;
		private var m_sSignatureOnFile:String;
		private var m_sSignatureDate:String;
		private var m_sIsParticipating:String;
		private var m_sStopSubmission:String;
		
		private var m_sPracticeNPI:String;
		private var m_sPracticeTaxonomy:String;
		private var m_sPracticeTPI:String;
		
		public function get PracticeTPI():String
		{
			return m_sPracticeTPI;
		}
		
		public function set PracticeTPI(value:String):void
		{
			m_sPracticeTPI = value;
		}
		
		public function get PracticeTaxonomy():String
		{
			return m_sPracticeTaxonomy;
		}
		
		public function set PracticeTaxonomy(value:String):void
		{
			m_sPracticeTaxonomy = value;
		}
		
		public function get PracticeNPI():String
		{
			return m_sPracticeNPI;
		}
		
		public function set PracticeNPI(value:String):void
		{
			m_sPracticeNPI = value;
		}
		
		public function get StopSubmission():String
		{
			return m_sStopSubmission;
		}
		
		public function set StopSubmission(value:String):void
		{
			m_sStopSubmission = value;
		}
		
		public function get IsParticipating():String
		{
			return m_sIsParticipating;
		}
		
		public function set IsParticipating(value:String):void
		{
			m_sIsParticipating = value;
		}
		
		public function get SignatureDate():String
		{
			return m_sSignatureDate;
		}
		
		public function set SignatureDate(value:String):void
		{
			m_sSignatureDate = value;
		}
		
		public function get SignatureOnFile():String
		{
			return m_sSignatureOnFile;
		}
		
		public function set SignatureOnFile(value:String):void
		{
			m_sSignatureOnFile = value;
		}
		
		public function get IsHospice():String
		{
			return m_sIsHospice;
		}
		
		public function set IsHospice(value:String):void
		{
			m_sIsHospice = value;
		}
		
		public function get CLIANumber():String
		{
			return m_sCLIANumber;
		}
		
		public function set CLIANumber(value:String):void
		{
			m_sCLIANumber = value;
		}
		
		public function get UserId():String
		{
			return m_sUserId;
		}
		
		public function set UserId(value:String):void
		{
			m_sUserId = value;
		}
		
		private var m_sFirstName:String;
		
		public function get FirstName():String
		{
			return m_sFirstName;
		}
		
		public function set FirstName(value:String):void
		{
			m_sFirstName = value;
		}
		
		private var m_sLastName:String;
		
		public function get LastName():String
		{
			return m_sLastName;
		}
		
		public function set LastName(value:String):void
		{
			m_sLastName = value;
		}
		
		private var m_sSSN:String;
		
		public function get SSN():String
		{
			return m_sSSN;
		}
		
		public function set SSN(value:String):void
		{
			m_sSSN = value;
		}
		
		private var m_sMiddleName:String;
		
		public function get MiddleName():String
		{
			return m_sMiddleName;
		}
		
		public function set MiddleName(value:String):void
		{
			m_sMiddleName = value;
		}
		
		private var m_sUserEmail:String;
		
		public function get UserEmail():String
		{
			return m_sUserEmail;
		}
		
		public function set UserEmail(value:String):void
		{
			m_sUserEmail = value;
		}
		
		private var m_sDoctorId:String;
		
		public function get DoctorId():String
		{
			return m_sDoctorId;
		}
		
		public function set DoctorId(value:String):void
		{
			m_sDoctorId = value;
		}
		
		private var m_sNPI:String;	
		public function get  NPI():String
		{
			return m_sNPI;
		}
		
		public function set  NPI(value:String):void
		{
			m_sNPI = value;
		}
		
		private var m_sUPIN:String;
		public function get  UPIN():String
		{
			return m_sUPIN;
		}
		
		public function set  UPIN(value:String):void
		{
			m_sUPIN = value;
		}
		
		private var m_sDAE:String;
		public function get  DAE():String
		{
			return m_sDAE;
		}
		
		public function set  DAE(value:String):void
		{
			m_sDAE = value;
		}
		
		private var m_sTPI:String;
		public function get  TPI():String
		{
			return m_sTPI;
		}
		
		public function set  TPI(value:String):void
		{
			m_sTPI = value;
		}
		
		private var m_sPriorAuthorization:String;
		public function get  PriorAuthorization():String
		{
			return m_sPriorAuthorization;
		}
		
		public function set  PriorAuthorization(value:String):void
		{
			m_sPriorAuthorization = value;
		}
		
		private var m_sRecGuid:String;
		public function get  RecGuid():String
		{
			return m_sRecGuid;
		}
		
		public function set  RecGuid(value:String):void
		{
			m_sRecGuid = value;
		}
		
		private var m_sSpecialityID:String;
		public function get SpecialityID():String
		{
			return m_sSpecialityID;
		}
		
		public function set SpecialityID(value:String):void
		{
			m_sSpecialityID = value;
		}
		
		private var m_sSpecialityName:String;
		public function get SpecialityName():String
		{
			return m_sSpecialityName;
		}
		
		public function set SpecialityName(value:String):void
		{
			m_sSpecialityName = value;
		}
		
		private var m_sPracticeName:String;
		public function get PracticeName():String
		{
			return m_sPracticeName;
		}
		
		public function set PracticeName(value:String):void
		{
			m_sPracticeName = value;
		}
		
		private var m_sPracticeAddress:String;
		public function get PracticeAddress():String
		{
			return m_sPracticeAddress;
		}
		
		public function set PracticeAddress(value:String):void
		{
			m_sPracticeAddress = value;
		}
		
		private var m_sPracticeCity:String;
		public function get PracticeCity():String
		{
			return m_sPracticeCity;
		}
		
		public function set PracticeCity(value:String):void
		{
			m_sPracticeCity = value;
		}
		
		private var m_sPracticeState:String;
		public function get PracticeState():String
		{
			return m_sPracticeState;
		}
		
		public function set PracticeState(value:String):void
		{
			m_sPracticeState = value;
		}
		
		private var m_sPracticeZIP:String;
		public function get PracticeZIP():String
		{
			return m_sPracticeZIP;
		}
		
		public function set PracticeZIP(value:String):void
		{
			m_sPracticeZIP = value;
		}
		
		private var m_sPracticePhone:String;	
		public function get PracticePhone():String
		{
			return m_sPracticePhone;
		}
		
		public function set PracticePhone(value:String):void
		{
			m_sPracticePhone = value;
		}
		
		private var m_sContactPerson:String;
		public function get ContactPerson():String
		{
			return m_sContactPerson;
		}
		
		public function set ContactPerson(value:String):void
		{
			m_sContactPerson = value;
		}
		
	}
}