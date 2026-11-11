package com.gazuntite.provider.live.services.scheduler.dto
{
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerXmlConstants;
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerXmlUtils;
	
	import mx.utils.StringUtil;

	[Bindable]
	public class SearchPatientDTO
	{
		private var m_sUserId:String;
		private var m_sID:String;
		private var m_sFirstName:String;
		private var m_sLastName:String;
		private var m_sMiddleName:String;
		private var m_sQuivusID:String;
		private var m_sDOB:String;
		private var m_sAuthorized:String;
		private var m_sEmail:String;
		private var m_sSnailID:String;
		private var m_sSMS:String;
		private var m_sChat:String;
		private var m_sPhone:String;
		private var m_sSSN:String;
		private var m_sGenderID:String;
		private var m_sGenderName:String;
		
		private var m_sPatientName:String;
		
		// Parser function for XML	
		public function FromXML( x:XML ):void
		{
			UserId 				= x.@[SchedulerXmlConstants.USERID];
			ID 					= x.@[SchedulerXmlConstants.ID];
			FirstName 			= x.@[SchedulerXmlConstants.FIRSTNAME];
			MiddleName 			= x.@[SchedulerXmlConstants.MIDDLENAME];
			LastName 			= x.@[SchedulerXmlConstants.LASTNAME];
			QuivusID 			= x.@[SchedulerXmlConstants.QUIVUSID];
			DOB					= x.@[SchedulerXmlConstants.DOB];
			Authorized			= x.@[SchedulerXmlConstants.AUTHORIZED];
			Email  				= x.@[SchedulerXmlConstants.EMAIL];
			SnailID  			= x.@[SchedulerXmlConstants.SNAILID];
			SMS  				= x.@[SchedulerXmlConstants.SMS];
			Chat 				= x.@[SchedulerXmlConstants.CHAT];
			Phone  				= x.@[SchedulerXmlConstants.PHONE];
			SSN  				= x.@[SchedulerXmlConstants.SSN];
			GenderID  			= x.@[SchedulerXmlConstants.GENDERID];
			GenderName  		= x.@[SchedulerXmlConstants.GENDERNAME];
			
			PatientName = StringUtil.trim(FirstName)+' '+ StringUtil.trim(MiddleName)+' '+ StringUtil.trim(LastName);
		}
		
		
//############## GETTER AND SETTER #####################################		
		public function get UserId():String
		{
			return m_sUserId;
		}

		public function set UserId(value:String):void
		{
			m_sUserId = value;
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
			return m_sFirstName;
		}

		public function set FirstName(value:String):void
		{
			m_sFirstName = value;
		}

		public function get LastName():String
		{
			return m_sLastName;
		}

		public function set LastName(value:String):void
		{
			m_sLastName = value;
		}

		public function get MiddleName():String
		{
			return m_sMiddleName;
		}

		public function set MiddleName(value:String):void
		{
			m_sMiddleName = value;
		}

		public function get QuivusID():String
		{
			return m_sQuivusID;
		}

		public function set QuivusID(value:String):void
		{
			m_sQuivusID = value;
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

		public function get Authorized():String
		{
			return m_sAuthorized;
		}

		public function set Authorized(value:String):void
		{
			m_sAuthorized = value;
		}

		public function get Email():String
		{
			return m_sEmail;
		}

		public function set Email(value:String):void
		{
			m_sEmail = value;
		}

		public function get SnailID():String
		{
			return m_sSnailID;
		}

		public function set SnailID(value:String):void
		{
			m_sSnailID = value;
		}

		public function get SMS():String
		{
			return m_sSMS;
		}

		public function set SMS(value:String):void
		{
			m_sSMS = value;
		}

		public function get Chat():String
		{
			return m_sChat;
		}

		public function set Chat(value:String):void
		{
			m_sChat = value;
		}

		public function get Phone():String
		{
			return m_sPhone;
		}

		public function set Phone(value:String):void
		{
			m_sPhone = value;
		}

		public function get SSN():String
		{
			return m_sSSN;
		}

		public function set SSN(value:String):void
		{
			m_sSSN = value;
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

		public function get PatientName():String
		{
			return m_sPatientName;
		}

		public function set PatientName(value:String):void
		{
			m_sPatientName = value;
		}


	}
}