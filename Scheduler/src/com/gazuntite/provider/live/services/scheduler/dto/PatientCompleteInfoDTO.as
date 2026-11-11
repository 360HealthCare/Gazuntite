package com.gazuntite.provider.live.services.scheduler.dto
{
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerXmlConstants;
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerXmlUtils;
	
	import mx.utils.StringUtil;

	[Bindable]
	public class PatientCompleteInfoDTO
	{
		private var m_sUserID:String;
		private var m_sID:String;
		private var m_sFirstName:String;
		private var m_sMiddleName:String;
		private var m_sLastName:String;
		private var m_sQuivusID:String;
		private var m_sSSN:String;
		private var m_sRecGuid:String;
		private var m_sDOB:String;
		private var m_sGenderID:String;
		private var m_sGenderName:String;
		private var m_sInsuranceBalance:String;
		private var m_sRejectedClaims:String;
		private var m_sPatientBalance:String;
		private var m_sClaimsOverDue:String;
		private var m_sIsChronicDiagnosis:String;
		private var m_sPreferredLocation:String;
		private var m_sPrimaryProvider:String;
		private var m_sReferringProvider:String;
		private var m_sPhoneNumber:String;
		private var m_sNextVisit:String;
		private var m_sLastVisit:String;
		private var m_sInsurenceUserID:String;
		private var m_sCopay:String;
		private var m_sPatientId:String;
		private var m_sPolicyNumber:String;
		private var m_sGroupNumber:String;
		private var m_sPlan:String;
		private var m_sInsuredName:String;
		private var m_sInsuredDOB:String;
		private var m_sStartDate:String;
		private var m_sEndDate:String;
		private var m_sIsEligible:String;
		private var m_sEligibilityCheckOn:String;
		
		private var m_sPatientName:String;
		
// **************  Parser function for XML ***************************************************************	

		public function FromXML( x:XML ):void
		{
			UserID 				= x.@[SchedulerXmlConstants.USERID];
			ID 					= x.@[SchedulerXmlConstants.ID];
			FirstName 			= x.@[SchedulerXmlConstants.FIRSTNAME];
			MiddleName 			= x.@[SchedulerXmlConstants.MIDDLENAME];
			LastName 			= x.@[SchedulerXmlConstants.LASTNAME];
			QuivusID 			= x.@[SchedulerXmlConstants.QUIVUSID];
			SSN 				= x.@[SchedulerXmlConstants.SSN];
			RecGuid 			= x.@[SchedulerXmlConstants.RECHUID];
			DOB		 			= x.@[SchedulerXmlConstants.DOB];
			GenderID 			= x.@[SchedulerXmlConstants.GENDERID];
			GenderName 			= x.@[SchedulerXmlConstants.GENDERNAME];
			InsuranceBalance 	= x.@[SchedulerXmlConstants.INSURENCEBALANCE];
			RejectedClaims 		= x.@[SchedulerXmlConstants.REJECTEDCLAIMS];
			PatientBalance 		= x.@[SchedulerXmlConstants.PATIENTBALANCE];
			ClaimsOverDue 		= x.@[SchedulerXmlConstants.CLAMISOVERDUE];
			IsChronicDiagnosis 	= x.@[SchedulerXmlConstants.ISCHRONICDIAGNOSE];
			PreferredLocation 	= x.@[SchedulerXmlConstants.PREFERREDLOCATION];
			PrimaryProvider 	= x.@[SchedulerXmlConstants.PRIMARYPROVIDER];
			ReferringProvider 	= x.@[SchedulerXmlConstants.REFFERCINGPROVIDER];
			PhoneNumber 		= x.@[SchedulerXmlConstants.PHONENO];
			NextVisit 			= x.@[SchedulerXmlConstants.NEXTVISIT];
			LastVisit 			= x.@[SchedulerXmlConstants.LASTVISIT];
			
			InsurenceUserID		= x.PatientInsurances.PatientInsurance.@[SchedulerXmlConstants.USERID];
			Copay				= x.PatientInsurances.PatientInsurance.@[SchedulerXmlConstants.COPAY];
			PatientId			= x.PatientInsurances.PatientInsurance.@[SchedulerXmlConstants.PATIENTID];
			PolicyNumber		= x.PatientInsurances.PatientInsurance.@[SchedulerXmlConstants.POLICYNUMBER];
			GroupNumber			= x.PatientInsurances.PatientInsurance.@[SchedulerXmlConstants.GROUPNUMBER];
			Plan				= x.PatientInsurances.PatientInsurance.@[SchedulerXmlConstants.INSURENCEPLAN];
			InsuredName			= x.PatientInsurances.PatientInsurance.@[SchedulerXmlConstants.INSUREDPERSONNAME];
			InsuredDOB			= x.PatientInsurances.PatientInsurance.@[SchedulerXmlConstants.INSUREDPERSONDOB];
			StartDate			= x.PatientInsurances.PatientInsurance.@[SchedulerXmlConstants.STARTDATE];
			EndDate				= x.PatientInsurances.PatientInsurance.@[SchedulerXmlConstants.ENDDATE];
			IsEligible			= x.PatientInsurances.PatientInsurance.@[SchedulerXmlConstants.ISELIGIBLE];
			EligibilityCheckOn	= x.PatientInsurances.PatientInsurance.@[SchedulerXmlConstants.ELIGIBILITYCHECKON];
			
			PatientName         = StringUtil.trim(FirstName)+' '+StringUtil.trim(MiddleName)+' '+StringUtil.trim(LastName);
			
		}
		
		public function clearPatientDTO():void
		{
			UserID 				= '';
			ID 					= '';
			FirstName 			= '';
			MiddleName 			= '';
			LastName 			= '';
			QuivusID 			= '';
			SSN 				= '';
			RecGuid 			= '';
			DOB		 			= '';
			GenderID 			= '';
			GenderName 			= '';
			InsuranceBalance 	= '';
			RejectedClaims 		= '';
			PatientBalance 		= '';
			ClaimsOverDue 		= '';
			IsChronicDiagnosis 	= '';
			PreferredLocation 	= '';
			PrimaryProvider 	= '';
			ReferringProvider 	= '';
			PhoneNumber			= '';
			NextVisit 			= '';
			LastVisit 			= '';
			
			InsurenceUserID		= '';
			Copay				= '';
			PatientId			= '';
			PolicyNumber		= '';
			GroupNumber			= '';
			Plan				= '';
			InsuredName			= '';
			InsuredDOB			= '';
			StartDate			= '';
			EndDate				= '';
			IsEligible			= '';
			EligibilityCheckOn	= '';
			
			PatientName         = StringUtil.trim(FirstName)+' '+StringUtil.trim(MiddleName)+' '+StringUtil.trim(LastName);
		}

		//##################### GETTER & SETTER ########################################		
		public function get UserID():String
		{
			return m_sUserID;
		}

		public function set UserID(value:String):void
		{
			m_sUserID = value;
		}

		public function get ID():String
		{
			return m_sID;
		}

		public function set ID(value:String):void
		{
			m_sID = value;
		}

		public function get FirstName():String
		{
			StringUtil.trim(m_sFirstName);
			return m_sFirstName;
		}

		public function set FirstName(value:String):void
		{
			m_sFirstName = value;
		}

		public function get MiddleName():String
		{
			StringUtil.trim(m_sMiddleName);
			return m_sMiddleName;
		}

		public function set MiddleName(value:String):void
		{
			m_sMiddleName = value;
		}

		public function get LastName():String
		{
			StringUtil.trim(m_sLastName);
			return m_sLastName;
		}

		public function set LastName(value:String):void
		{
			m_sLastName = value;
		}
		//custom Start
		public function get PatientName():String
		{
			StringUtil.trim(m_sPatientName);
			return m_sPatientName;
		}
		
		public function set PatientName(value:String):void
		{
			m_sPatientName = value;
		}
		//Custom End
		
		public function get QuivusID():String
		{
			return m_sQuivusID;
		}

		public function set QuivusID(value:String):void
		{
			m_sQuivusID = value;
		}

		public function get SSN():String
		{
			return m_sSSN;
		}

		public function set SSN(value:String):void
		{
			m_sSSN = value;
		}

		public function get RecGuid():String
		{
			return m_sRecGuid;
		}

		public function set RecGuid(value:String):void
		{
			m_sRecGuid = value;
		}

		public function get DOB():String
		{
			return m_sDOB;
		}

		public function set DOB(value:String):void
		{
			value = value.substr(0,10);
			m_sDOB = value;
		}

		public function get GenderID():String
		{
			return m_sGenderID;
		}

		public function set GenderID(value:String):void
		{
			m_sGenderID = value;
		}

		public function get GenderName():String
		{
			return m_sGenderName;
		}

		public function set GenderName(value:String):void
		{
			m_sGenderName = value;
		}

		public function get InsuranceBalance():String
		{
			return m_sInsuranceBalance;
		}

		public function set InsuranceBalance(value:String):void
		{
			
			m_sInsuranceBalance = value;
		}

		public function get RejectedClaims():String
		{
			return m_sRejectedClaims;
		}

		public function set RejectedClaims(value:String):void
		{
			m_sRejectedClaims = value;
		}

		public function get PatientBalance():String
		{
			return m_sPatientBalance;
		}

		public function set PatientBalance(value:String):void
		{
			m_sPatientBalance = value;
		}

		public function get ClaimsOverDue():String
		{
			return m_sClaimsOverDue;
		}

		public function set ClaimsOverDue(value:String):void
		{
			m_sClaimsOverDue = value;
		}

		public function get IsChronicDiagnosis():String
		{
			return m_sIsChronicDiagnosis;
		}

		public function set IsChronicDiagnosis(value:String):void
		{
			m_sIsChronicDiagnosis = value;
		}

		public function get PreferredLocation():String
		{
			return m_sPreferredLocation;
		}
		
		public function get PhoneNumber():String
		{
			return m_sPhoneNumber;
		}
		
		public function set PhoneNumber(value:String):void
		{
			m_sPhoneNumber = value;
		}


		public function set PreferredLocation(value:String):void
		{
			m_sPreferredLocation = value;
		}

		public function get PrimaryProvider():String
		{
			return m_sPrimaryProvider;
		}

		public function set PrimaryProvider(value:String):void
		{
			m_sPrimaryProvider = value;
		}

		public function get ReferringProvider():String
		{
			return m_sReferringProvider;
		}

		public function set ReferringProvider(value:String):void
		{
			m_sReferringProvider = value;
		}

		public function get NextVisit():String
		{
			return m_sNextVisit;
		}

		public function set NextVisit(value:String):void
		{
			m_sNextVisit = value;
		}

		public function get LastVisit():String
		{
			return m_sLastVisit;
		}

		public function set LastVisit(value:String):void
		{
			m_sLastVisit = value;
		}

		public function get InsurenceUserID():String
		{
			return m_sInsurenceUserID;
		}

		public function set InsurenceUserID(value:String):void
		{
			m_sInsurenceUserID = value;
		}

		public function get Copay():String
		{
			return m_sCopay;
		}

		public function set Copay(value:String):void
		{
			m_sCopay = value;
		}

		public function get PatientId():String
		{
			return m_sPatientId;
		}

		public function set PatientId(value:String):void
		{
			m_sPatientId = value;
		}

		public function get PolicyNumber():String
		{
			return m_sPolicyNumber;
		}

		public function set PolicyNumber(value:String):void
		{
			m_sPolicyNumber = value;
		}

		public function get GroupNumber():String
		{
			return m_sGroupNumber;
		}

		public function set GroupNumber(value:String):void
		{
			m_sGroupNumber = value;
		}

		public function get Plan():String
		{
			return m_sPlan;
		}

		public function set Plan(value:String):void
		{
			m_sPlan = value;
		}

		public function get InsuredName():String
		{
			return m_sInsuredName;
		}

		public function set InsuredName(value:String):void
		{
			m_sInsuredName = value;
		}

		public function get InsuredDOB():String
		{
			return m_sInsuredDOB;
		}

		public function set InsuredDOB(value:String):void
		{
			m_sInsuredDOB = value;
		}

		public function get StartDate():String
		{
			return m_sStartDate;
		}

		public function set StartDate(value:String):void
		{
			m_sStartDate = value;
		}

		public function get EndDate():String
		{
			return m_sEndDate;
		}

		public function set EndDate(value:String):void
		{
			m_sEndDate = value;
		}

		public function get IsEligible():String
		{
			return m_sIsEligible;
		}

		public function set IsEligible(value:String):void
		{
			m_sIsEligible = value;
		}

		public function get EligibilityCheckOn():String
		{
			return m_sEligibilityCheckOn;
		}

		public function set EligibilityCheckOn(value:String):void
		{
			m_sEligibilityCheckOn = value;
		}

		
	}
}