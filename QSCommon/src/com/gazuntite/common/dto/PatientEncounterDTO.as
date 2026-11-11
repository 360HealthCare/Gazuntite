package com.gazuntite.common.dto
{
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.viewModel.PatientDictationNoteViewModel;

	[Bindable]
	public class PatientEncounterDTO
	{
		private var _FirstName:String;
		private var _LastName:String;
		private var _Gender:String;
		private var _IsDeleted:String;
		private var _IsDirty:String;
		private var _Notes:String;
		private var _VisitId:String;
		private var _VisitDate:String;
		private var _VisitEncounterTypeName:String;
		private var _VisitProvider:String;
		private var _VisitStatus:String;
		private var _VisitNotes :String;
		private var _StationID:String;
		private var _StationName:String;
		private var _OwnerUserId:String;
		private var _OwnerUserTypeId:String;
		private var _DictationID:String;
		private var _CanSignCosign:String;
		private var _PlaceOfServiceTypeID:String;
		private var _PlaceOfServiceTypeName:String;
		private var _ClinicBranchID:int;
		private var _UserID:int;
		private var _PatientID:int;

		public var serialNumber:int;
		public var dictationNoteViewModel:PatientDictationNoteViewModel;
		
		public function FromXML( x:XML ):void
		{
			FirstName					= x.@['FirstName'];
			LastName					= x.@['LastName'];
			Gender						= x.@['Gender'];
			IsDeleted 					= x.@['IsDeleted'];			
			IsDirty 					= x.@['IsDirty'];			
			Notes 						= x.@['Notes'];			
			VisitId 					= x.@['VisitId'];			
			VisitDate 					= x.@['VisitDate'];			
			VisitEncounterTypeName 		= x.@['VisitEncounterTypeName'];			
			VisitProvider 				= x.@['VisitProvider'];			
			VisitStatus 				= x.@['VisitStatus'];			
			VisitNotes 					= x.@['VisitNotes'];			
			StationID 					= x.@['StationID'];			
			StationName 				= x.@['StationName'];			
			OwnerUserId 				= x.@['OwnerUserId'];			
			OwnerUserTypeId 			= x.@['OwnerUserTypeId'];			
			DictationID 				= x.@['DictationID'];			
			CanSignCosign 				= x.@['CanSignCosign'];			
			PlaceOfServiceTypeID 		= x.@['PlaceOfServiceTypeID'];			
			PlaceOfServiceTypeName 		= x.@['PlaceOfServiceTypeName'];			
			ClinicBranchID 				= x.@['ClinicBranchID'];			
			UserID 						= x.@['UserID'];			
			PatientID 					= x.@['PatientID'];
		}
		
		public function ToXML():XML
		{
			var xml:XML = XmlUtils.getNodeByTagName( 'PatientEncounter' );
			
			xml.@['FirstName']				= FirstName;
			xml.@['LastName']				= LastName;
			xml.@['Gender']					= Gender;
			xml.@['IsDeleted']				= IsDeleted;
			xml.@['IsDirty']				= IsDirty;
			xml.@['Notes']					= Notes;
			xml.@['VisitId']				= VisitId;
			xml.@['VisitDate']				= VisitDate;
			xml.@['VisitEncounterTypeName']	= VisitEncounterTypeName;
			xml.@['VisitProvider']			= VisitProvider;
			xml.@['VisitStatus']			= VisitStatus; 
			xml.@['VisitNotes']				= VisitNotes; 
			xml.@['StationID']				= StationID;
			xml.@['StationName']			= StationName;
			xml.@['OwnerUserId']			= OwnerUserId;
			xml.@['OwnerUserTypeId']		= OwnerUserTypeId;
			xml.@['DictationID']			= DictationID;
			xml.@['CanSignCosign']			= CanSignCosign;
			xml.@['PlaceOfServiceTypeID']	= PlaceOfServiceTypeID;
			xml.@['PlaceOfServiceTypeName']	= PlaceOfServiceTypeName;
			xml.@['ClinicBranchID']			= ClinicBranchID;
			xml.@['UserID']					= UserID;
			xml.@['PatientID']				= PatientID;
			
			return xml;
		}
		
		public function get IsDeleted():String
		{
			return _IsDeleted;
		}

		public function set IsDeleted(value:String):void
		{
			_IsDeleted = value;
		}

		public function get IsDirty():String
		{
			return _IsDirty;
		}

		public function set IsDirty(value:String):void
		{
			_IsDirty = value;
		}

		public function get VisitId():String
		{
			return _VisitId;
		}

		public function set VisitId(value:String):void
		{
			_VisitId = value;
		}

		public function get VisitDate():String
		{
			return _VisitDate;
		}

		public function set VisitDate(value:String):void
		{
			_VisitDate = value;
		}

		public function get VisitEncounterTypeName():String
		{
			return _VisitEncounterTypeName;
		}

		public function set VisitEncounterTypeName(value:String):void
		{
			_VisitEncounterTypeName = value;
		}

		public function get VisitProvider():String
		{
			return _VisitProvider;
		}

		public function set VisitProvider(value:String):void
		{
			_VisitProvider = value;
		}

		public function get VisitStatus():String
		{
			return _VisitStatus;
		}

		public function set VisitStatus(value:String):void
		{
			_VisitStatus = value;
		}

		public function get StationID():String
		{
			return _StationID;
		}

		public function set StationID(value:String):void
		{
			_StationID = value;
		}

		public function get OwnerUserId():String
		{
			return _OwnerUserId;
		}

		public function set OwnerUserId(value:String):void
		{
			_OwnerUserId = value;
		}

		public function get OwnerUserTypeId():String
		{
			return _OwnerUserTypeId;
		}

		public function set OwnerUserTypeId(value:String):void
		{
			_OwnerUserTypeId = value;
		}

		public function get DictationID():String
		{
			return _DictationID;
		}

		public function set DictationID(value:String):void
		{
			_DictationID = value;
		}

		public function get CanSignCosign():String
		{
			return _CanSignCosign;
		}

		public function set CanSignCosign(value:String):void
		{
			_CanSignCosign = value;
		}

		public function get PlaceOfServiceTypeID():String
		{
			return _PlaceOfServiceTypeID;
		}

		public function set PlaceOfServiceTypeID(value:String):void
		{
			_PlaceOfServiceTypeID = value;
		}

		public function get PlaceOfServiceTypeName():String
		{
			return _PlaceOfServiceTypeName;
		}

		public function set PlaceOfServiceTypeName(value:String):void
		{
			_PlaceOfServiceTypeName = value;
		}

		public function get StationName():String
		{
			return _StationName;
		}

		public function set StationName(value:String):void
		{
			_StationName = value;
		}

		public function get Notes():String
		{
			return _Notes;
		}

		public function set Notes(value:String):void
		{
			_Notes = value;
		}

		public function get VisitNotes():String
		{
			return _VisitNotes;
		}

		public function set VisitNotes(value:String):void
		{
			_VisitNotes = value;
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

		public function get Gender():String
		{
			return _Gender;
		}

		public function set Gender(value:String):void
		{
			_Gender = value;
		}

		public function get ClinicBranchID():int
		{
			return _ClinicBranchID;
		}

		public function set ClinicBranchID(value:int):void
		{
			_ClinicBranchID = value;
		}

		public function get UserID():int
		{
			return _UserID;
		}

		public function set UserID(value:int):void
		{
			_UserID = value;
		}

		public function get PatientID():int
		{
			return _PatientID;
		}

		public function set PatientID(value:int):void
		{
			_PatientID = value;
		}


	}
}