package com.gazuntite.common.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.appController.QSCommonController;
	
	public class LoadPatientbyPatientIDEvent extends CairngormEvent
	{
		public var patientID:int;
		public var callBack :Function;
		
		public function LoadPatientbyPatientIDEvent(_patientID:int, _callBack:Function)
		{
			super(QSCommonController.LOAD_PATIENT_BY_PATIENT_ID_EVENT);
			this.patientID = _patientID;
			this.callBack = _callBack;
		}
	}
}