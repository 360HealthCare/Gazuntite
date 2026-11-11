package com.gazuntite.provider.live.services.scheduler.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.scheduler.appControllerSCH.SchedulerController;
	
	public class LoadPatientCompleteInfoEvent extends CairngormEvent
	{
		public var patientId:int;
		public var clinicBranchId:int;
		public var providerUserId:int;
		public var stationId:int;
		public var functionName:Function;
		
		public function LoadPatientCompleteInfoEvent(_patientId:int, _clinicBranchId:int, _providerUserId:int, _stationId:int, _functionName:Function)
		{
			super(SchedulerController.LOAD_PATIENT_COMPLETE_INFO_EVENT);
			
			this.patientId 		= _patientId;
			this.clinicBranchId = _clinicBranchId;
			this.providerUserId = _providerUserId;
			this.stationId		= _stationId;
			this.functionName	= _functionName;
		}
	}
}