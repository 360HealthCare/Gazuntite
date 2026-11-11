package com.gazuntite.patient.visit.event.visit
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;
	
	public class LoadPhysiciansbyClinicBranchIDEvent extends CairngormEvent
	{
		public var BranchId:int;
		public var VisitID:int;
		public var patientID:int;
		public var isEditMode:String;
		public var UserId:int;
		
		public function LoadPhysiciansbyClinicBranchIDEvent(_BranchId:int, _VisitID:int, _patientID:int, _isEditMode:String, _UserId:int)
		{
			super(QIController.LOAD_PHYSICIANS_BY_CLINICBRANCH_ID);
			this.BranchId = _BranchId;
			this.VisitID  = _VisitID;
			this.patientID = _patientID;
			this.isEditMode = _isEditMode;
			this.UserId     = _UserId;
		}
	}
}