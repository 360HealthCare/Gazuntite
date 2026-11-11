package com.gazuntite.patient.visit.dto
{
	import com.gazuntite.patient.visit.dto.common.BaseDTO;

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
		public override  function FromXML(x:XML):void
		{
			super.FromXML(x);
			
			
			this.PatientInHouseLabTestID   		=x.@PatientInHouseLabTestID;
			this.ResultAttachment   			=x.@ResultAttachment;
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
			
	}
}