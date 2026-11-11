package com.gazuntite.common.event.visit
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.common.appController.QSCommonController;
	
	public class LoadPatientVisitsEvent extends CairngormEvent
	{
		public var resultHandlerFunction:Function;
		public var userId:String;
		public var clinicBranchId:String;
	
		public function LoadPatientVisitsEvent(userId:String, clinicBranchId:String, resultHandlerFunction:Function)
		{
			super(QSCommonController.LOAD_PATIENT_VISIT_EVENT);
			
			this.resultHandlerFunction 	= resultHandlerFunction;
			this.userId 				= userId;
			this.clinicBranchId 		= clinicBranchId;
		}
	}
}