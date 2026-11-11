package com.gazuntite.provider.live.services.scheduler.dto
{
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerXmlConstants;
	
	import mx.utils.StringUtil;

	[Bindable]
	public class RequestDTO
	{
		private var m_sID:String;
		private var m_sProviderID:String;		//ProviderID
		private var m_sProviderUserID:String;	//ProviderUserID
		private var m_sProviderTypeID:String;	//ProviderTypeID
		private var m_sProviderTypeName:String;	//ProviderTypeName
		private var m_sProviderName:String;		//ProviderName
		private var m_sRequestPatientID:String;	
		private var m_sStationID:String;		//Station in XML
		private var m_sLocationName:String;		//LocationName
		private var m_sLocationAddress:String;	//LocationAddress
		private var m_sRequestDate:String;		
		private var m_sStartTime:String;
		private var m_sEndTime:String;
		private var m_sEmail:String;
		private var m_sCreatedAt:String;
		private var m_sCreatedBy:String;
		private var m_sModifiedBy:String;
		private var m_sModifiedAt:String;
		private var m_sIsDeleted:String;
		private var m_sSpecialityId:String;		//SpecialityId
		private var m_sSpecialityName:String;	//SpecialityName
		private var m_sAppointmentTypeID:String;//AppointmentTypeID
		private var m_sAppointmentDuration:String;//AppointmentDuration
		
		private var m_sTypeID:String; 
		private var m_sTypeName:String; 
		
		private var m_sPatientID:String;		
		private var m_sPatientFirstName:String;
		private var m_sPatientLastName:String;
	
		private var m_sPatientFullName:String;
		
		// Parser function for XML	
		public function FromXML( x:XML ):void
		{
			
			ID 						= x.@[SchedulerXmlConstants.ID];
			ProviderID 				= x.@[SchedulerXmlConstants.PROVIDERID];
			ProviderUserID			= x.@[SchedulerXmlConstants.PROVIDERUSERID];
			ProviderTypeID 			= x.@[SchedulerXmlConstants.PROVIDERTYPEID];
			ProviderTypeName 		= x.@[SchedulerXmlConstants.PROVIDERTYPENAME];
			ProviderName 			= x.@[SchedulerXmlConstants.PROVIDERNAME];
			RequestPatientID 		= x.@[SchedulerXmlConstants.PATIENTID];
			StationID 				= x.@[SchedulerXmlConstants.STATION];
			LocationName 			= x.@[SchedulerXmlConstants.LOCATIONNAME];
			LocationAddress 		= x.@[SchedulerXmlConstants.LOCATIONADDRESS];
			RequestDate 			= x.@[SchedulerXmlConstants.DATE];
			StartTime 				= x.@[SchedulerXmlConstants.STARTTIME];
			EndTime 				= x.@[SchedulerXmlConstants.ENDTIME];
			Email 					= x.@[SchedulerXmlConstants.EMAIL];
			CreatedAt 				= x.@[SchedulerXmlConstants.CREATEDAT];
			CreatedBy				= x.@[SchedulerXmlConstants.CREATEDBY];
			ModifiedBy				= x.@[SchedulerXmlConstants.MODIFIEDBY];
			ModifiedAt				= x.@[SchedulerXmlConstants.MODIFIEDAT];
			IsDeleted				= x.@[SchedulerXmlConstants.ISDELETED];
			SpecialityId			= x.@[SchedulerXmlConstants.SPECIALITYID];
			SpecialityName			= x.@[SchedulerXmlConstants.SPECIALITYNAME];
			AppointmentTypeID		= x.@[SchedulerXmlConstants.APPOINTMENTYPEID];
			AppointmentDuration		= x.@['AppointmentDuration'];
			
			TypeID					= x.Type.@[SchedulerXmlConstants.ID];
			TypeName				= x.Type.@[SchedulerXmlConstants.NAME];
			
			PatientID				= x.Patient.@[SchedulerXmlConstants.ID];
			PatientFirstName		= x.Patient.@[SchedulerXmlConstants.FIRSTNAME];
			PatientLastName			= x.Patient.@[SchedulerXmlConstants.LASTNAME];		
			
			PatientFullName			= StringUtil.trim(PatientFirstName) +' '+ StringUtil.trim(PatientLastName);
		}

//******************** START GETTER & SETTER ****************************************************
		public function get ID():String
		{
			return m_sID;
		}

		public function set ID(value:String):void
		{
			m_sID = value;
		}

		public function get ProviderID():String
		{
			return m_sProviderID;
		}

		public function set ProviderID(value:String):void
		{
			m_sProviderID = value;
		}

		public function get ProviderUserID():String
		{
			return m_sProviderUserID;
		}

		public function set ProviderUserID(value:String):void
		{
			m_sProviderUserID = value;
		}

		public function get ProviderTypeID():String
		{
			return m_sProviderTypeID;
		}

		public function set ProviderTypeID(value:String):void
		{
			m_sProviderTypeID = value;
		}

		public function get ProviderTypeName():String
		{
			return m_sProviderTypeName;
		}

		public function set ProviderTypeName(value:String):void
		{
			m_sProviderTypeName = value;
		}

		public function get ProviderName():String
		{
			return m_sProviderName;
		}

		public function set ProviderName(value:String):void
		{
			m_sProviderName = value;
		}

		public function get RequestPatientID():String
		{
			return m_sRequestPatientID;
		}

		public function set RequestPatientID(value:String):void
		{
			m_sRequestPatientID = value;
		}

		public function get StationID():String
		{
			return m_sStationID;
		}

		public function set StationID(value:String):void
		{
			m_sStationID = value;
		}

		public function get LocationName():String
		{
			return m_sLocationName;
		}

		public function set LocationName(value:String):void
		{
			m_sLocationName = value;
		}

		public function get LocationAddress():String
		{
			return m_sLocationAddress;
		}

		public function set LocationAddress(value:String):void
		{
			m_sLocationAddress = value;
		}

		public function get RequestDate():String
		{
			return m_sRequestDate;
		}

		public function set RequestDate(value:String):void
		{
			m_sRequestDate = value;
		}

		public function get StartTime():String
		{
			return m_sStartTime;
		}

		public function set StartTime(value:String):void
		{
			m_sStartTime = value;
		}

		public function get EndTime():String
		{
			return m_sEndTime;
		}

		public function set EndTime(value:String):void
		{
			m_sEndTime = value;
		}

		public function get Email():String
		{
			return m_sEmail;
		}

		public function set Email(value:String):void
		{
			m_sEmail = value;
		}

		public function get CreatedAt():String
		{
			return m_sCreatedAt;
		}

		public function set CreatedAt(value:String):void
		{
			m_sCreatedAt = value;
		}

		public function get CreatedBy():String
		{
			return m_sCreatedBy;
		}

		public function set CreatedBy(value:String):void
		{
			m_sCreatedBy = value;
		}

		public function get ModifiedBy():String
		{
			return m_sModifiedBy;
		}

		public function set ModifiedBy(value:String):void
		{
			m_sModifiedBy = value;
		}

		public function get ModifiedAt():String
		{
			return m_sModifiedAt;
		}

		public function set ModifiedAt(value:String):void
		{
			m_sModifiedAt = value;
		}

		public function get IsDeleted():String
		{
			return m_sIsDeleted;
		}

		public function set IsDeleted(value:String):void
		{
			m_sIsDeleted = value;
		}

		public function get SpecialityId():String
		{
			return m_sSpecialityId;
		}

		public function set SpecialityId(value:String):void
		{
			m_sSpecialityId = value;
		}

		public function get SpecialityName():String
		{
			return m_sSpecialityName;
		}

		public function set SpecialityName(value:String):void
		{
			m_sSpecialityName = value;
		}

		public function get AppointmentTypeID():String
		{
			return m_sAppointmentTypeID;
		}

		public function set AppointmentTypeID(value:String):void
		{
			m_sAppointmentTypeID = value;
		}

		public function get TypeID():String
		{
			return m_sTypeID;
		}

		public function set TypeID(value:String):void
		{
			m_sTypeID = value;
		}

		public function get TypeName():String
		{
			return m_sTypeName;
		}

		public function set TypeName(value:String):void
		{
			m_sTypeName = value;
		}

		public function get PatientID():String
		{
			return m_sPatientID;
		}

		public function set PatientID(value:String):void
		{
			m_sPatientID = value;
		}

		public function get PatientFirstName():String
		{
			return m_sPatientFirstName;
		}

		public function set PatientFirstName(value:String):void
		{
			m_sPatientFirstName = value;
		}

		public function get PatientLastName():String
		{
			return m_sPatientLastName;
		}

		public function set PatientLastName(value:String):void
		{
			m_sPatientLastName = value;
		}

		public function get PatientFullName():String
		{
			return m_sPatientFullName;
		}

		public function set PatientFullName(value:String):void
		{
			m_sPatientFullName = value;
		}

		public function get AppointmentDuration():String
		{
			return m_sAppointmentDuration;
		}

		public function set AppointmentDuration(value:String):void
		{
			m_sAppointmentDuration = value;
		}

		
//##################### GETTER & SETTER END ########################################		
		
	}
}