package com.gazuntite.input.event.visit.pmh.comphistory
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.dto.pmh.compHistory.FamilyHistoryDTO;
	import com.gazuntite.input.controller.QIController;
		
	public class ManagePatientFamilyHistoryEvent extends CairngormEvent
	{
		public var patientId:int;
		public var branchId:int;
		public var FamilyHistory:FamilyHistoryDTO;
		public var callBack:Function;
		
		public function ManagePatientFamilyHistoryEvent(patientID:int, ClinicBranchIdSeq:int, familyHistory:FamilyHistoryDTO, callBack:Function = null)
		{
			super(QIController.MANAGE_PATIENT_FAIMLY_HISTORY_EVENT);
			
			this.patientId = patientId;
			this.branchId = branchId;
			this.FamilyHistory = familyHistory;
			this.callBack = callBack;
		}
	}
}