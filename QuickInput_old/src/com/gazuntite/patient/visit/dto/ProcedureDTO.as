package com.gazuntite.patient.visit.dto
{
	import com.gazuntite.patient.visit.dto.common.BaseDTO;
	import com.gazuntite.common.util.xml.XmlUtils;

	[Bindable]
	public class ProcedureDTO extends BaseDTO
	{
		private var _PatientProcedureID:int;
		private var _cptmedicalDTO:CPTMedicalTypeDTO;
		
		
		public function ProcedureDTO()
		{
			cptmedicalDTO = new CPTMedicalTypeDTO();
		}
		
		/*private var _CPTCode:String;
		private var _CPTProcedure:String;
	
		public function get CPTProcedure():String
		{
			return _CPTProcedure;
		}

		public function set CPTProcedure(value:String):void
		{
			_CPTProcedure = value;
		}

		public function get CPTCode():String
		{
			return _CPTCode;
		}

		public function set CPTCode(value:String):void
		{
			_CPTCode = value;
		}*/

		public function get cptmedicalDTO():CPTMedicalTypeDTO
		{
			return _cptmedicalDTO;
		}

		public function set cptmedicalDTO(value:CPTMedicalTypeDTO):void
		{
			_cptmedicalDTO = value;
		}

		public function get PatientProcedureID():int
		{
			return _PatientProcedureID;
		}

		public function set PatientProcedureID(value:int):void
		{
			_PatientProcedureID = value;
		}
		
		public override function FromXML(x:XML):void
		{
			super.FromXML(x);
			
			this.PatientProcedureID = x.@PatientProcedureID;
			
			cptmedicalDTO = new CPTMedicalTypeDTO();
			
			cptmedicalDTO.FromXML(x.CPTMedicalTypes[0]);
		}
		
		public override function ToXML():XML
		{
			this.nodeName = "ProcedureDTO";
			var x:XML = super.ToXML();
				
			x.@PatientProcedureID 		=this.PatientProcedureID ; 
			
			this.cptmedicalDTO.nodeName = "CPTMedicalTypes";
			x.appendChild(cptmedicalDTO.ToXML());
			
			return x;
		}
		
		
	}
}