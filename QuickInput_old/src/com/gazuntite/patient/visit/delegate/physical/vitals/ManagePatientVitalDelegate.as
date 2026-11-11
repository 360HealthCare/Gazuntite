package com.gazuntite.patient.visit.delegate.physical.vitals
{
	import com.gazuntite.patient.visit.dto.VitalsDTO;
	import com.gazuntite.patient.visit.utils.QIConstants;
	import com.gazuntite.patient.visit.utils.QIServiceMethods;
	import com.gazuntite.common.util.xml.XmlUtils;
	
	import flash.net.URLRequestMethod;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class ManagePatientVitalDelegate
	{
		private var responder : IResponder;
		private var service : HTTPService;
		
		public function ManagePatientVitals(newList:ArrayCollection,userID:int,VisitID:int , actionDate:String , LoggedInUserSessionID:String):void
		{
			service.url  = service.url	+ "/" + userID + "/" + VisitID + "/" + actionDate + "/" + LoggedInUserSessionID ;
			
			trace(service.url);
			
			//var xml2send:XML = ; //= XmlUtils.getNodeByTagName( "VitalDTO" );
			
			for each( var dto:VitalsDTO in newList )
			{
			 var xml2send : XML  = dto.ToXML();
			}
			
			trace(xml2send);
			
			service.send(xml2send);
		}
		public function ManagePatientVitalDelegate(responder:IResponder)
		{
			this.service 		=  new HTTPService();
			this.responder 		= responder;	
			
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL  + QIServiceMethods.MANAGE_PATIENT_VITALS;
			service 			= new HTTPService(url);
			service.url 		= url;
			service.method		= URLRequestMethod.POST;
			service.resultFormat = "e4x";
			service.contentType = "application/xml; charset=utf-8";
			
			//logger.debug( "service.url", url );
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
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