package com.gazuntite.history.delegate
{
	import com.gazuntite.common.util.QSConstants;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class GetProviderListDelegate
	{
		
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function GetProviderListDelegate( responder : IResponder )
		{
			this.responder 		= responder;
			var url:String 		= QSConstants.RESTFULL_SERVICE_BASE_MAIN_URL + "ListPatientVisitProviders";
			
			service 			= new HTTPService(url);
			service.url 		= url;
			
			service.contentType = "Text/Xml";
			service.method		= "POST";
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function GetProviders(sessionID:String,dto:XML):void
		{
			service.showBusyCursor = true;
			service.url = service.url +'/'+ sessionID;
			service.resultFormat = "e4x";
			service.send(dto);	
			
			trace( "LoadAllInsuranceDelegate", service.url );
			
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