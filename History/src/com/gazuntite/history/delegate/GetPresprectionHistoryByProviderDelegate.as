package com.gazuntite.history.delegate
{
	import com.gazuntite.common.util.QSConstants;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class GetPresprectionHistoryByProviderDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function GetPresprectionHistoryByProviderDelegate(responder : IResponder)
		{
			this.responder 		= responder;
			var url:String 		= QSConstants.RESTFULL_SERVICE_BASE_URL_FOR_LOAD_MEDICATIONS + "LoadPatientHistoryByGaxenUserID";
			
			service 			= new HTTPService(url);
			service.url 		= url;
			
			service.contentType = "Text/Xml";
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function GetHistory(gaxenID:String , sesionID:int, patientGaxenID:String):void
		{
			// BY AH
			// @TA Please block the call for the patient whose gaxen patientID doesnt exist
			if(patientGaxenID == '' || patientGaxenID == '0')
				return;
			
			service.showBusyCursor = true;
			service.url = service.url +'/'+ gaxenID +'/'+ sesionID +'/'+  patientGaxenID; 
			service.resultFormat = "e4x";
			service.send();	
			
			trace( "Get PresprectionHistoryByProvider Delegate", service.url );
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