package com.gazuntite.input.delegate.visit.visit
{
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.input.utils.QIServiceMethods;
	
	import flash.net.URLRequestMethod;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class CoSignVisitDelegate
	{
		private var responder : IResponder;
		private var service : HTTPService;
		
		public function CoSignVisitDelegate(responder:IResponder)
		{
			this.service =  new HTTPService();
			this.responder = responder;	
			
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL  + QIServiceMethods.CO_SIGN_VISIT;
			service 			= new HTTPService(url);
			service.url 		= url;
			service.method		= URLRequestMethod.GET;
			service.resultFormat = "e4x";
			
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
			
		}
		public function CoSignVisit(VisitID:int,LoggedInUserProviderId:int , LoggedInUserId:int, LoggedInUserProviderTypeId:int , opetationDate:String):void
		{
			service.url  = service.url + "/" + VisitID + "/"  + LoggedInUserProviderId + "/"  + LoggedInUserId + "/" + LoggedInUserProviderTypeId + "/" + opetationDate;
			trace(service.url);
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