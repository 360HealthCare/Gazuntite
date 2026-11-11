package com.gazuntite.common.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.appController.QSCommonController;
	import com.gazuntite.common.dto.VitalsDTO;

	public class ManagePatientVitalEvent extends CairngormEvent
	{
		public var VitalDTO :VitalsDTO;
		public var UserID :int;
		public var VisitID :int;
		public var SessionID :String;
		public var Callback:Function;
		
		public function ManagePatientVitalEvent(dto:VitalsDTO, userid:int, visitID:int, sessionID:String, callback:Function)
		{
			super (QSCommonController.MANAGE_PATIENT_VITALS_EVENT);
			
			this.VitalDTO = dto;
			UserID = userid;
			VisitID = visitID;
			SessionID = sessionID;
			Callback = callback;
		}
	}
}