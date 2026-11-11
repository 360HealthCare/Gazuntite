package com.gazuntite.patient.visit.delegate.pmh.comphistory
{
	import com.gazuntite.patient.visit.utils.QIConstants;
	
	import flash.net.URLRequestMethod;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class DeleteComprehensiveModuleDatabyPatientIDDelegate
	{
		private var responder	:IResponder;
		private var RestfulService		:HTTPService;
		
		public function DeleteComprehensiveModuleDatabyPatientIDDelegate( responder : IResponder )
		{
			this.responder 				= responder;
			var url:String 				= QIConstants.RESTFULL_SERVICE_BASE_URL +  "DeleteComprehensiveModuleDatabyPatientID"; 
			
			RestfulService 				= new HTTPService(url);
			RestfulService.contentType 	= "application/json; charset=utf-8";
			RestfulService.method 		= URLRequestMethod.GET;
			
			RestfulService.addEventListener(FaultEvent.FAULT, onFault);
			RestfulService.addEventListener(ResultEvent.RESULT, onResult);
			
			this.responder = responder;	
		}
		
		public function DeleteComprehensiveModuleData(PatientID:int, CH_Section:int, typeID:int, clinicBranchID:int):void
		{
			RestfulService.url =  QIConstants.RESTFULL_SERVICE_BASE_URL +  "DeleteComprehensiveModuleDatabyPatientID/" + PatientID + "/" + CH_Section + "/" + typeID + "/" + clinicBranchID;
			
			RestfulService.send();
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