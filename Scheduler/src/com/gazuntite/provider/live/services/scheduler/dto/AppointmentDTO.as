package com.gazuntite.provider.live.services.scheduler.dto
{
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerXmlConstants;
	import com.gazuntite.provider.live.services.scheduler.util.SchedulerXmlUtils;
	
	import mx.utils.StringUtil;

	[Bindable]
	public class AppointmentDTO
	{
		private var m_sID:String;
		private var m_sStationID:String;
		private var m_sStationName:String;
		private var m_sRequestID:String;
		private var m_sUserID:String;
		private var m_sDate:String;
		private var m_sStartTime:String;
		private var m_sEndTime:String;
		private var m_sClinicID:String;
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

		private var m_sProviderName:String; 	// Custom name for Show in grid
		
		private var m_oType:TypeDTO;
		private var m_oAction:ActionDTO;
		private var m_oPatient:PatientDTO;
		private var m_oRoom:RoomDTO;
		
		public function AppointmentDTO()//constructor method
		{
			Type 		= new TypeDTO();
			Action 		= new ActionDTO();
			Patient 	= new PatientDTO();
			Room		= new RoomDTO();	
		}
		public function FromXML(x:XML, p:XML):void
		{
			ID						   		= x.@[SchedulerXmlConstants.ID];
			StationID					  	= x.@[SchedulerXmlConstants.STATIONID];
			StationName				   		= x.@[SchedulerXmlConstants.STATIONNAME];
			RequestID					   	= x.@[SchedulerXmlConstants.REQUESTID];
			UserID			   				= x.@[SchedulerXmlConstants.USERID];
			Date					       	= x.@[SchedulerXmlConstants.DATE];
			StartTime                    	= x.@[SchedulerXmlConstants.STARTTIME];
			EndTime                      	= x.@[SchedulerXmlConstants.ENDTIME];
			ClinicID                 		= x.@[SchedulerXmlConstants.CLIENID];
			ChiefComplaint               	= x.@[SchedulerXmlConstants.CHIEFCOMPLAINT];
			CreatedBy                    	= x.@[SchedulerXmlConstants.CREATEDBY];
			CreatedAt                    	= x.@[SchedulerXmlConstants.CREATEDAT];
			ModifiedBy                     	= x.@[SchedulerXmlConstants.MODIFIEDBY];
			ModifiedAt                     	= x.@[SchedulerXmlConstants.MODIFIEDAT];
			IsDeleted                    	= x.@[SchedulerXmlConstants.ISDELETED];
			Alert                    	   	= x.@[SchedulerXmlConstants.ALERT];
			FirstName            			= p.@[SchedulerXmlConstants.FIRSTNAME];
			LastName            			= p.@[SchedulerXmlConstants.LASTNAME];
			MiddleName           			= p.@[SchedulerXmlConstants.MIDDLENAME];
			QuivusID            			= x.@[SchedulerXmlConstants.QUIVUSID];
			LastVisit            			= x.@[SchedulerXmlConstants.LASTVISIT];
			
			Type.FromXML(x.Type[0]);
			Action.FromXML(x.Action[0]);
			Patient.FromXML(x.Patient[0]);
			if(x.Room[0] != null)
				Room.FromXML(x.Room[0]);
	
			ProviderName  					= StringUtil.trim(FirstName) +' '+ StringUtil.trim(MiddleName)+' '+StringUtil.trim(LastName);
		}
		// Making XML again for sending back to server		
		public function ToXML(data:Object):XML
		{
			var xml:XML = SchedulerXmlUtils.getNodeByTagName( "Appointment" );
			xml.@[SchedulerXmlConstants.ID]							= data.ID; 					
			xml.@[SchedulerXmlConstants.STATIONID]					= data.StationID; 					
			xml.@[SchedulerXmlConstants.STATIONNAME]				= data.StationName;					
			xml.@[SchedulerXmlConstants.REQUESTID]					= data.RequestID;	//need mansoor help										
			xml.@[SchedulerXmlConstants.USERID]						= data.UserID;				
			xml.@[SchedulerXmlConstants.DATE]						= data.Date;
			xml.@[SchedulerXmlConstants.STARTTIME]					= data.StartTime;
			xml.@[SchedulerXmlConstants.ENDTIME]					= data.EndTime;
			xml.@[SchedulerXmlConstants.CLIENID]					= data.ClinicID;
			xml.@[SchedulerXmlConstants.CHIEFCOMPLAINT]				= data.ChiefComplaint;
			xml.@[SchedulerXmlConstants.CREATEDBY]					= data.CreatedBy;						
			xml.@[SchedulerXmlConstants.CREATEDAT]					= data.CreatedAt;
			xml.@[SchedulerXmlConstants.MODIFIEDBY]					= data.ModifiedBy;
			xml.@[SchedulerXmlConstants.MODIFIEDAT]					= data.ModifiedAt;
			xml.@[SchedulerXmlConstants.ISDELETED]					= data.IsDeleted;
			xml.@[SchedulerXmlConstants.ALERT]						= data.Alert;
			xml.@[SchedulerXmlConstants.FIRSTNAME]					= data.FirstName;
			xml.@[SchedulerXmlConstants.LASTNAME]					= data.LastName;
			xml.@[SchedulerXmlConstants.MIDDLENAME]					= data.MiddleName;
			xml.@[SchedulerXmlConstants.QUIVUSID]					= data.QuivusID;
			xml.@[SchedulerXmlConstants.LASTVISIT]					= data.LastVisit;
			
			xml.appendChild(Type.ToXML(data));
			xml.appendChild(Action.ToXML(data));
			xml.appendChild(Patient.ToXML(data));
			
			if(data.Room.ID == '')data.Room.ID = 0;
			if(data.Room.Station == '')data.Room.Station = 0;
			
			xml.appendChild(Room.ToXML(data));
			
			return xml;
		}
		
//############################## GETTER & SETTER ###############################################
		
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

		public function get StationName():String
		{
			return m_sStationName;
		}

		public function set StationName(value:String):void
		{
			m_sStationName = value;
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

		public function get ClinicID():String
		{
			return m_sClinicID;
		}

		public function set ClinicID(value:String):void
		{
			m_sClinicID = value;
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

		public function get Alert():String
		{
			return m_sAlert;
		}

		public function set Alert(value:String):void
		{
			m_sAlert = value;
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

		public function get LastVisit():String
		{
			return m_sLastVisit;
		}

		public function set LastVisit(value:String):void
		{
			m_sLastVisit = value;
		}

		public function get ProviderName():String
		{
			return m_sProviderName;
		}

		public function set ProviderName(value:String):void
		{
			m_sProviderName = value;
		}

		public function get Type():TypeDTO
		{
			return m_oType;
		}

		public function set Type(value:TypeDTO):void
		{
			m_oType = value;
		}

		public function get Action():ActionDTO
		{
			return m_oAction;
		}

		public function set Action(value:ActionDTO):void
		{
			m_oAction = value;
		}

		public function get Patient():PatientDTO
		{
			return m_oPatient;
		}

		public function set Patient(value:PatientDTO):void
		{
			m_oPatient = value;
		}

		public function get Room():RoomDTO
		{
			return m_oRoom;
		}

		public function set Room(value:RoomDTO):void
		{
			m_oRoom = value;
		}


	}
}