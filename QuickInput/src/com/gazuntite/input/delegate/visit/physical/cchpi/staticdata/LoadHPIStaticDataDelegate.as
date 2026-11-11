package com.gazuntite.input.delegate.visit.physical.cchpi.staticdata
{
	import com.gazuntite.common.util.xml.XmlUtils;
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.input.utils.QIServiceMethods;
	
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLRequestMethod;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadHPIStaticDataDelegate
	{
		private var responder : IResponder;
		private var service : HTTPService;
		
		public function LoadHPIStaticDataDelegate( responder:IResponder)
		{		
			this.service =  new HTTPService();
			this.responder = responder;	
			
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL + QIServiceMethods.HPI_LOAD_STATIC_DATA;
			service 			= new HTTPService(url);
			service.url 		= url;
			service.method		= URLRequestMethod.POST;
			service.contentType = "application/xml";
			service.resultFormat = "e4x";
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
			
		}
		
		public function LoadHPIStaticData(hpiId:int, clinicBranchId:int, sessionID:String, searchString:String) : void 
		{
			service.showBusyCursor = true;
			//LoadHPIDetailAutoCompleteByTypeIdAndClinicId/{hpiTypeId}/{clinicBranchId}/{searchCriteria}/{sessionID} 
			/*if( searchString == QIConstants.EMPTY_STRING )
			{
				service.url  = service.url + "/" + hpiId + "/" + clinicBranchId + "/\"\"/" + sessionID;
			}
			else
			{
				service.url  = service.url + "/" + hpiId + "/" + clinicBranchId + "/" + searchString  + "/" + sessionID;
			}*/
			
			var xml2Send:XML = XmlUtils.getNodeByTagName("HPI_Search");
			xml2Send.@["HPITypeID"] = hpiId;
			xml2Send.@["SearchString"] = searchString;
			xml2Send.@["SessionID"] = sessionID;
			xml2Send.@["ClinicBranchID"] = clinicBranchId;
			
			service.send(xml2Send);
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