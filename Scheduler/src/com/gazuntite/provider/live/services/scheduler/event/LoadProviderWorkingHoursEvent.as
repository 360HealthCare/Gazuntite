package com.gazuntite.provider.live.services.scheduler.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.scheduler.appControllerSCH.SchedulerController;
	
	public class LoadProviderWorkingHoursEvent extends CairngormEvent
	{
		public var providerUserId:int;
		public var providerId:int;
		public var stationId:int;
		public var day:String;
		public var functionName:Function;
		
		public function LoadProviderWorkingHoursEvent(_providerUserId:int, _providerId:int, _stationId:int, _day:String, _functionName:Function)
		{
			super(SchedulerController.LOAD_PROVIDERS_WORKING_HOURS_EVENT);
			
			this.providerUserId = _providerUserId;
			this.providerId = _providerId;
			this.stationId = _stationId;
			this.day 	= _day;
			this.functionName 	= _functionName;
		}
	}
}