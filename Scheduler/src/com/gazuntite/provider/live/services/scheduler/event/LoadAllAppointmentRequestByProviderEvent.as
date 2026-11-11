package com.gazuntite.provider.live.services.scheduler.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.scheduler.appControllerSCH.SchedulerController;
	
	public class LoadAllAppointmentRequestByProviderEvent extends CairngormEvent
	{
		public var providerId:int;
		public var clinicBranchId:int;
		public var functionName:Function
		
		public function LoadAllAppointmentRequestByProviderEvent(_providerId:uint, _clinicBranchId:uint, _functionName:Function)
		{
			super(SchedulerController.LOAD_APPOINTMENT_REQUEST_BY_PROVIDER_EVENT);
			this.providerId 		= _providerId;
			this.clinicBranchId		= _clinicBranchId;
			this.functionName		= _functionName;
		}
	}
}