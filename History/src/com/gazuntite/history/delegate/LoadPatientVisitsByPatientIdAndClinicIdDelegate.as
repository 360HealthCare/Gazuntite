package com.gazuntite.history.delegate
{
	import com.gazuntite.common.util.QSConstants;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadPatientVisitsByPatientIdAndClinicIdDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function LoadPatientVisitsByPatientIdAndClinicIdDelegate(responder : IResponder)
		{
			this.responder 		= responder;
			var url:String 		= QSConstants.RESTFULL_SERVICE_BASE_URL + "LoadPatientEncountersByPatientIdAndClinicId";			
			service 			= new HTTPService(url);
			service.url 		= url;	
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		//LoadPatientEncountersByPatientIdAndClinicId/48781/7/false/604/3/1090c800-6498-4e5a-9851-9b108c72394e
		public function LoadPatientVisitsByPatientIdAndClinicId(patientID:int, clinicBranchID:int, isShowAll:Boolean, userId:int, userTypeID:int, sessionID:String):void
		{
			service.showBusyCursor = true;
			service.url = service.url +"/"+ patientID +"/"+ clinicBranchID +'/'+ isShowAll  +'/'+ userId +'/'+ userTypeID +'/'+sessionID;
			service.resultFormat = "e4x";
			service.send();	
			trace('LoadPatientEncountersByPatientIdAndClinicId >> ', service.url);
		}
		
		private function onResult(event:ResultEvent):void
		{
			responder.result(event);
		}
		
		private function onFault(event:FaultEvent):void
		{
			responder.fault(event);			
		}
	}
}