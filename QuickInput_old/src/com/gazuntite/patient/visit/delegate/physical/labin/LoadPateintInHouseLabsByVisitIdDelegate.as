package com.gazuntite.patient.visit.delegate.physical.labin
{
	import com.gazuntite.patient.visit.utils.QIConstants;
	import com.gazuntite.patient.visit.utils.QIServiceMethods;
	
	import flash.net.URLRequestMethod;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	import org.osmf.logging.Logger;

	public class LoadPateintInHouseLabsByVisitIdDelegate
	{
		private var responder : IResponder;
		private var service : HTTPService;
		
		public function LoadPateintInHouseLabsByVisitIdDelegate(responder:IResponder)
		{
			this.service =  new HTTPService();
			this.responder = responder;	
			
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL + QIServiceMethods.LOAD_LABIN_BY_VISIT_ID;
			service 			= new HTTPService(url);
			service.url 		= url;
			service.method		= URLRequestMethod.GET;
			service.resultFormat = "e4x";
			
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function loadLabInByvisitID(VisitID:int ,IsTemplateVisit:Boolean , LoggedInUserSessionID:String ):void
		{
			service.url  = service.url + "/" + VisitID + "/" + IsTemplateVisit + "/" + LoggedInUserSessionID ;
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