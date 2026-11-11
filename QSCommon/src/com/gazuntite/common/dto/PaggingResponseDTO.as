package com.gazuntite.common.dto
{
	
	import mx.collections.ArrayCollection;

	public class PaggingResponseDTO  
	{
		public function PaggingResponseDTO()
		{
		}
		
		private var  totalRecord   				:int;
		public function get TotalRecord():int
		{
			return totalRecord;
		}		
		public function set TotalRecord(value:int):void
		{
			totalRecord = value;
		}
		
		
		
		private var  firstRecord   				:int;
		public function get FirstRecord():int
		{
			return firstRecord;
		}		
		public function set FirstRecord(value:int):void
		{
			firstRecord = value;
		}
		
		
		
		private var  lastRecord   				:int;
		public function get LastRecord():int
		{
			return lastRecord;
		}		
		public function set LastRecord(value:int):void
		{
			lastRecord = value;
		}
		
		
		 
		private var  patientDocumentDTOList    	:ArrayCollection;
		public function get PatientDocumentDTOList():ArrayCollection
		{
			return patientDocumentDTOList ;
		}		
		public function set PatientDocumentDTOList(value:ArrayCollection):void
		{
			patientDocumentDTOList  = value;
		}
		
		
	}
}