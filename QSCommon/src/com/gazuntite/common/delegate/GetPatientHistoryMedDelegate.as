package com.gazuntite.common.delegate
{
	import com.gazuntite.common.util.QSConstants;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class GetPatientHistoryMedDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function GetPatientHistoryMedDelegate(responder : IResponder)
		{
			this.responder 		= responder;
			var url:String 		= QSConstants.RESTFULL_SERVICE_BASE_URL_FOR_LOAD_MEDICATIONS + "GetPatientHistoryMed";
			service 			= new HTTPService(url);
			service.url 		= url;
			
			service.contentType = "Text/Xml";
			service.method		= "POST";
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function GetPatientPrescription(data:XML, encounterId:String="0", gaxenId:String="0"):void
		{
			service.url += "/" + encounterId + "/" + gaxenId ;
			service.send(data);	
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