package com.gazuntite.provider.live.services.scheduler.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.scheduler.appControllerSCH.SchedulerController;
	
	public class LoadAllStationsByClinicIdEvent extends CairngormEvent
	{
		public var func:Function;
		
		public function LoadAllStationsByClinicIdEvent(_func:Function)
		{
			super(SchedulerController.LOAD_ALL_STATIONS_BY_CLINIC_ID_EVENT);
			this.func = _func;
		}
	}
}