package com.gazuntite.common.delegate.visit
{
	import com.gazuntite.common.util.QSCommonServiceMethods;
	import com.gazuntite.common.util.QSConstants;
	import com.gazuntite.common.util.xml.XmlUtils;
	
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadCPTMedicalTypesDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		
		
		public function LoadCPTMedicalTypesDelegate(responder:IResponder)
		{
			this.responder 		= responder;
			var url:String 		= QSConstants.RESTFULL_SERVICE_BASE_URL + QSCommonServiceMethods.LOAD_CPT_MEDICAL_TYPES;			
			service 			= new HTTPService(url);
			service.url 		= url;	
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		public function CPTMediacalTypeList(cptName:String , sessionID:String ):void
		{
			
			service.showBusyCursor = true;
			service.url = service.url + "/" + sessionID;
			service.resultFormat = "e4x";
			service.method = URLRequestMethod.POST;
			service.contentType = "text/xml";
			
			var xml2Send:XML = XmlUtils.getNodeWithData(cptName, "string");
			
			service.send(xml2Send);
		}
		
		private function onResult(event:ResultEvent):void
		{
			responder.result(event);
			//logger.debug( "LoadAllClaimbyProviderId -- > result for call:<br>" + service.url + "<br> " + event.result);
		}
		
		private function onFault(event:FaultEvent):void
		{
			responder.fault(event);			
		}
	}
}