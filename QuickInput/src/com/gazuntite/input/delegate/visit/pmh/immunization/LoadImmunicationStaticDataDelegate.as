package com.gazuntite.input.delegate.visit.pmh.immunization
{
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.input.utils.QIServiceMethods;
	import com.gazuntite.common.util.QSConstants;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadImmunicationStaticDataDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function LoadImmunicationStaticDataDelegate(responder:IResponder)
		{
			this.responder 			= responder;
			var url:String 			= QIConstants.RESTFULL_SERVICE_BASE_URL  + QIServiceMethods.LOAD_IMMUNICATION_STATIC_DATA;			
			service 				= new HTTPService(url);
			service.url 			= url;	
			service.contentType     = 'text/xml';
			service.method 			= 'POST';	
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function LoadImmunicationStaticData(searchCritera:String, clinicBranchID:int, subSectionName:String, sessionID:String):void
		{
			var xml:XML 			= <ImmunicationStaticData/>;
			xml.@SearchString 		= searchCritera;
			xml.@ClinicBranchID 	= clinicBranchID;
			xml.@SectionName 		= subSectionName;
			xml.@SessionID 			= sessionID;
			//xml.appendChild(data);
			
			service.showBusyCursor = true;
			//LoadImmunicationStaticData/{searchCritera}/{clinicBranchID}/{subSectionName}/{userSessionID}
			//service.url = service.url + "/" + searchCritera + "/" + clinicBranchID + "/" + subSectionName + "/" + sessionID;
			service.resultFormat = "e4x";
			service.send(xml);	
			
			trace( "LoadLaboutSpecimenTypeDelegate", service.url );
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