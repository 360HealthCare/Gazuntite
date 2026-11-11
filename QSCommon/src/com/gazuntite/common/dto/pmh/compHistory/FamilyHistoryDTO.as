package com.gazuntite.common.dto.pmh.compHistory
{
	import com.gazuntite.common.dto.assessment.diagnosis.ICDCodeDTO;
	import com.gazuntite.common.dto.baseDTO.BaseDTO;
	import com.gazuntite.common.dto.baseDTO.GeneralTypeDTO;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.utils.UtilityFunctions;
	
	[Bindable]
	public class FamilyHistoryDTO extends BaseDTO
	{
		
		private var _IsSystemSpecified:Boolean;
		private var _DiseaseID:int;
		private var _ID:int;
		private var _FamilyHistoryType:GeneralTypeDTO;
		private var _ReletionshipType:RelationshipTypeDTO;
		private var _DiseaseType:DiseaseTypeDTO;
		private var _IsPresent:Boolean;
		private var _IsYesSelected:String = '';
		private var _IsNA:Boolean;
		private var _IsActive:Boolean;
		private var _NoOfRecords:int;
		private var _IcdCodeDescription:String = '';
		private var _IcdCodeName:String = '';
		private var _FamilyHistoryNote:String = '';
		private var _DiagnosisId:int;
		
		//[05/28/2013] by Shahid Munir... to set S.No
		private var _SNo:String;
		
		public function FamilyHistoryDTO()
		{
			FamilyHistoryType = new GeneralTypeDTO;
			ReletionshipType = new RelationshipTypeDTO;
			DiseaseType = new DiseaseTypeDTO;
		}
		
		public function get SNo():String
		{
			return _SNo;
		}
		
		public function get label():String
		{
			var result:String = "";
			if (this == null)
			{
				result = "";
			}
			else if(!this.IsPresent)
			{
				result = (this.FamilyHistoryType.Name == "HeartDisease"? "Heart Disease":this.FamilyHistoryType.Name) + "- None";
			}
			else 
			{
				result = (this.FamilyHistoryType.Name == "HeartDisease"? "Heart Disease":this.FamilyHistoryType.Name) + "- " + this.DiseaseType.Description;
			}
			
			return result;
		}

		public function set SNo(value:String):void
		{
			_SNo = value;
		}

		public function get DiagnosisId():int
		{
			return _DiagnosisId;
		}
		
		public function set DiagnosisId(value:int):void
		{
			_DiagnosisId = value;
		}
		
		public function get FamilyHistoryNote():String
		{
			return _FamilyHistoryNote;
		}
		
		public function set FamilyHistoryNote(value:String):void
		{
			_FamilyHistoryNote = value;
		}
		
		public function get IcdCodeName():String
		{
			return _IcdCodeName;
		}
		
		public function set IcdCodeName(value:String):void
		{
			_IcdCodeName = value;
		}
		
		public function get IcdCodeDescription():String
		{
			return _IcdCodeDescription;
		}
		
		public function set IcdCodeDescription(value:String):void
		{
			_IcdCodeDescription = value;
		}
		
		public function get DiseaseType():DiseaseTypeDTO
		{
			return _DiseaseType;
		}
		
		public function set DiseaseType(value:DiseaseTypeDTO):void
		{
			_DiseaseType = value;
		}
		
		public function get NoOfRecords():int
		{
			return _NoOfRecords;
		}
		
		public function set NoOfRecords(value:int):void
		{
			_NoOfRecords = value;
		}
		
		public function get IsActive():Boolean
		{
			return _IsActive;
		}
		
		public function set IsActive(value:Boolean):void
		{
			_IsActive = value;
		}
		
		public function get IsNA():Boolean
		{
			return _IsNA;
		}
		
		public function set IsNA(value:Boolean):void
		{
			_IsNA = value;
		}
		
		public function get IsYesSelected():String
		{
			return _IsYesSelected;
		}
		
		public function set IsYesSelected(value:String):void
		{
			_IsYesSelected = value;
		}
		
		public function get ReletionshipType():RelationshipTypeDTO
		{
			return _ReletionshipType;
		}
		
		public function set ReletionshipType(value:RelationshipTypeDTO):void
		{
			_ReletionshipType = value;
		}
		
		public function get IsPresent():Boolean
		{
			return _IsPresent;
		}
		
		public function set IsPresent(value:Boolean):void
		{
			_IsPresent = value;
		}
		
		public function get FamilyHistoryType():GeneralTypeDTO
		{
			return _FamilyHistoryType;
		}
		
		public function set FamilyHistoryType(value:GeneralTypeDTO):void
		{
			_FamilyHistoryType = value;
		}
		
		public function get ID():int
		{
			return _ID;
		}
		
		public function set ID(value:int):void
		{
			_ID = value;
		}
		
		public function get DiseaseID():int
		{
			return _DiseaseID;
		}
		
		public function set DiseaseID(value:int):void
		{
			_DiseaseID = value;
		}
		
		public function get IsSystemSpecified():Boolean
		{
			return _IsSystemSpecified;
		}

		public function get FilterFeild():String
		{
			return DiseaseType.Description;
		}
		
		public function set IsSystemSpecified(value:Boolean):void
		{
			_IsSystemSpecified = value;
		}
		
		
		
		public override function ToXML():XML
		{
			this.nodeName = "FamilyHistoryDTO";
			var x:XML = super.ToXML();
			
			x.@NoOfRecords				= NoOfRecords;
			x.@IsActive					= IsActive;
			x.@IcdCodeDescription 		= IcdCodeDescription;
			x.@IcdCodeName 				= IcdCodeName;
			x.@IsNA 					= IsNA;
			x.@ID 						= ID;
			x.@IsYesSelected 			= IsYesSelected
			x.@IsPresent 				= IsPresent
			x.@FamilyHistoryNote 		= FamilyHistoryNote
			x.@FamilyHistoryTypeID 		= FamilyHistoryType.ID;
			x.@FamilyHistoryTypeName	= FamilyHistoryType.Name;
			x.@ReletionshipTypeID 		= ReletionshipType.ID;
			x.@ReletionshipTypeName 	= ReletionshipType.Name;
			x.@IsSystemSpecified 		= IsSystemSpecified;
			x.@DiseaseID 				= DiseaseID;
			x.@IsSystemSpecified 		= IsSystemSpecified;
			x.@DiseaseName 				= DiseaseType.Description;
			x.@DiseaseCode 				= DiseaseType.DiseaseTypeCode;
			x.@DictationID 				= DictationID;
			
			var d:XML = XmlUtils.getNodeByTagName("DiseaseList");
			
			d.@DictationID				=DictationID;
			d.@ID						=DiseaseType.DiseaseTypeID;
			d.@IcdCodeName				=IcdCodeName;
			d.@IcdCodeDescription		=IcdCodeDescription;
			d.@ReletionshipTypeID		=ReletionshipType.ID;
			d.@DiagnosisId				=DiagnosisId;
			d.@ReletionshipTypeName		=ReletionshipType.Name;
			d.@Notes					=FamilyHistoryNote;
			
			x.appendChild(d);
			
			return x;
			
		}
		public override function FromXML(x:XML):void
		{
			this.IsNA						= UtilityFunctions.StringToBoolean(x.@IsNA);
			this.IsSystemSpecified			= x.@IsSystemSpecified;
			this.DiseaseID 					= x.@DiseaseID;
			this.ID 						= x.@ID;
			this.IsPresent 					= UtilityFunctions.StringToBoolean(x.@IsPresent);
			this.IsYesSelected 				= x.@IsYesSelected;
			this.IsActive 					= x.@IsActive;
			this.NoOfRecords 				= x.@NoOfRecords;
			this.DictationID				= x.@DictationID;
			
			IcdCodeDescription				= x.@IcdCodeDescription;
			IcdCodeName						= x.@IcdCodeName;
			
			this.FamilyHistoryType = new GeneralTypeDTO();
			this.FamilyHistoryType.ID       = x.@FamilyHistoryTypeID;   
			this.FamilyHistoryType.Name     = x.@FamilyHistoryTypeName;  
			this.FamilyHistoryNote			= x.@FamilyHistoryNote;
			
			this.ReletionshipType = new RelationshipTypeDTO();
			this.ReletionshipType.ID       = x.@ReletionshipTypeID;   
			this.ReletionshipType.Name     = x.@ReletionshipTypeName;   
			
			
/*			this.DiseaseType = new GeneralTypeDTO();
			DiseaseType.ID = x.@DiseaseCode;
			DiseaseType.Name = x.@DiseaseName;*/ //[11/19/2013] sm
			
			this.DiseaseType = new DiseaseTypeDTO();
			DiseaseType.DiseaseTypeCode = x.@DiseaseCode;
			DiseaseType.Description = x.@DiseaseName;
			
			super.FromXML(x);
		}
	}
}