package com.gazuntite.common.dto.physical.inHouseLab
{
	import com.gazuntite.common.dto.baseDTO.BaseDTO;

	[Bindable]
	public class InHouseLabDTO extends BaseDTO
	{
		private var _PatientInHouseLabTestID:int;
		private var _InHouseLabTestType:InHouseLabTestTypeDTO;
		private var _ResultAttachment:String = "";
		private var _TestResult:String = "";
		
		public function InHouseLabDTO()
		{
		}

		public function get TestResult():String
		{
			return _TestResult;
		}
		
		public function get label():String
		{
			return InHouseLabTestType.Name
		}

		public function set TestResult(value:String):void
		{
			_TestResult = value;
		}

		public function get Result():String
		{
			return TestResult;
		}

		public function set Result(value:String):void
		{
			TestResult = value;
		}

		public function get ResultAttachment():String
		{
			return _ResultAttachment;
		}

		public function set ResultAttachment(value:String):void
		{
			_ResultAttachment = value;
		}

		public function get InHouseLabTestType():InHouseLabTestTypeDTO
		{
			return _InHouseLabTestType;
		}

		public function set InHouseLabTestType(value:InHouseLabTestTypeDTO):void
		{
			_InHouseLabTestType = value;
		}

		public function get PatientInHouseLabTestID():int
		{
			return _PatientInHouseLabTestID;
		}

		public function set PatientInHouseLabTestID(value:int):void
		{
			_PatientInHouseLabTestID = value;
		}
		
		public function get FilterFeild():String
		{
			return InHouseLabTestType.Name
		}
		
		public override  function FromXML(x:XML):void
		{
			super.FromXML(x);
			
			this.PatientInHouseLabTestID   	=x.@PatientInHouseLabTestID;
			this.ResultAttachment   		=x.@ResultAttachment;
			this.TestResult   					=x.@TestResult;
			
			InHouseLabTestType = new InHouseLabTestTypeDTO();
			
			InHouseLabTestType.FromXML(x.InHouseLabTestType[0]);
			
		}
		public override  function ToXML():XML
		{
			this.nodeName = "InHouseLabDTO ";
			var x:XML = super.ToXML();
			
			x.@PatientInHouseLabTestID			=this.PatientInHouseLabTestID ;
			x.@ResultAttachment					=this.ResultAttachment ;
			x.@TestResult						=this.TestResult ;
			
			x.appendChild( InHouseLabTestType.ToXML() )
			
				return x;
		}
		
		public function clone():InHouseLabDTO
		{
			var lab:InHouseLabDTO = new InHouseLabDTO();
			
			lab.CreatedAt = CreatedAt;
			lab.CreatedBy = CreatedBy;
			
			lab.DictationID = DictationID;
			
			lab.inEditMode = inEditMode;
			lab.InHouseLabTestType = InHouseLabTestType;
			
			lab.IsDeleted = IsDeleted;
			lab.IsDirty = IsDirty;
			lab.IsRecordEditable = IsRecordEditable;
			
			lab.ModifiedAt = ModifiedAt;
			lab.ModifiedBy = ModifiedBy;
			
			lab.Note = Note;
			lab.NoteSubject = NoteSubject;
			
			lab.PatientID = PatientID;
			lab.PatientInHouseLabTestID = PatientInHouseLabTestID;
			
			lab.Result = Result;
			lab.ResultAttachment = ResultAttachment;
			
			lab.serialNumber = serialNumber;
			lab.TestResult = TestResult;
			
			lab.VisitDate = VisitDate;
			lab.VisitID = VisitID;
			
			return lab;
		}
			
	}
}