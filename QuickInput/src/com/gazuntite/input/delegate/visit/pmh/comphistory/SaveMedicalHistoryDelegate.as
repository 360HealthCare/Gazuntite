package com.gazuntite.input.delegate.visit.pmh.comphistory
{
		
	import com.gazuntite.common.dto.pmh.compHistory.MedicalHistoryDTO;
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.input.utils.QIServiceMethods;
	
	import flash.net.URLRequestMethod;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class SaveMedicalHistoryDelegate
	{
		private var responder	:IResponder;
		private var Service		:HTTPService;
		
		private var logger:ILogger = Log.getLogger("com.adobe.Quivus.delegate.quickInput.SaveMedicalHistoryDelegate");
		
		public function SaveMedicalHistoryDelegate(responder:IResponder)
		{
			this.Service 		=  new HTTPService();
			this.responder 		= responder;	
			
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL;
			Service 			= new HTTPService(url);
			Service.url 		= url;
			Service.method		= URLRequestMethod.POST;
			Service.resultFormat = "e4x";
			Service.contentType = "application/xml; charset=utf-8";
			
			
			Service.addEventListener(FaultEvent.FAULT, onFault);
			Service.addEventListener(ResultEvent.RESULT, onResult);
		}
		
		public function SaveMedicalHistoryList(medicalHistoryDTO:MedicalHistoryDTO, branchId:int, patientId:int , sessionID:String):void
		{
			Service.url  = Service.url +  QIServiceMethods.MANAGE_MEDICAL_HISTORY + "/" + branchId + "/" + patientId + "/" + sessionID;
			
			var xml2send:XML = XmlUtils.getNodeByTagName( "ArrayOfMedicalHistoryDTO" );
			xml2send.appendChild( medicalHistoryDTO.ToXML() );
			
			trace(xml2send);
			
			Service.send(xml2send);
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