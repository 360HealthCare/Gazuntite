package com.gazuntite.provider.live.services.scheduler.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.scheduler.appControllerSCH.SchedulerController;
	
	public class LoadAllAppointmentRequestStatusTypesEvent extends CairngormEvent
	{
		public function LoadAllAppointmentRequestStatusTypesEvent()
		{
			super( SchedulerController.LOAD_ALL_APPOINTMENT_REQUEST_STATUS_TYPES_EVENT );
		}
	}
}