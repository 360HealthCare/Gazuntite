package com.gazuntite.input.delegate.visit.assessment.plan.followup
{
	import com.gazuntite.common.dto.assessment.followUp.FollowUpDTO;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.input.utils.QIServiceMethods;
	
	import flash.net.URLRequestMethod;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class ManagePatientFollowUpDelegate
	{
		private var responder:IResponder;
		private var service:HTTPService;
		
		public function ManagePatientFollowUpDelegate(responder:IResponder)
		{
			this.service 		=  new HTTPService();
			this.responder 		= responder;	
			
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL + QIServiceMethods.MANAGE_PATIENT_FOLLOWUP;
			service 			= new HTTPService(url);
			service.url 		= url;
			service.method		= URLRequestMethod.POST;
			service.resultFormat = "e4x";
			service.contentType = "application/xml; charset=utf-8";
			
			service.addEventListener(FaultEvent.FAULT, onFault);
			service.addEventListener(ResultEvent.RESULT, onResult);
		}
		
		public function ManagefollowUp(newList:ArrayCollection, LoggedInUserSessionID:String):void
		{
			service.url  = service.url + "/" + LoggedInUserSessionID;
			
			var xml2send:XML = XmlUtils.getNodeByTagName("ArrayOfPatientFollowupMergedDTO");
			
			for each (var dto:FollowUpDTO in newList)
			{
				xml2send.appendChild(dto.ToXML());
			}
			
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