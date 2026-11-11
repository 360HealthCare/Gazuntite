package com.gazuntite.common.delegate
{
	import com.gazuntite.common.util.QSConstants;
	
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
		}
		
		public function GetGaxenId(patientID:String, isUser:Boolean = false):void
		{
			var url:String = '';
			if(isUser)
			{
				url 		= 'http://www.quivus.com/QuivusAirDev/QuivusMainManagerService/QuivusManagerProviderSearchRestfullService/QuivusManagerProviderSearchRestfullService.svc/' + "GetUserGaxen/";
				//url 		= QSConstants.EPRESCRIPTION_USER_SERVICE + "GetUserGaxen/";
			}else
			{
				url 		= QSConstants.EPRESCRIPTION_USER_SERVICE + "GetPatientGaxenID/";
			}
			
			service 			= new HTTPService(url);
			service.url 		= url;
			
			service.url += patientID;
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
			
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