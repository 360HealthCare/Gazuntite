package com.gazuntite.provider.live.services.scheduler.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.scheduler.appControllerSCH.SchedulerController;
	
	public class LoadAllAppointmentsEvent extends CairngormEvent
	{
		public var providerID:int;
		public var StationId:int;
		public var isAllProviderSelected:Boolean;
		public var isAllLocationSelected:Boolean;
		public var viewTypeID:int;
		public var functionName 	: Function; 
		public var isFiltered : Boolean; 
		
		
		public function LoadAllAppointmentsEvent(_providerID:int, _StationId:int, _isAllProviderSelected:Boolean, _isAllLocationSelected:Boolean, _viewTypeID:int, _functionName:Function , _isFiltered:Boolean )
		{
			super(SchedulerController.LOAD_ALL_APPOINTMENT_BY_PROVIDERS_AND_STATIONS_ID_EVENT);
			
			providerID 				= _providerID;
			StationId  				= _StationId;
			isAllProviderSelected 	= _isAllProviderSelected;
			isAllLocationSelected 	= _isAllLocationSelected;
			viewTypeID			  	= _viewTypeID;
			this.functionName 		= _functionName;
			this.isFiltered 		= _isFiltered;
		}
	}
}