package com.gazuntite.input.delegate.visit.assessment.plan.labout
{
	import com.gazuntite.common.util.QSConstants;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.input.utils.QIServiceMethods;
	
	import flash.net.URLRequestMethod;
	
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadLIONICLabTestTypeDelegate
	{
		
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function LoadLIONICLabTestTypeDelegate(responder:IResponder)
		{
			this.responder 		= responder;
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL + QIServiceMethods.LOAD_LIONIOC_LAB_TEST_TYPE;			
			service 			= new HTTPService(url);
			service.url 		= url;	
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function LoadLIONICLabTestType(labtestTypeID:int,labTestCodeOrName:String,LoggedInUserSessionID:String):void
		{
			service.showBusyCursor = true;
			service.url = service.url + "/" + labtestTypeID + "/" + LoggedInUserSessionID;
			service.resultFormat = "e4x";
			service.method = URLRequestMethod.POST;
			service.contentType = "text/xml";
			
			var xml2Send:XML = XmlUtils.getNodeWithData(labTestCodeOrName, "string");
			
			service.send(xml2Send);
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