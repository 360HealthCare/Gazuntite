package com.gazuntite.common.delegate
{
	import com.gazuntite.common.util.QSConstants;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class MarkValidDataExistsDelegate
	{
		
		private var responder : IResponder;
		private var service : HTTPService;
		
		public function MarkValidDataExistsDelegate(responder:IResponder)
		{
			this.service 		=  new HTTPService();
			this.responder 		= responder;	
			
			var url:String 		= QSConstants.RESTFULL_SERVICE_BASE_URL  + 'MarkValidDataExists';
			service 			= new HTTPService(url);
			service.url 		= url;
			//service.method		= URLRequestMethod.POST;
			service.resultFormat = "e4x";
			service.contentType = "application/xml; charset=utf-8";
			
			//logger.debug( "service.url", url );
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		public function MarkValidData(VisitID : int, placeOfServiceID:int, encounterTypeID:int, visitDate:String, LoggedInUserSessionID:String):void
		{
			service.url  = service.url + "/" + VisitID + "/"  + placeOfServiceID +'/'+ encounterTypeID  +'/'+ visitDate  +'/'+ LoggedInUserSessionID ;
			
			trace(service.url)
			
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