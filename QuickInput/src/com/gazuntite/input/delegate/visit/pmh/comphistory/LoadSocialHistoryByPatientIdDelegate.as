package com.gazuntite.input.delegate.visit.pmh.comphistory
{
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.input.utils.QIServiceMethods;
	import com.gazuntite.common.util.QSConstants;
	
	import flash.net.URLRequestMethod;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadSocialHistoryByPatientIdDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		public function LoadSocialHistoryByPatientIdDelegate(responder:IResponder)
		{
			this.responder 		= responder;
			//var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL + QIServiceMethods.LOAD_SOCIAL_HISTORY_BY_PATIENT_ID;			
			var url:String 		= "http://www.quivus.com/QuivusAirDev/QVisitService/RestService/VisitRestService.svc/LoadPatientSocialHistory";			
			service 			= new HTTPService(url);
			service.url 		= url;	
			//service.method		= URLRequestMethod.POST;
			service.resultFormat = "e4x";
			//service.contentType = "application/xml; charset=utf-8";
			service.contentType = "text/xml";
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function LoadSocialHistoryByPatientId(patientID:int,BranchId:int ,isAllSelected:Boolean , SessionID:String ,stationID:int)
		{
			service.showBusyCursor = true;
			service.url = service.url + "/" + patientID; // + "/" + BranchId + "/" + isAllSelected + "/" + SessionID;
			service.resultFormat = "e4x";
			service.send();	
			//service.send(getstationID(stationID));	
			
			trace( "LoadSocialHistoryDelegate", service.url );			
		}
		public function getstationID(i:int):String
		{
			return "<ArrayOfInt>"+
				"<int>"+i+"</int>"+
				"</ArrayOfInt>";
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