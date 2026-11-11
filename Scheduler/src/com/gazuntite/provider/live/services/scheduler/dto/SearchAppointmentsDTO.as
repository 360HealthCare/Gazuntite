package com.gazuntite.provider.live.services.scheduler.dto
{
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerXmlConstants;
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerXmlUtils;
	
	import mx.utils.StringUtil;

	[Bindable]
	public class SearchAppointmentsDTO
	{
		private var m_sID:String;
		private var m_sStationID:String;
		private var m_sStationName:String;
		private var m_sRequestID:String;
		private var m_sUserID:String;		//ProviderUserID
		private var m_sDate:String;
		private var m_sStartTime:String;
		private var m_sEndTime:String;
		private var m_sClinicId:String;
		private var m_sChiefComplaint:String;
		private var m_sCreatedBy:String;
		private var m_sCreatedAt:String;
		private var m_sModifiedBy:String;
		private var m_sModifiedAt:String;
		private var m_sIsDeleted:String;
		private var m_sAlert:String;
		private var m_sFirstName:String;
		private var m_sLastName:String;
		private var m_sMiddleName:String;
		private var m_sQuivusID:String;
		private var m_sLastVisit:String;
		private var m_sTypeID:String;
		private var m_sTypeName:String;
		private var m_sStatusID:String;
		private var m_sStatusName:String;
		private var m_sNextAction:String;
		private var m_sPatientID:String;
		private var m_sPatientFirstName:String;
		private var m_sPatientLastName:String;
		private var m_sPatientMiddleName:String;
		
		
		private var m_sProviderName:String;
		private var m_sPatientName:String;
		
		// Parser function for XML	
		public function FromXML( x:XML ):void
		{
			ID 						= x.@[SchedulerXmlConstants.ID];
			StationID 				= x.@[SchedulerXmlConstants.STATIONID];
			StationName				= x.@[SchedulerXmlConstants.STATIONNAME];
			RequestID 				= x.@[SchedulerXmlConstants.REQUESTID];
			UserID 					= x.@[SchedulerXmlConstants.USERID];
			Date 					= x.@[SchedulerXmlConstants.DATE];
			StartTime 				= x.@[SchedulerXmlConstants.STARTTIME];
			EndTime 				= x.@[SchedulerXmlConstants.ENDTIME];
			ClinicId 				= x.@[SchedulerXmlConstants.CLIENID];
			ChiefComplaint 			= x.@[SchedulerXmlConstants.CHIEFCOMPLAINT];
			CreatedBy 				= x.@[SchedulerXmlConstants.CREATEDBY];
			CreatedAt 				= x.@[SchedulerXmlConstants.CREATEDAT];
			ModifiedBy 				= x.@[SchedulerXmlConstants.MODIFIEDBY];
			ModifiedAt 				= x.@[SchedulerXmlConstants.MODIFIEDAT];
			IsDeleted 				= x.@[SchedulerXmlConstants.ISDELETED];
			Alert 					= x.@[SchedulerXmlConstants.ALERT];
			FirstName				= x.@[SchedulerXmlConstants.FIRSTNAME];
			LastName				= x.@[SchedulerXmlConstants.LASTNAME];
			MiddleName				= x.@[SchedulerXmlConstants.MIDDLENAME];
			QuivusID				= x.@[SchedulerXmlConstants.QUIVUSID];
			LastVisit				= x.@[SchedulerXmlConstants.LASTVISIT];
			
			TypeID					= x.Type.@[SchedulerXmlConstants.ID];
			TypeName				= x.Type.@[SchedulerXmlConstants.NAME];
			
			StatusID				= x.Action.@[SchedulerXmlConstants.ID];
			StatusName				= x.Action.@[SchedulerXmlConstants.NAME];
			NextAction				= x.Action.@[SchedulerXmlConstants.NEXTACTION];
			
			PatientID				= x.Patient.@[SchedulerXmlConstants.ID];
			PatientFirstName		= x.Patient.@[SchedulerXmlConstants.FIRSTNAME];
			PatientLastName			= x.Patient.@[SchedulerXmlConstants.LASTNAME];
			PatientMiddleName		= x.Patient.@[SchedulerXmlConstants.MIDDLENAME];
			
			ProviderName 	= StringUtil.trim(FirstName)+' '+StringUtil.trim(MiddleName)+' '+StringUtil.trim(LastName);
			PatientName 	= StringUtil.trim(PatientFirstName)+' '+StringUtil.trim(PatientMiddleName)+' '+StringUtil.trim(PatientLastName);
		}
		
//##################### GETTER & SETTER ########################################		
		public function get ID():String
		{
			return m_sID;
		}

		public function set ID(value:String):void
		{
			m_sID = value;
		}

		public function get StationID():String
		{
			return m_sStationID;
		}

		public function set StationID(value:String):void
		{
			m_sStationID = value;
		}

		public function get RequestID():String
		{
			return m_sRequestID;
		}

		public function set RequestID(value:String):void
		{
			m_sRequestID = value;
		}

		public function get UserID():String
		{
			return m_sUserID;
		}

		public function set UserID(value:String):void
		{
			m_sUserID = value;
		}

		public function get Date():String
		{
			return m_sDate;
		}

		public function set Date(value:String):void
		{
			m_sDate = value;
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

		public function get ClinicId():String
		{
			return m_sClinicId;
		}

		public function set ClinicId(value:String):void
		{
			m_sClinicId = value;
		}

		public function get ChiefComplaint():String
		{
			return m_sChiefComplaint;
		}

		public function set ChiefComplaint(value:String):void
		{
			m_sChiefComplaint = value;
		}

		public function get CreatedBy():String
		{
			return m_sCreatedBy;
		}

		public function set CreatedBy(value:String):void
		{
			m_sCreatedBy = value;
		}

		public function get CreatedAt():String
		{
			return m_sCreatedAt;
		}

		public function set CreatedAt(value:String):void
		{
			m_sCreatedAt = value;
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

		public function get FirstName():String
		{
			return m_sFirstName;
		}

		public function set FirstName(value:String):void
		{
			m_sFirstName = value;
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

		public function get StatusID():String
		{
			return m_sStatusID;
		}

		public function set StatusID(value:String):void
		{
			m_sStatusID = value;
		}

		public function get StatusName():String
		{
			return m_sStatusName;
		}

		public function set StatusName(value:String):void
		{
			m_sStatusName = value;
		}

		public function get NextAction():String
		{
			return m_sNextAction;
		}

		public function set NextAction(value:String):void
		{
			m_sNextAction = value;
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

		public function get StationName():String
		{
			return m_sStationName;
		}

		public function set StationName(value:String):void
		{
			m_sStationName = value;
		}

		public function get Alert():String
		{
			return m_sAlert;
		}

		public function set Alert(value:String):void
		{
			m_sAlert = value;
		}

		public function get MiddleName():String
		{
			return m_sMiddleName;
		}

		public function set MiddleName(value:String):void
		{
			m_sMiddleName = value;
		}

		public function get LastName():String
		{
			return m_sLastName;
		}

		public function set LastName(value:String):void
		{
			m_sLastName = value;
		}

		public function get PatientMiddleName():String
		{
			return m_sPatientMiddleName;
		}

		public function set PatientMiddleName(value:String):void
		{
			m_sPatientMiddleName = value;
		}

		public function get PatientLastName():String
		{
			return m_sPatientLastName;
		}

		public function set PatientLastName(value:String):void
		{
			m_sPatientLastName = value;
		}

		public function get LastVisit():String
		{
			return m_sLastVisit;
		}

		public function set LastVisit(value:String):void
		{
			m_sLastVisit = value;
		}

		public function get QuivusID():String
		{
			return m_sQuivusID;
		}

		public function set QuivusID(value:String):void
		{
			m_sQuivusID = value;
		}

		public function get PatientName():String
		{
			return m_sPatientName;
		}

		public function set PatientName(value:String):void
		{
			m_sPatientName = value;
		}

		public function get ProviderName():String
		{
			return m_sProviderName;
		}

		public function set ProviderName(value:String):void
		{
			m_sProviderName = value;
		}


	}
}