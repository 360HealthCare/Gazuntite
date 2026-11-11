package com.zigron.gazuntite.event.login
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.zigron.gazuntite.controller.GazuntiteClientController;
	
	public class GetClinicUserDetailsByIDEvent extends CairngormEvent
	{
		public var userId : int;
		public var branchId : int;
		public var is4UserImage : Boolean;
		public var resultHandlerFunction:Function;
		
		public function GetClinicUserDetailsByIDEvent(_userId : int, _branchId:int , _is4UserImage:Boolean = false, _resultHandlerFunction:Function = null)
		{
			super(GazuntiteClientController.LOAD_CLINIC_USER_BASIC_INFO);
			this.userId 				= _userId;
			this.branchId 				= _branchId;
			this.is4UserImage 			= _is4UserImage;
			this.resultHandlerFunction 	= _resultHandlerFunction;
		}
	}
}