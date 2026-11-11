package com.gazuntite.input.delegate.visit.physical.cchpi
{
	import com.gazuntite.common.dto.physical.ccHpi.ChiefComplaintHpiDTO;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.input.utils.QIServiceMethods;
	
	import flash.net.URLRequestMethod;
	
	import mx.collections.ArrayCollection;
	import mx.managers.CursorManager;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class ManagePatientHPIDelegate
	{
		private var responder:IResponder;
		private var service:HTTPService;
		
		public function ManagePatientHPIDelegate(responder:IResponder)
		{
			this.service = new HTTPService();
			this.responder = responder;	
			
			var url:String = QIConstants.RESTFULL_SERVICE_BASE_URL  + QIServiceMethods.MANAGE_PATIENT_HPI_CC;
			service = new HTTPService(url);
			service.url = url;
			service.method = URLRequestMethod.POST;
			service.resultFormat = "e4x";
			service.contentType = "application/xml; charset=utf-8";
			
			service.addEventListener(FaultEvent.FAULT, onFault);
			service.addEventListener(ResultEvent.RESULT, onResult);
		}
		
		public function ManagePatientHPI(newList:ArrayCollection, LoggedInUserId:int, patientID:int, VisitID:int, ClinicBranchIdSeq:int, actionDate:String, SessionID:String):void
		{
			service.showBusyCursor = true;
			
			service.url  = service.url + "/" + LoggedInUserId + "/" + patientID + "/" +	VisitID + "/" + ClinicBranchIdSeq + "/" + actionDate + "/" + SessionID;
			
			var xml2send:XML = XmlUtils.getNodeByTagName("ArrayOfHPI_CCDTO");
			
			for each (var dto:ChiefComplaintHpiDTO in newList)
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