package com.zigron.gazuntite.event.registration
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.zigron.gazuntite.controller.GazuntiteClientController;
	
	public class CreateClinicUserProfileEvent extends CairngormEvent
	{
		public var userId:int;
		public var userTypeId:int;
		public var clinicBranchId:int;
		public var specailityTypeID:String;
		public var NPI:String;
		public var callBack:Function;
		
		public function CreateClinicUserProfileEvent(userId:int,userTypeId:int,clinicBranchId:int,specailityTypeID:String,NPI:String, callBack:Function)
		{
			super(GazuntiteClientController.CREATE_CLINIC_USER_PROFILE_EVENT);
			
			this.userId = userId;
			this.userTypeId = userTypeId;
			this.clinicBranchId = clinicBranchId;
			this.specailityTypeID = specailityTypeID;
			this.NPI = NPI;
			this.callBack = callBack;
		}
	}
}
