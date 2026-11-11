package com.gazuntite.input.delegate.visit.assessment.plan.followup
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

	public class LoadFollowUpServiceTypeDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function LoadFollowUpServiceTypeDelegate(responder:IResponder)
		{
			this.responder 		= responder;
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL + QIServiceMethods.LOAD_FOLLOWUP_SERVICE_TYPE ;			
			service 			= new HTTPService(url);
			service.url 		= url;	
			service.method = URLRequestMethod.POST;
			service.contentType = "application/xml";
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function LoadServiceType(LoggedInUserSessionID:String ,followupDataControlTypeID:int , LoggedInUserSelectedBranchId:int, searchTerm:String):void
		{
			service.showBusyCursor = true;
			service.url = service.url;// + "/" + LoggedInUserSessionID + "/" + followupDataControlTypeID + "/" + LoggedInUserSelectedBranchId + "/" + searchTerm;
			service.resultFormat = "e4x";
			
			var xml2send:XML = XmlUtils.getNodeByTagName("PatientFollowupRequest");
			xml2send.@["UserSessionID"] = LoggedInUserSessionID;
			xml2send.@["FollowupDataControlTypeID"] = followupDataControlTypeID;
			xml2send.@["ClinicBranchId"] = LoggedInUserSelectedBranchId;
			xml2send.@["SearchString"] = searchTerm;
			
			service.send(xml2send);
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