package com.gazuntite.input.delegate.visit.physical.labin
{
	import com.gazuntite.common.dto.physical.inHouseLab.InHouseLabDTO;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.input.utils.QIServiceMethods;
	
	import flash.net.URLRequestMethod;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class ManagePatientInHouseLabsDelegate
	{
		private var responder : IResponder;
		private var service : HTTPService;
		
		public function ManagePatientInHouseLabsDelegate(responder:IResponder)
		{
			this.service 		=  new HTTPService();
			this.responder 		= responder;	
			
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL  + QIServiceMethods.MANAGE_PATIENT_LAB_IN;
			service 			= new HTTPService(url);
			service.url 		= url;
			service.method		= URLRequestMethod.POST;
			service.resultFormat = "e4x";
			service.contentType = "application/xml; charset=utf-8";
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function ManagePatientInHouse(newList,LoggedInUserId :int, VisitID :int , patientID :int, actionDate:String, LoggedInUserSessionID:String):void
		{
			service.url  = service.url + "/" + LoggedInUserId + "/" + VisitID + "/" + patientID  + "/" + actionDate  + "/" + LoggedInUserSessionID ;
			
			trace(service.url);
						
			var xml2send:XML = XmlUtils.getNodeByTagName( "ArrayOfInHouseLabDTO" );
			for each( var dto:InHouseLabDTO in newList )
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
		
	}
}