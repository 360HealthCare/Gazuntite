package com.gazuntite.input.delegate.visit.assessment.treatment.procedure
{
	import com.gazuntite.common.dto.assessment.procedure.ProcedureDTO;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.input.utils.QIServiceMethods;
	
	import flash.net.URLRequestMethod;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class ManagePatientProcedureDelegate
	{
		private var responder : IResponder;
		private var service : HTTPService;
		
		
		public function ManagePatientProcedureDelegate(responder:IResponder)
		{
			this.service 		=  new HTTPService();
			this.responder 		= responder;	
			
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL  + QIServiceMethods.MANAGE_PATIENT_PROCEDURE;
			service 			= new HTTPService(url);
			service.url 		= url;
			service.method		= URLRequestMethod.POST;
			service.resultFormat = "e4x";
			service.contentType = "application/xml; charset=utf-8";
			
			//logger.debug( "service.url", url );
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		
		public function ManagePatientProcedure(newList, LoggedInUserId:int, VisitID:int , patientID:int , LoggedInUserSelectedBranchId:int, actionDate:String, LoggedInUserSessionID:String):void
		{
			service.url  = service.url + "/" + LoggedInUserId + "/"  + VisitID + "/"  + patientID + "/" +	LoggedInUserSelectedBranchId + "/" + actionDate + "/" + LoggedInUserSessionID ;
			 
			trace(service.url);
			
			var xml2send:XML = XmlUtils.getNodeByTagName( "ArrayOfProcedureDTO" );
			
			for each( var dto:ProcedureDTO in newList )
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