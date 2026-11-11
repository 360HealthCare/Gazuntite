package com.gazuntite.provider.live.services.scheduler.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.scheduler.appControllerSCH.SchedulerController;
	
	public class LoadAllProviderByClinicBranchIdEvent extends CairngormEvent
	{
		public var clinicBranchID:int;
		public var stationId:int;
		public var isLoadAll:Boolean;
		
		public function LoadAllProviderByClinicBranchIdEvent(_clinicBranchID:int, _stationId:int, _isLoadAll:Boolean)
		{
			super(SchedulerController.LOAD_ALL_PROVIDERS_BY_CLINIC_BRANCH_ID_EVENT);
			
			this.clinicBranchID = _clinicBranchID;
			this.stationId		= _stationId;
			this.isLoadAll		= _isLoadAll;
		}
	}
}