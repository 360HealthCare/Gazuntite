package com.gazuntite.patient.visit.delegate.NoteDictation 
{
	import com.gazuntite.patient.visit.dto.ModuleDictationDTO;
	import com.gazuntite.patient.visit.utils.QIConstants;
	import com.gazuntite.patient.visit.utils.QIServiceMethods;
	import com.gazuntite.common.util.xml.XmlUtils;
	
	import flash.net.URLRequestMethod;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class ManageModuleDictationDelegate
	{
		private var responder : IResponder;
		private var service : HTTPService;
		
		public function ManageModuleDictationDelegate(responder:IResponder)
		{
			this.service 		=  new HTTPService();
			this.responder 		= responder;	
			
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL + QIServiceMethods.MANAGE_MODULE_DICTATION;
			service 			= new HTTPService(url);
			service.url 		= url;
			service.method		= URLRequestMethod.POST;
			service.resultFormat = "e4x";
			service.contentType = "application/xml; charset=utf-8";
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);	
		}
		
		public function ManageDictation(dto:ModuleDictationDTO ,LoggedInUserId:int , branchid:int ,VisitID:int , LoggedInUserSessionID:String):void
		{
			service.url  = service.url + "/" + LoggedInUserId + "/"  + branchid   + "/" + VisitID + "/" + LoggedInUserSessionID ;
			
			trace(service.url);
			
			var xml2send:XML = XmlUtils.getNodeByTagName( "ArrayOfModuleDictationDTO" );
			
			xml2send.appendChild( dto.ToXML() );
			
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