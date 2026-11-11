package com.zigron.gazuntite.delegate.registration
{
	import com.zigron.gazuntite.utils.CommonServiceMethods;
	import com.zigron.gazuntite.utils.Constants;
	
	import mx.managers.CursorManager;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class CreateClinicUserProfileDelegate
	{
		private var responder : IResponder;
		private var RestfulService : HTTPService;
		
		public function CreateClinicUserProfileDelegate(responder : IResponder)
		{
			this.responder 		= responder;
			//var url:String 		= "http://localhost:51748/Service/RestfulService/UserManagerRestfulService.svc/" + CommonServiceMethods.CREATE_CLINIC_USER_PROFILE;
			var url:String 		= Constants.RESTFULL_USER_MANAGER_SERVICE_BASE_URL + CommonServiceMethods.CREATE_CLINIC_USER_PROFILE;
			RestfulService 			= new HTTPService(url);
			RestfulService.url 		= url;
			
			RestfulService.addEventListener(FaultEvent.FAULT,onFault);
			RestfulService.addEventListener(ResultEvent.RESULT,onResult);
			
		}
		
		public function GetDoctorID(userId:int,userTypeId:int,clinicBranchId:int,specailityTypeID:String,NPI:String) : void 
		{
			RestfulService.url += "/" + userId + "/" + userTypeId + "/" + clinicBranchId + "/" + specailityTypeID + "/" + NPI;
			RestfulService.resultFormat = "e4x";
			CursorManager.setBusyCursor();			
			RestfulService.send();
		}
		
		private function onResult(event:ResultEvent):void
		{
			CursorManager.removeBusyCursor();
			responder.result(event);
		}
		
		private function onFault(event:FaultEvent):void
		{
			CursorManager.removeBusyCursor();
			responder.fault(event);			
		}
	}
}