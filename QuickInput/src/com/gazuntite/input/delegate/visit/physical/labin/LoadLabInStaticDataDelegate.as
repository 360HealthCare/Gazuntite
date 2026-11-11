package com.gazuntite.input.delegate.visit.physical.labin
{
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.input.utils.QIServiceMethods;
	
	import flash.events.Event;
	import flash.net.URLRequestMethod;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	import mx.utils.XMLUtil;

	public class LoadLabInStaticDataDelegate
	{
		private var responder:IResponder;
		private var service:HTTPService;
		
		public function LoadLabInStaticDataDelegate(responder:IResponder)
		{
			this.service =  new HTTPService();
			this.responder = responder;	
			
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL + QIServiceMethods.LABIN_LOAD_SEARCH_BY_ID;
			service 			= new HTTPService(url);
			service.url 		= url;
			service.method		= URLRequestMethod.POST;
			service.resultFormat = "e4x";
			service.contentType = "text/xml";
			
			service.addEventListener(FaultEvent.FAULT, onFault);
			service.addEventListener(ResultEvent.RESULT, onResult);
		}
		
		private function onResult(event:ResultEvent):void
		{
			responder.result(event);
		}
		
		private function onFault(event:FaultEvent):void
		{
			responder.fault(event);			
		}
		
		private function onOtherError(event:Event):void
		{
			trace(event);
		}
		
		public function loadLabInStaticData(searchString:String , clinicBranchId:int , sessionID:String):void
		{
			service.showBusyCursor = true;
			service.url  = service.url + "/" + clinicBranchId + "/" + sessionID ;
			
			var xml2send:XML = XmlUtils.getNodeWithData(searchString, "string");
			
			service.send(xml2send);
		}
	}
}