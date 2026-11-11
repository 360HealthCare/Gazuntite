package com.gazuntite.patient.visit.event.pmh.comphistory
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.patient.visit.controller.QIController;
	import com.gazuntite.patient.visit.dto.SocialHistoryDTO;

	public class ManagePatientSocialHistoryEvent extends CairngormEvent
	{
		public var branchId:int;
		public var patientID:int;
		public var sessionID:String;
		public var callBack:Function;
		
		public function ManagePatientSocialHistoryEvent(_branchId:int, _patientID:int, _sessionID:String, _callBack:Function)
		{
			super(QIController.MANAGE_PATIENT_SOCIAL_HISTORY_EVENT);
			
			this.branchId      = _branchId;
			this.patientID	   = _patientID;
			this.sessionID     = _sessionID;
			this.callBack	   = _callBack;
		}
	}
}