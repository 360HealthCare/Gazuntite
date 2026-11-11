package com.gazuntite.patient.visit.delegate.assessment.plan.labout
{
	import com.gazuntite.patient.visit.utils.QIConstants;
	import com.gazuntite.patient.visit.utils.QIServiceMethods;
	import com.gazuntite.common.util.QSConstants;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadLabPriorityTypeDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function LoadLabPriorityTypeDelegate(responder:IResponder)
		{
			this.responder 		= responder;
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL + QIServiceMethods.LOAD_LABOUT_PRIORITY;			
			service 			= new HTTPService(url);
			service.url 		= url;	
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		public function LoadLabPriority(LoggedInUserSessionID:String ):void
		{
			service.showBusyCursor = true;
			service.url = service.url + "/" + LoggedInUserSessionID;
			service.resultFormat = "e4x";
			service.send();	
			trace( "LoadLaboutPriorityDelegate", service.url );
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