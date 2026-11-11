package com.gazuntite.provider.eprescription.services.patient.delegate
{
	import com.gazuntite.provider.eprescription.services.patient.util.EConstants;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class GetPatientGaxenIdDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function GetPatientGaxenIdDelegate( responder : IResponder )
		{
			this.responder 		= responder;
			//GetPatientGaxenID/{USERID}
			var url:String 		= EConstants.RESTFULL_USER_SERVICE_BASE_URL + "GetPatientGaxenID/";
			
			service 			= new HTTPService(url);
			service.url 		= url;
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function GetGaxenId(patientID:String):void
		{
			// GetOutBox/SPI/StartDate/EndDate/Sig
			service.url += patientID;
			service.send();	
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