package com.gazuntite.provider.live.services.scheduler.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.scheduler.appControllerSCH.SchedulerController;

	public class LoadAllAppointmentTypesEvent extends CairngormEvent
	{
		public function LoadAllAppointmentTypesEvent()
		{
			super( SchedulerController.LOAD_ALL_APPOINTMENT_TYPES_EVENT );
		}
	}
}