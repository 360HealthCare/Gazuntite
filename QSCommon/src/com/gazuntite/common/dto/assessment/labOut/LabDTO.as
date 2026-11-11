package com.gazuntite.common.dto.assessment.labOut
{
	import com.gazuntite.common.dto.baseDTO.BaseDTO;
	import com.gazuntite.common.dto.baseDTO.GeneralTypeDTO;
	import com.gazuntite.utils.UtilityFunctions;
	
	
	[Bindable]
	public class LabDTO extends BaseDTO 
	{
		private var _LabTestType:LabOutTestTypeDTO;
		private var _LabTestOrderMethodType:GeneralTypeDTO;
		private var _LIONICLabTestType:LabOutLIONICLabTestDTO;
		private var _LabTestPriorityType:GeneralTypeDTO;
		private var _LabTestSpecimenType:GeneralTypeDTO;
		private var _LabType:GeneralTypeDTO;	
		
		private var _IsLabIn:Boolean;
		private var _Description:String;
		private var _PatientDiagnosisID:int;
		private var _DiagnosisInfo:String;
		private var _CollectionDate:String = '';
		
		private var _PatientLabID:int;
		private var _UserID:int;
		private var _LabID:int;
		private var _SignedByUserID:int;
		private var _ClinicBranchID:int;
		private var _StationID:int;
		
		private var _IsFasting:String;
		private var _OrderDate:String;
		private var _Onset:String;
		private var _testName:String;
		
		public function LabDTO()
		{
			LabTestType	= new LabOutTestTypeDTO();
			LabTestOrderMethodType = new GeneralTypeDTO();
			LIONICLabTestType = new LabOutLIONICLabTestDTO();
			LabTestPriorityType = new GeneralTypeDTO();
			LabTestSpecimenType = new GeneralTypeDTO();
			LabType = new GeneralTypeDTO();	
		}
		
		public function get StationID():int
		{
			return _StationID;
		}
		
		public function get label():String
		{
			return this.LIONICLabTestType.Name;
		}
		
		public function set StationID(value:int):void
		{
			_StationID = value;
		}
		
		public function get ClinicBranchID():int
		{
			return _ClinicBranchID;
		}
		
		public function set ClinicBranchID(value:int):void
		{
			_ClinicBranchID = value;
		}
		
		public function get SignedByUserID():int
		{
			return _SignedByUserID;
		}
		
		public function set SignedByUserID(value:int):void
		{
			_SignedByUserID = value;
		}
		
		public function get LabID():int
		{
			return _LabID;
		}
		
		public function set LabID(value:int):void
		{
			_LabID = value;
		}
		
		public function get UserID():int
		{
			return _UserID;
		}
		
		public function set UserID(value:int):void
		{
			_UserID = value;
		}
		
		public function get PatientLabID():int
		{
			return _PatientLabID;
		}
		
		public function set PatientLabID(value:int):void
		{
			_PatientLabID = value;
		}
		
		public function get testName():String
		{
			return _testName;
		}
		
		public function set testName(value:String):void
		{
			_testName = value;
		}
		
		public function get Onset():String
		{
			return _Onset;
		}
		
		public function set Onset(value:String):void
		{
			_Onset = value;
		}
		
		public function get OrderDate():String
		{
			return _OrderDate;
		}
		
		public function set OrderDate(value:String):void
		{
			_OrderDate = value;
		}
		
		public function get IsFasting():String
		{
			return _IsFasting;
		}
		
		public function set IsFasting(value:String):void
		{
			_IsFasting = value;
		}
		
		public function get LabType():GeneralTypeDTO
		{
			return _LabType;
		}
		
		public function set LabType(value:GeneralTypeDTO):void
		{
			_LabType = value;
		}
		
		public function get CollectionDate():String
		{
			return _CollectionDate;
		}
		
		public function set CollectionDate(value:String):void
		{
			_CollectionDate = value;
		}
		
		public function get LabTestSpecimenType():GeneralTypeDTO
		{
			return _LabTestSpecimenType;
		}
		
		public function set LabTestSpecimenType(value:GeneralTypeDTO):void
		{
			_LabTestSpecimenType = value;
		}
		
		public function get LabTestPriorityType():GeneralTypeDTO
		{
			return _LabTestPriorityType;
		}
		
		public function set LabTestPriorityType(value:GeneralTypeDTO):void
		{
			_LabTestPriorityType = value;
		}
		
		public function get PatientDiagnosisID():int
		{
			return _PatientDiagnosisID;
		}
		
		public function set PatientDiagnosisID(value:int):void
		{
			_PatientDiagnosisID = value;
		}
		
		public function get DiagnosisInfo():String
		{
			return _DiagnosisInfo;
		}
		
		public function set DiagnosisInfo(value:String):void
		{
			_DiagnosisInfo = value;
		}
		
		public function get Description():String
		{
			return _Description;
		}
		
		public function set Description(value:String):void
		{
			_Description = value;
		}
		
		public function get LIONICLabTestType():LabOutLIONICLabTestDTO
		{
			return _LIONICLabTestType;
		}
		
		public function set LIONICLabTestType(value:LabOutLIONICLabTestDTO):void
		{
			_LIONICLabTestType = value;
		}
		
		public function get IsLabIn():Boolean
		{
			return _IsLabIn;
		}
		
		public function set IsLabIn(value:Boolean):void
		{
			_IsLabIn = value;
		}
		
		public function get LabTestOrderMethodType():GeneralTypeDTO
		{
			return _LabTestOrderMethodType;
		}
		
		public function set LabTestOrderMethodType(value:GeneralTypeDTO):void
		{
			_LabTestOrderMethodType = value;
		}
		
		public function get LabTestType():LabOutTestTypeDTO
		{
			return _LabTestType;
		}
		
		public function set LabTestType(value:LabOutTestTypeDTO):void
		{
			_LabTestType = value;
		}
		public function get FilterFeild():String
		{
			return LIONICLabTestType.Name
		}
		
		public override  function ToXML():XML
		{
			this.nodeName = "LabDTO ";
			var x:XML = super.ToXML();
			
			x.@IsLabIn = this.IsLabIn;
			x.@Description = this.Description;
			x.@CollectionDate = this.CollectionDate;
			x.@IsFasting = this.IsFasting;
			x.@OrderDate = this.OrderDate;
			x.@Onset = this.Onset;
			x.@PatientLabID = this.PatientLabID;
			x.@UserID = this.UserID;
			x.@LabID = this.LabID;
			x.@SignedByUserID = this.SignedByUserID;
			x.@ClinicBranchID = this.ClinicBranchID;
			x.@StationID = this.StationID;
			x.@ID = this.PatientDiagnosisID; //[10/10/2013] Shahid Munir, #4333, @ back end service this is ID
			//x.@PatientDiagnosisID = this.PatientDiagnosisID;
			x.@DiagnosisInfo = this.DiagnosisInfo;
			x.@LabNote = this.Note;
			
			LabTestType.NodeName = "LabTestType";
			x.appendChild(LabTestType.ToXML());
			
			LabTestOrderMethodType.NodeName = "LabTestOrderMethodType";
			x.appendChild(LabTestOrderMethodType.ToXML());
			
			LIONICLabTestType.NodeName = "LIONICLabTestType";
			x.appendChild(LIONICLabTestType.ToXML());
			
			if (LabTestPriorityType && LabTestPriorityType.ID != 0)
			{
				LabTestPriorityType.NodeName = "LabTestPriorityType";
				x.appendChild(LabTestPriorityType.ToXML());
			}
			
			if (LabTestSpecimenType)
			{
				LabTestSpecimenType.NodeName = "LabTestSpecimenType";
				x.appendChild(LabTestSpecimenType.ToXML());
			}
			
			LabType.NodeName = "LabType";
			x.appendChild(LabType.ToXML());
			
			return x; 
		}
		
		public override  function FromXML(x:XML):void
		{
			super.FromXML(x);
			
			this.IsLabIn = UtilityFunctions.StringToBoolean(x.@IsLabIn);
			this.Description = x.@Description;
			this.CollectionDate = x.@CollectionDate;
			this.IsFasting = x.@IsFasting;
			this.OrderDate = x.@OrderDate;
			this.Onset = x.@Onset;
			this.DiagnosisInfo = x.@DiagnosisInfo;
			this.PatientDiagnosisID = x.@ID;  //[10/10/2013] Shahid Munir, #4333, @ back end service this is ID
			//this.PatientDiagnosisID = x.@PatientDiagnosisID;
			
			this.PatientLabID = x.@PatientLabID;
			this.UserID = x.@UserID;
			this.LabID = x.@LabID;
			this.SignedByUserID = x.@SignedByUserID;
			this.ClinicBranchID = x.@ClinicBranchID;
			this.StationID = x.@StationID;
			this.Note = x.@LabNote;
			
			if (x.LabTestType[0])
				this.LabTestType.FromXML(x.LabTestType[0]);
			
			if (x.LabTestOrderMethodType[0])
				this.LabTestOrderMethodType.FromXML(x.LabTestOrderMethodType[0]);	 
			
			if (x.LIONICLabTestType[0])
				this.LIONICLabTestType.FromXML(x.LIONICLabTestType[0]);	
			
			if (x.LabTestPriorityType[0])
				this.LabTestPriorityType.FromXML(x.LabTestPriorityType[0]);	
			
			if (x.LabTestSpecimenType[0])
				this.LabTestSpecimenType.FromXML(x.LabTestSpecimenType[0]);	
			
			if (x.LabType[0])
				this.LabType.FromXML(x.LabType[0]);	
		}
	}
}