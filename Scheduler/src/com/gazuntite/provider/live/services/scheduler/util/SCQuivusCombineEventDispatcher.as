package com.gazuntite.provider.live.services.scheduler.util
{
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.gazuntite.provider.live.services.scheduler.event.LoadAllAppointmentCurrentStatusTypesEvent;
	import com.gazuntite.provider.live.services.scheduler.event.LoadAllAppointmentRequestStatusTypesEvent;
	import com.gazuntite.provider.live.services.scheduler.event.LoadAllAppointmentTypesEvent;
	import com.gazuntite.provider.live.services.scheduler.event.LoadAllSearchFieldTypesEvent;
	import com.gazuntite.provider.live.services.scheduler.event.LoadAllStationsByClinicIdEvent;

	public class SCQuivusCombineEventDispatcher
	{
		public function SCQuivusCombineEventDispatcher()
		{
		}
		
		public static function LoadScheduleStaticData():void
		{
			var LAappEvnet:LoadAllAppointmentTypesEvent 					    = new LoadAllAppointmentTypesEvent();
			var LAappReqStatusEvent:LoadAllAppointmentRequestStatusTypesEvent   = new LoadAllAppointmentRequestStatusTypesEvent();
			var LAappCurStatusEvent:LoadAllAppointmentCurrentStatusTypesEvent   = new LoadAllAppointmentCurrentStatusTypesEvent();
			var LSFTypeEvent:LoadAllSearchFieldTypesEvent 					    = new LoadAllSearchFieldTypesEvent();
			//var LASCIdEvent:LoadAllStationsByClinicIdEvent                      = new LoadAllStationsByClinicIdEvent();
			
			CairngormEventDispatcher.getInstance().dispatchEvent(LAappEvnet );
			CairngormEventDispatcher.getInstance().dispatchEvent(LAappReqStatusEvent);
			CairngormEventDispatcher.getInstance().dispatchEvent(LAappCurStatusEvent);
			CairngormEventDispatcher.getInstance().dispatchEvent(LSFTypeEvent);
			//CairngormEventDispatcher.getInstance().dispatchEvent(LASCIdEvent);
		}
	}
}