package com.gazuntite.input.delegate.visit.physical.physical
{
	import com.gazuntite.common.dto.physical.ros.PhysicalDTO;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.input.utils.QIServiceMethods;
	
	import flash.events.Event;
	import flash.net.URLRequestMethod;
	
	import mx.collections.ArrayCollection;
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class ManagePatientPhysicalDelegate
	{
		private var responder : IResponder;
		private var service : HTTPService;
		
		private var logger:ILogger = Log.getLogger("com.gazuntite.input.delegate.visit.physical.physical.ManagePatientPhysicalDelegate");
		
		
		public function ManagePatientPhysicalDelegate(responder:IResponder)
		{
			this.service 		=  new HTTPService();
			this.responder 		= responder;	
			
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL  + QIServiceMethods.MANAGE_PATIENT_PHYSICAL;
			service 			= new HTTPService(url);
			service.url 		= url;
			service.method		= URLRequestMethod.POST;
			service.resultFormat = "e4x";
			service.contentType = "application/xml; charset=utf-8";
			
			logger.debug( "service.url", url );
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function ManagePatientPhysical(dtoList:ArrayCollection, managedByUserId:int, visitId:int, patientId:int, actionDate:String, userSessionID:String ):void
		{
			service.url  = service.url + "/" + managedByUserId + "/" + visitId + "/" + patientId + "/" + actionDate + "/" + userSessionID ;
			
			trace(service.url);
			
			var xml2send:XML = XmlUtils.getNodeByTagName( "ArrayOfPhysicalsDTO" );
			for each( var dto:PhysicalDTO in dtoList )
			{
				xml2send.appendChild( dto.ToXML() );
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
		
		private function onOtherError(event:Event):void
		{
			trace(event);			
		}
		
	}
}