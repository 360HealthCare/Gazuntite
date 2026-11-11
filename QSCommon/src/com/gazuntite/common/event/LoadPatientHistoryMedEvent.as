package com.gazuntite.common.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.appController.QSCommonController;
	
	public class LoadPatientHistoryMedEvent extends CairngormEvent
	{
		public var resultHandlerFunction:Function;
		public var encounterId:String;
		public var gaxenPatientId:String;
		
		public function LoadPatientHistoryMedEvent(encounterId:String, gaxenPatientId:String, resultHandlerFunction:Function)
		{
			super(QSCommonController.LOAD_PATIENT_HISTORY_MED);
			
			this.resultHandlerFunction = resultHandlerFunction;
			this.encounterId 	= encounterId;
			this.gaxenPatientId 	= gaxenPatientId;
		}
	}
}