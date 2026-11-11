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
	import mx.rpc.http.mxml.HTTPService;

	public class ManagePatientSocialHistoryDeleteDelegate
	{
		private var responder:IResponder;
		private var Service:HTTPService;
		
		public function ManagePatientSocialHistoryDeleteDelegate(responder:IResponder)
		{
			this.Service = new HTTPService();
			this.responder = responder;	
			
			var url:String = QIConstants.RESTFULL_SERVICE_BASE_URL;
			Service = new HTTPService(url);
			Service.url = url;
			Service.method = URLRequestMethod.GET;
			Service.resultFormat = "e4x";
			Service.contentType = "application/xml; charset=utf-8";
			
			Service.addEventListener(FaultEvent.FAULT, onFault);
			Service.addEventListener(ResultEvent.RESULT, onResult);
		}
		
		public function ManagePatientSocialHistoryDelete(socialHistroyAddictionID:int, sectionName:String, patientSocialHistoryID:int, modifiedBy:int):void
		{
			Service.url  = Service.url +  QIServiceMethods.MANAGE_SOCIAL_HISTORY_DELETE + "/" + socialHistroyAddictionID + "/" + sectionName + "/" + patientSocialHistoryID + "/" + modifiedBy;
			
			//var xml2send:XML = XmlUtils.getNodeByTagName("ArrayOfSocialHistoryDTO");
			//xml2send.appendChild(SocialHistory.ToXML());
			
			//trace(xml2send);
			
			Service.send(/*xml2send*/);
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