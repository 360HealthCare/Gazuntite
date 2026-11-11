package com.gazuntite.provider.live.services.scheduler.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.scheduler.appControllerSCH.SchedulerController;
	
	public class SearchAppointmentsEvent extends CairngormEvent
	{
		public var providerId:int;
		public var providerUserId:int;
		public var stationId:int;
		public var fieldTypeId:int;
		public var searchText:String;
		public var pageNo:int;
		public var functionName:Function
		
		public function SearchAppointmentsEvent( _providerId:int, _providerUserId:int, _stationId:int, _fieldTypeId:int, _searchText:String, _pageNo:int, _functionName:Function)
		{
			super(SchedulerController.SEARCH_APPOINTMENTS_EVENT);
			
			this.providerId 	= _providerId;
			this.providerUserId = _providerUserId;
			this.stationId 		= _stationId;
			this.fieldTypeId 	= _fieldTypeId;
			this.searchText 	= _searchText;
			this.pageNo 		= _pageNo;
			this.functionName   = _functionName;
		}
	}
}