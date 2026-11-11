package com.gazuntite.common.delegate
{
	import com.gazuntite.common.dto.VitalsDTO;
	import com.gazuntite.common.util.QSConstants;
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
		
		public function ManagePatientVitals(VitalDTO:VitalsDTO,userID:int,VisitID:int , actionDate:String , LoggedInUserSessionID:String):void
		{
			service.showBusyCursor = true;
			
			service.url  = service.url	+ "/" + userID + "/" + VisitID + "/" + actionDate + "/" + LoggedInUserSessionID ;
			
			 var xml2send : XML  = VitalDTO.ToXML();
			
			service.send(xml2send);
		}
		public function ManagePatientVitalDelegate(responder:IResponder)
		{
			this.service 		=  new HTTPService();
			this.responder 		= responder;	
			
			var url:String 		= QSConstants.RESTFULL_SERVICE_BASE_URL  + "ManagePatientVital";
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