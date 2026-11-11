package com.gazuntite.common.dto.assessment.procedure
{
	import com.gazuntite.common.dto.baseDTO.BaseDTO;
	import com.gazuntite.common.dto.typeDTO.CPTMedicalTypeDTO;
	
	
	[Bindable]
	public class ProcedureDTO extends BaseDTO
	{
		private var _PatientProcedureID:int;
		private var _cptmedicalDTO:CPTMedicalTypeDTO;
		
		public function ProcedureDTO()
		{
			cptmedicalDTO = new CPTMedicalTypeDTO();
		}
		
		public function get cptmedicalDTO():CPTMedicalTypeDTO
		{
			return _cptmedicalDTO;
		}
		
		public function get label():String
		{
			return cptmedicalDTO.ProcedureDescription;
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
		
		public function get FilterFeild():String
		{
			return cptmedicalDTO.ProcedureDescription;
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
			
			x.@PatientProcedureID = this.PatientProcedureID ; 
			
			this.cptmedicalDTO.nodeName = "CPTMedicalTypes";
			x.appendChild(cptmedicalDTO.ToXML());
			
			return x;
		}
	}
}