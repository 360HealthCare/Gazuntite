package com.gazuntite.common.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.appController.QSCommonController;
	
	public class GetPatientGaxenIdEvent extends CairngormEvent
	{
		
		public var resultHandlerFunction:Function;
		public var patientID:String;
		public var isUser:Boolean = false;
		
		public function GetPatientGaxenIdEvent(patientID:String, resultHandlerFunction:Function, _isUser:Boolean = false)
		{
			super(QSCommonController.GET_PATIENT_GAXENID);
			this.resultHandlerFunction = resultHandlerFunction;
			this.patientID = patientID;
			this.isUser = _isUser;
		}
	}
}