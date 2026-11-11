package com.gazuntite.patient.visit.delegate.physical.ros
{
	import com.gazuntite.patient.visit.dto.ROSDTO;
	import com.gazuntite.patient.visit.dto.ROSPhysicalBaseDTO;
	import com.gazuntite.patient.visit.utils.QIConstants;
	import com.gazuntite.patient.visit.utils.QIServiceMethods;
	import com.gazuntite.common.util.xml.XmlUtils;
	
	import flash.events.Event;
	import flash.net.URLRequestMethod;
	
	import mx.collections.ArrayCollection;
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class ManagePatientROSDelegate
	{
		private var responder : IResponder;
		private var service : HTTPService;
		
		private var logger:ILogger = Log.getLogger("com.gazuntite.patient.visit.delegate.physical.ros.ManagePatientROSDelegate");
		
		
		
		public function ManagePatientROSDelegate(responder:IResponder)
		{
			this.service 		=  new HTTPService();
			this.responder 		= responder;	
			
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL  + QIServiceMethods.MANAGE_PATIENT_ROS;
			service 			= new HTTPService(url);
			service.url 		= url;
			service.method		= URLRequestMethod.POST;
			service.resultFormat = "e4x";
			service.contentType = "application/xml; charset=utf-8";
			
			logger.debug( "service.url", url );
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function ManagePatientRos(dtoList:ArrayCollection, managedByUserId:int, visitId:int, patientId:int, actionDate:String, userSessionID:String ):void
		{
			service.url  = service.url + "/" + managedByUserId + "/" +  visitId + "/" + patientId + "/" + actionDate + "/" + userSessionID ;
			
			trace(service.url);
			
			var xml2send:XML = XmlUtils.getNodeByTagName( "ArrayOfROSDTO" );
			for each( var dto:ROSDTO in dtoList )
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