package com.gazuntite.provider.eprescription.services.patient.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.gazuntite.provider.eprescription.services.patient.appController.EPrescriptionController;
	
	public class LoadClinicUsersBasicInfoEvent extends CairngormEvent
	{
		public var userId : int;
		public var branchId : int;
		public var resultHandlerFunction:Function;
		
		public function LoadClinicUsersBasicInfoEvent(_userId : int, _branchId:int , _resultHandlerFunction:Function)
		{
			super(EPrescriptionController.LOAD_CLINIC_USERS_BASIC_INFO);
			this.userId 				= _userId;
			this.branchId 				= _branchId;
			this.resultHandlerFunction 	= _resultHandlerFunction;
		}
	}
}