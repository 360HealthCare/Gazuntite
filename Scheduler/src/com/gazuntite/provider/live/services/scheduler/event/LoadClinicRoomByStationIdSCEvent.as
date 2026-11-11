package com.gazuntite.provider.live.services.scheduler.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.scheduler.appControllerSCH.SchedulerController;
	
	public class LoadClinicRoomByStationIdSCEvent extends CairngormEvent
	{
		public var stationId:String;
		public var functionName:Function;
		
		public function LoadClinicRoomByStationIdSCEvent(_stationId:String, _functionName:Function = null)
		{
			super(SchedulerController.LOAD_CLINIC_ROOM_BY_STATION_ID_EVENT);
			this.stationId 		= _stationId;
			this.functionName 	= _functionName;
		}
	}
}