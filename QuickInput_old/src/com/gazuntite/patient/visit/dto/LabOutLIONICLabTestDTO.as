package com.gazuntite.patient.visit.dto
{
	import com.gazuntite.patient.visit.dto.common.GeneralTypeDTO;
	import com.gazuntite.common.util.xml.XmlUtils;

	[Bindable]
	public class LabOutLIONICLabTestDTO extends GeneralTypeDTO
	{
		private var _testNum:String;
		
		
		public function LabOutLIONICLabTestDTO()
		{
		}

		public function get testNum():String
		{
			return _testNum;
		}

		public function set testNum(value:String):void
		{
			_testNum = value;
		}

		
		public override function ToXML():XML
		{
			//nodeName = "TestSpecimenResponse";
			var x:XML = super.ToXML();
			

			x.@["Num"] = this.testNum;
			
			
			return x;
			
		}
		
		public override function FromXML( x:XML ):void
		{
			ID 								= x.@["ID"];
			Name 							= x.@["Name"];
			testNum 						= x.@["Num"];
			
		}
		
	}
}