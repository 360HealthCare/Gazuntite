package com.gazuntite.patient.visit.delegate.physical.cchpi
{
	import com.gazuntite.patient.visit.dto.HPI_CCDTO;
	import com.gazuntite.patient.visit.utils.QIConstants;
	import com.gazuntite.patient.visit.utils.QIServiceMethods;
	import com.gazuntite.common.util.xml.XmlUtils;
	
	import flash.net.URLRequestMethod;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class ManagePatientHPIDelegate
	{
		private var responder : IResponder;
		private var service : HTTPService;
		
		public function ManagePatientHPIDelegate(responder:IResponder)
		{
			this.service 		=  new HTTPService();
			this.responder 		= responder;	
			
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL  + QIServiceMethods.MANAGE_PATIENT_HPI_CC;
			service 			= new HTTPService(url);
			service.url 		= url;
			service.method		= URLRequestMethod.POST;
			service.resultFormat = "e4x";
			service.contentType = "application/xml; charset=utf-8";
			
			//logger.debug( "service.url", url );
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function ManagePatientHPI(newList:ArrayCollection,LoggedInUserId:int, patientID:int, VisitID:int , ClinicBranchIdSeq:int, actionDate:String, SessionID:String):void
		{
			service.url  = service.url + "/" + LoggedInUserId + "/" + patientID + "/" +	VisitID + "/" + ClinicBranchIdSeq + "/" + actionDate + "/" + SessionID ;
			
			trace(service.url);
			
			var xml2send:XML = XmlUtils.getNodeByTagName( "ArrayOfHPI_CCDTO" );
			
			for each( var dto:HPI_CCDTO in newList )
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