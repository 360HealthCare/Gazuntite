package com.gazuntite.patient.visit.event.pmh.comphistory
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.ch.MedicalHistoryDTO;
	import com.gazuntite.patient.visit.controller.QIController;
	
	import mx.collections.ArrayCollection;

	public class SaveMedicalHistoryEvent extends CairngormEvent
	{
		public var patientId:int;
		public var branchId:int;
		public var medicalHistory:MedicalHistoryDTO;
		public var callBack:Function;
		
		public function SaveMedicalHistoryEvent(patientID:int, ClinicBranchIdSeq:int, medicalHistory:MedicalHistoryDTO, callBack:Function = null)
		{
			super( QIController.SAVE_MEDICAL_HISTORY_EVENT );
			this.patientId = patientId;
			this.branchId = branchId;
			this.medicalHistory = medicalHistory;
			
			this.callBack = callBack;
		}
	}
}