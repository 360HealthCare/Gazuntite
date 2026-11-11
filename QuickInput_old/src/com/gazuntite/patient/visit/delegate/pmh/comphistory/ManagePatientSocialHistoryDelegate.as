package com.gazuntite.patient.visit.delegate.pmh.comphistory
{
	import com.gazuntite.patient.visit.dto.SocialHistoryDTO;
	import com.gazuntite.patient.visit.utils.QIConstants;
	import com.gazuntite.patient.visit.utils.QIServiceMethods;
	import com.gazuntite.common.util.xml.XmlUtils;
	
	import flash.net.URLRequestMethod;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class ManagePatientSocialHistoryDelegate
	{
		private var responder	:IResponder;
		private var Service		:HTTPService;
		
		public function ManagePatientSocialHistoryDelegate(responder:IResponder)
		{
			this.Service 		=  new HTTPService();
			this.responder 		= responder;	
			
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL;
			Service 			= new HTTPService(url);
			Service.url 		= url;
			Service.method		= URLRequestMethod.POST;
			Service.resultFormat = "e4x";
			Service.contentType = "application/xml; charset=utf-8";
			
			Service.addEventListener(FaultEvent.FAULT, onFault);
			Service.addEventListener(ResultEvent.RESULT, onResult);
		}
		
		public function ManagePatientSocialHistory(SocialHistory:SocialHistoryDTO, BranchId:int , patientID:int , SessionID:String):void
		{
			Service.url  = Service.url +  QIServiceMethods.MANAGE_SOCIAL_HISTORY + "/" + BranchId + "/" + patientID + "/" + SessionID;
			
			var xml2send:XML = XmlUtils.getNodeByTagName( "ArrayOfSocialHistoryDTO" );
			xml2send.appendChild( SocialHistory.ToXML() );
			
			trace(xml2send);
			
			Service.send(xml2send);
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
