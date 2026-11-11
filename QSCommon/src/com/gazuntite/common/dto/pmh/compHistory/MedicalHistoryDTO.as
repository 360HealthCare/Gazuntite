package com.gazuntite.common.dto.pmh.compHistory
{
	import com.gazuntite.common.dto.assessment.diagnosis.ICDCodeDTO;
	import com.gazuntite.common.dto.baseDTO.BaseDTO;
	import com.gazuntite.common.dto.baseDTO.GeneralTypeDTO;
	import com.gazuntite.utils.UtilityFunctions;
	
	[Bindable]
	public class MedicalHistoryDTO extends BaseDTO
	{
		private var _OnSet:String = '';
		private var _NoOfRecords:int;
		private var _IsNA:Boolean;
		private var _IsNone:Boolean;
		private var _ID:int;
		private var _ICDDTO:ICDCodeDTO;
		private var _medicalhistorytype:GeneralTypeDTO;
		private var _isActive:Boolean;
		
		public function MedicalHistoryDTO()
		{
			ICDDTO = new ICDCodeDTO();
			medicalhistorytype = new GeneralTypeDTO();
		}
		
		public function get isActive():Boolean
		{
			return _isActive;
		}
		
		public function get label():String
		{
			var result:String = "";
			
			if (this == null)
			{
				result = "";
			}
			else if (this.IsNone)
			{
				result = this.medicalhistorytype.Name + "- None";
			}
			else 
			{					
				result =this.medicalhistorytype.Name + "- " + this.ICDDTO.IcdCodeDescription;
			}
			
			return result;
		}
		
		public function set isActive(value:Boolean):void
		{
			_isActive = value;
		}
		
		public function get ICDDTO():ICDCodeDTO
		{
			return _ICDDTO;
		}
		
		public function set ICDDTO(value:ICDCodeDTO):void
		{
			_ICDDTO = value;
		}
		
		public function get medicalhistorytype():GeneralTypeDTO
		{
			return _medicalhistorytype;
		}
		
		public function set medicalhistorytype(value:GeneralTypeDTO):void
		{
			_medicalhistorytype = value;
		}
		
		public function get ID():int
		{
			return _ID;
		}
		
		public function set ID(value:int):void
		{
			_ID = value;
		}
		
		public function get IsNone():Boolean
		{
			return _IsNone;
		}
		
		public function set IsNone(value:Boolean):void
		{
			_IsNone = value;
		}
		
		public function get IsNA():Boolean
		{
			return _IsNA;
		}
		
		public function set IsNA(value:Boolean):void
		{
			_IsNA = value;
		}
		
		
		public function get NoOfRecords():int
		{
			return _NoOfRecords;
		}
		
		public function set NoOfRecords(value:int):void
		{
			_NoOfRecords = value;
		}
		
		public function get OnSet():String
		{
			return _OnSet;
		}
		
		public function set OnSet(value:String):void
		{
			_OnSet = value;
		}
		
		public function get FilterFeild():String
		{
			return ICDDTO.IcdCodeDescription;
		}
		
		public override function ToXML():XML
		{
			this.nodeName = "MedicalHistoryDTO";
			var x:XML = super.ToXML();
			
			x.@OnSet			= this.OnSet;
			x.@NoOfRecords		= this.NoOfRecords ;
			x.@IsActive			= this.isActive ;
			x.@IsNA				= this.IsNA;
			x.@IsNone			= this.IsNone;
			x.@TypeID			= this.medicalhistorytype.ID;
			x.@ID				= this.ID;
			x.@Note				= this.Note;
			x.@DictationID				= this.DictationID;
			
			medicalhistorytype.NodeName = "Medicalhistorytype";
			
			x.appendChild (medicalhistorytype.ToXML());
			
			ICDDTO.nodename = "ICDCodeList";
			x.appendChild( ICDDTO.ToXML() );
			x.ICDCodeList.@IsActive = this.isActive;
			x.ICDCodeList.@Onset = this.OnSet;
			
			return x;
		}
		
		public override  function FromXML(x:XML):void
		{
			this.ID = x.@ID;
			var del:String = x.@IsDeleted;
			
			this.IsDeleted  = del == "true";
			
			var visitDate:String = x.@VisitDate;
			
			this.VisitDate = new Date(visitDate);
			
			var CreatedAt:String = x.@CreatedAt;
			
			this.CreatedAt = new Date(CreatedAt);
			this.IsNone= UtilityFunctions.StringToBoolean(x.@IsNone);
			this.IsNA= UtilityFunctions.StringToBoolean(x.@IsNA);
			this.PatientID= x.@PatientID;
			this.NoOfRecords= x.@NoOfRecords;
			this.OnSet=  x.@OnSet;
			this.VisitID=  x.@VisitID;
			this.isActive = UtilityFunctions.StringToBoolean(x.@IsActive);
			
			this.Note = x.@Note;
			this.DictationID = x.@DictationID;
			
			medicalhistorytype = new GeneralTypeDTO();
			medicalhistorytype.FromXML(x.MedicalHistoryType[0]);
			
			ICDDTO = new ICDCodeDTO();
			ICDDTO.FromXML(x.ICDCodeList[0]);			
		}
	}
}