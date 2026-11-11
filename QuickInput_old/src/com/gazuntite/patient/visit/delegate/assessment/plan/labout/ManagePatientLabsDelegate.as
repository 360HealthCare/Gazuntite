package com.gazuntite.patient.visit.delegate.assessment.plan.labout
{
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.patient.visit.dto.LabDTO;
	import com.gazuntite.patient.visit.utils.QIConstants;
	import com.gazuntite.patient.visit.utils.QIServiceMethods;
	
	import flash.net.URLRequestMethod;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class ManagePatientLabsDelegate
	{
		private var responder : IResponder;
		private var service : HTTPService;
		
		public function ManagePatientLabsDelegate(responder:IResponder)
		{
			this.service 		=  new HTTPService();
			this.responder 		= responder;	
			
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL + QIServiceMethods.MANAGE_PATIENT_LABOUT;
			service 			= new HTTPService(url);
			service.url 		= url;
			service.method		= URLRequestMethod.POST;
			service.resultFormat = "e4x";
			service.contentType = "application/xml; charset=utf-8";
			
			//logger.debug( "service.url", url );
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		public function ManagelaboutDTO(newList:ArrayCollection, LoggedInUserSessionID :String):void
		{
			service.url  = service.url + "/" + LoggedInUserSessionID ;
			
			trace(service.url);
			
			var xml2send:XML; //= XmlUtils.getNodeByTagName( "LabDTO" );
			
			for each( var dto:LabDTO in newList )
			{
				xml2send = ( dto.ToXML() );
			}
			
			trace(xml2send);
			
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