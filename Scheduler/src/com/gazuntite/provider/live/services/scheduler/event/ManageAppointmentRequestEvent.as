package com.gazuntite.provider.live.services.scheduler.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.live.services.scheduler.appControllerSCH.SchedulerController;
	
	public class ManageAppointmentRequestEvent extends CairngormEvent
	{
		//ManageAppointmentRequest/{requestId}/{statusId}/{modifiedBy}/{modifiedAt}/{reqStatus}/{clinicBranchId}
		public var requestId:String;
		public var statusId:int;
		public var modifiedBy:int;
		public var modifiedAt:String;
		public var reqStatus:String;
		public var clinicBranchId:int;
		public var rejectionReason:String;
		public var functionName:Function;
		
		public function ManageAppointmentRequestEvent(_requestId:String, _statusId:int, _modifiedBy:int, _modifiedAt:String, _reqStatus:String, _clinicBranchId:int, _rejectionReason:String, _functionName:Function)
		{
			super(SchedulerController.MANAGE_APPOINTMENT_REQUEST_EVENT);
			requestId 		= _requestId;
			statusId		= _statusId;
			modifiedBy  	= _modifiedBy;
			modifiedAt  	= _modifiedAt;
			reqStatus		= _reqStatus;
			clinicBranchId	= _clinicBranchId;
			rejectionReason	= _rejectionReason;
			functionName	= _functionName;
		}
	}
}