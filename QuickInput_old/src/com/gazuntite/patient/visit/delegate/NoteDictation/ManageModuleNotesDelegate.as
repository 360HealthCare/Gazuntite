package com.gazuntite.patient.visit.delegate.NoteDictation
{
	import com.gazuntite.patient.visit.dto.ModuleNoteDTO;
	import com.gazuntite.patient.visit.utils.QIConstants;
	import com.gazuntite.patient.visit.utils.QIServiceMethods;
	import com.gazuntite.common.util.xml.XmlUtils;
	
	import flash.net.URLRequestMethod;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class ManageModuleNotesDelegate
	{
		private var responder : IResponder;
		private var service : HTTPService;
		
		public function ManageModuleNotesDelegate(responder:IResponder)
		{
			this.service 		=  new HTTPService();
			this.responder 		= responder;	
			
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL + QIServiceMethods.MANAGE_MODULE_NOTES;
			service 			= new HTTPService(url);
			service.url 		= url;
			service.method		= URLRequestMethod.POST;
			service.resultFormat = "e4x";
			service.contentType = "application/xml; charset=utf-8";
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);	
		}
		
		public function ManageNotes(dto:ModuleNoteDTO ,LoggedInUserId:int ,VisitID:int ,actionDate:String , LoggedInUserSessionID:String):void
		{
			service.url  = service.url + "/" + LoggedInUserId + "/" + VisitID  + "/"  + actionDate  + "/" + LoggedInUserSessionID ;
			
			trace(service.url);
			
			var xml2send:XML = XmlUtils.getNodeByTagName( "ArrayOfModuleNoteDTO" );
			
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