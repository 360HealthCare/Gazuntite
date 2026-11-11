package com.gazuntite.common.delegate
{
	import com.gazuntite.common.util.QSConstants;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class LoadPatientbyPatientIDDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function LoadPatientbyPatientIDDelegate(responder:IResponder)
		{
			this.responder 		= responder;
			var url:String 		= QSConstants.EPRESCRIPTION_USER_SERVICE + 'LoadPatientbyPatientID';
			service 			= new HTTPService(url);
			service.url 		= url;
			service.resultFormat= 'e4x';
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function LoadPatientbyPatientID(patientID:int):void
		{
			service.url += "/" + patientID ;
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