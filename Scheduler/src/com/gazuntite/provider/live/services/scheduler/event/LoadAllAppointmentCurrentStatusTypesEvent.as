package com.gazuntite.provider.live.services.scheduler.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.scheduler.appControllerSCH.SchedulerController;
	
	public class LoadAllAppointmentCurrentStatusTypesEvent extends CairngormEvent
	{
		public function LoadAllAppointmentCurrentStatusTypesEvent()
		{
			super(SchedulerController.LOAD_ALL_APPOINTMENT_CURRENT_STATUS_TYPES_EVENT);
		}
	}
}