package com.gazuntite.patient.visit.event.pmh.comphistory
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;
	import com.gazuntite.patient.visit.dto.FamilyHistroyDTO;

	public class ManagePatientFamilyHistoryEvent extends CairngormEvent
	{
		public var patientId:int;
		public var branchId:int;
		public var FamilyHistory:FamilyHistroyDTO;
		public var callBack:Function;
		
		public function ManagePatientFamilyHistoryEvent(patientID:int, ClinicBranchIdSeq:int, familyHistory:FamilyHistroyDTO, callBack:Function = null)
		{
			super(QIController.MANAGE_PATIENT_FAIMLY_HISTORY_EVENT);
			
			this.patientId = patientId;
			this.branchId = branchId;
			this.FamilyHistory = familyHistory;
			this.callBack = callBack;
		}
	}
}