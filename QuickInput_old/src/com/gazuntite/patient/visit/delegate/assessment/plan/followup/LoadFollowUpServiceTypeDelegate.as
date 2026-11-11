package com.gazuntite.patient.visit.delegate.assessment.plan.followup
{
	import com.gazuntite.common.util.QSConstants;
	import com.gazuntite.patient.visit.utils.QIConstants;
	import com.gazuntite.patient.visit.utils.QIServiceMethods;
	import com.gazuntite.utils.UtilityFunctions;
	
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadFollowUpServiceTypeDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function LoadServiceType(LoggedInUserSessionID:String ,followupDataControlTypeID:int , LoggedInUserSelectedBranchId:int, searchTerm:String):void
		{
			searchTerm = UtilityFunctions.getEncodedBase64String(searchTerm);
			service.showBusyCursor = true;
			service.url = service.url + "/" + LoggedInUserSessionID + "/" + followupDataControlTypeID + "/" + LoggedInUserSelectedBranchId + "/" + searchTerm;
			service.resultFormat = "e4x";
			service.send();	
			
			trace( "LoadfollowupserviceTypeDelegate", service.url );
		}
		
		private function onResult(event:ResultEvent):void
		{
			responder.result(event);
		}
		
		private function onFault(event:FaultEvent):void
		{
			responder.fault(event);			
		}
		
		public function LoadFollowUpServiceTypeDelegate(responder:IResponder)
		{
			this.responder 		= responder;
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL + QIServiceMethods.LOAD_FOLLOWUP_SERVICE_TYPE ;			
			service 			= new HTTPService(url);
			service.url 		= url;	
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
	}
}