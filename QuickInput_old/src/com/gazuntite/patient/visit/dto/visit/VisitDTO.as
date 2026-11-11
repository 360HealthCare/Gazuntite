package com.gazuntite.patient.visit.dto.visit
{
	import com.gazuntite.patient.visit.dto.common.BaseDTO;
	import com.gazuntite.patient.visit.utils.QIConstants;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.controls.custom.calendar.views.NullCalendarDescriptor;
	import com.gazuntite.utils.UtilityFunctions;
	
	[Bindable]
	public class VisitDTO extends BaseDTO
	{
		
		private var _IsValidDataExists:Boolean;
		private var _IsVirtualVisit:Boolean;
		private var _VisitId:int;
		private var _UserID:int;
		private var _OwnerId:int;
		private var _SignedByUserId:int;
		private var _AppointmentId:int;
		private var _EncounterTypeId:int;
		private var _PlaceOfServiceTypeID:int;
		private var _TemplateId:int;
		private var _TemplateVisitId:int;
		private var _CreatedStationID:int;
		private var _VisitStatus:String;
		private var _RecGuid:String;

		private var _SignedDate:Date;
		private var _CoSignedDate:Date;
		
		private var _OwnerUserType:OwnerUserTypeDTO;
		private var _ClinicBranch:ClinicBranchDTO;
		private var _UserType:UserTypeDTO;
		
		public function VisitDTO(patientID:int, userID:int, userTypeId:int, encounterTypeId:int, templateId:int, createdStationID:int, placeOfServiceTypeID:int, createdBy:int, createdAt:Date, modifiedAt:Date , clinicBranchID:int)
		{
			super();
			
			this.PatientID 	= patientID;
			this.UserID 	= userID;
			this.OwnerId	= userID;
			VisitDate 		= createdAt;
			VisitStatus		= QIConstants.VISIT_STATUS_UN_SIGNED;
			
			IsVirtualVisit 	= false;
			AppointmentId 	= 0;
			SignedByUserId  = 0;
			TemplateVisitId = 0;
			IsRecordEditable= false;
			
			DictationID		= QIConstants.GUID_FORMAT;
			RecGuid			= QIConstants.GUID_FORMAT;
			
			this.EncounterTypeId 		= encounterTypeId;
			this.TemplateId 			= templateId;
			this.CreatedStationID		= createdStationID;
			this.PlaceOfServiceTypeID 	= placeOfServiceTypeID;
			
			this.CreatedBy		 = createdBy;
			this.ModifiedBy		 = createdBy;
			this.CreatedAt		 = createdAt;
			this.ModifiedAt		 = modifiedAt;
			
			this.SignedDate		= QIConstants.NULL_DATE;
			this.CoSignedDate 	= QIConstants.NULL_DATE;
			
			this.OwnerUserType 	= new OwnerUserTypeDTO();
			
			
			this.ClinicBranch  	= new ClinicBranchDTO();
			this.ClinicBranch.ID = clinicBranchID;
			
			this.UserType		= new UserTypeDTO();
			this.UserType.ID		= userTypeId;
			this.OwnerUserType.UserTypeId = userTypeId;
			
		}
		
		
		public function get CoSignedDate():Date
		{
			return _CoSignedDate;
		}

		public function set CoSignedDate(value:Date):void
		{
			_CoSignedDate = value;
		}

		public function get SignedDate():Date
		{
			return _SignedDate;
		}

		public function set SignedDate(value:Date):void
		{
			_SignedDate = value;
		}

		public function get UserType():UserTypeDTO
		{
			return _UserType;
		}

		public function set UserType(value:UserTypeDTO):void
		{
			_UserType = value;
		}

		public function get ClinicBranch():ClinicBranchDTO
		{
			return _ClinicBranch;
		}

		public function set ClinicBranch(value:ClinicBranchDTO):void
		{
			_ClinicBranch = value;
		}

		public function get OwnerUserType():OwnerUserTypeDTO
		{
			return _OwnerUserType;
		}

		public function set OwnerUserType(value:OwnerUserTypeDTO):void
		{
			_OwnerUserType = value;
		}

		public function get RecGuid():String
		{
			return _RecGuid;
		}

		public function set RecGuid(value:String):void
		{
			_RecGuid = value;
		}

		public function get VisitStatus():String
		{
			return _VisitStatus;
		}

		public function set VisitStatus(value:String):void
		{
			_VisitStatus = value;
		}

		public function get CreatedStationID():int
		{
			return _CreatedStationID;
		}

		public function set CreatedStationID(value:int):void
		{
			_CreatedStationID = value;
		}

		public function get TemplateVisitId():int
		{
			return _TemplateVisitId;
		}

		public function set TemplateVisitId(value:int):void
		{
			_TemplateVisitId = value;
		}

		public function get TemplateId():int
		{
			return _TemplateId;
		}

		public function set TemplateId(value:int):void
		{
			_TemplateId = value;
		}

		public function get PlaceOfServiceTypeID():int
		{
			return _PlaceOfServiceTypeID;
		}

		public function set PlaceOfServiceTypeID(value:int):void
		{
			_PlaceOfServiceTypeID = value;
		}

		public function get EncounterTypeId():int
		{
			return _EncounterTypeId;
		}

		public function set EncounterTypeId(value:int):void
		{
			_EncounterTypeId = value;
		}

		public function get AppointmentId():int
		{
			return _AppointmentId;
		}

		public function set AppointmentId(value:int):void
		{
			_AppointmentId = value;
		}

		public function get SignedByUserId():int
		{
			return _SignedByUserId;
		}

		public function set SignedByUserId(value:int):void
		{
			_SignedByUserId = value;
		}

		public function get OwnerId():int
		{
			return _OwnerId;
		}

		public function set OwnerId(value:int):void
		{
			_OwnerId = value;
		}

		public function get UserID():int
		{
			return _UserID;
		}

		public function set UserID(value:int):void
		{
			_UserID = value;
		}

		public function get VisitId():int
		{
			return _VisitId;
		}

		public function set VisitId(value:int):void
		{
			_VisitId = value;
		}

		public function get IsVirtualVisit():Boolean
		{
			return _IsVirtualVisit;
		}

		public function set IsVirtualVisit(value:Boolean):void
		{
			_IsVirtualVisit = value;
		}

		public function get IsValidDataExists():Boolean
		{
			return _IsValidDataExists;
		}

		public function set IsValidDataExists(value:Boolean):void
		{
			_IsValidDataExists = value;
		}
		
		
		public override function ToXML():XML
		{
			var x:XML = XmlUtils.getNodeByTagName("VisitDTO");
			
			x.@["IsDeleted"] 			= IsDeleted;
			x.@["IsValidDataExists"] 	= IsValidDataExists;
			x.@["VisitId"] 				= VisitId;			
			x.@["PatientId"] 			= PatientID;	
			x.@["OwnerId"] 				= UserID;	
			x.@["VisitDate"] 			= UtilityFunctions.FormatDate(VisitDate, "MM-DD-YYYY");	
			x.@["UserId"] 				= UserID;	
			x.@["VisitStatus"] 			= VisitStatus;	
			
			x.@["RecGuid"] 				= RecGuid;	
			x.@["DictationID"] 			= DictationID;	
			x.@["IsVirtualVisit"] 		= IsVirtualVisit;	
			x.@["AppointmentId"] 		= AppointmentId;	
			
			x.@["TemplateId"] 			= TemplateId;	
			x.@["SignedByUserId"] 		= SignedByUserId;	
			x.@["CreatedBy"] 			= CreatedBy;	
			x.@["CreatedAt"] 			= UtilityFunctions.FormatDate(CreatedAt, "MM-DD-YYYY");	
			x.@["ModifiedBy"] 			= ModifiedBy;	
			x.@["ModifiedAt"] 			= UtilityFunctions.FormatDate(ModifiedAt, "MM-DD-YYYY");	

			x.@["SignedDate"] 			= UtilityFunctions.FormatDate(SignedDate, "MM-DD-YYYY");	
			x.@["CoSignedDate"] 		= UtilityFunctions.FormatDate(CoSignedDate, "MM-DD-YYYY");	
			
			x.@["TemplateVisitId"] 			= TemplateVisitId;	
			x.@["IsRecordEditable"] 		= IsRecordEditable;	
			x.@["CreatedStationID"] 		= CreatedStationID;	
			x.@["PlaceOfServiceTypeID"] 	= PlaceOfServiceTypeID;	
			
			x.appendChild( OwnerUserType.ToXML() );
			x.appendChild( ClinicBranch.ToXML() );
			x.appendChild( UserType.ToXML() );
			
			
			
			return x;
		}
		
		public override function FromXML(x:XML):void
		{
			IsDeleted 		= x.@["IsDeleted"];
			IsDirty			= x.@["IsDirty"];
			VisitId			= x.@["VisitId"];			
			PatientID		= x.@["PatientId"];	
			OwnerId			= x.@["OwnerId"];	
			VisitDate		= x.@["VisitDate"];	
			UserID			= x.@["UserId"];	
			VisitStatus		= x.@["VisitStatus"];			
			RecGuid			= x.@["RecGuid"];			
			DictationID		= x.@["DictationID"];			
			IsVirtualVisit	= x.@["IsVirtualVisit"];			
			AppointmentId	= x.@["AppointmentId"];			
			EncounterTypeId	= x.@["EncounterTypeId"];	
			
			TemplateId					= x.@["TemplateId"];	
			SignedByUserId				= x.@["SignedByUserId"];	
			CreatedBy					= x.@["CreatedBy"];	
			CreatedAt					= x.@["CreatedAt"];	
			ModifiedBy					= x.@["ModifiedBy"];	
			ModifiedAt					= x.@["ModifiedAt"];	
			TemplateVisitId				= x.@["TemplateVisitId"];	
			IsRecordEditable			= x.@["IsRecordEditable"];	
			CreatedStationID			= x.@["CreatedStationID"];	
			PlaceOfServiceTypeID		= x.@["PlaceOfServiceTypeID"];	
			
			OwnerUserType = new OwnerUserTypeDTO();
			ClinicBranch  = new ClinicBranchDTO();
			UserType 	  = new UserTypeDTO();
			
			OwnerUserType.FromXML( x.OwnerUserType[0] );
			ClinicBranch.FromXML ( x.ClinicBranch[0]  );
			UserType.FromXML	 ( x.UserType[0] 	  );
					
		}

	}
}