package com.gazuntite.patient.visit.delegate.assessment.plan.recomendation
{
	import com.gazuntite.patient.visit.utils.QIConstants;
	import com.gazuntite.patient.visit.utils.QIServiceMethods;
	import com.gazuntite.common.util.QSConstants;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadAllRecommendationDurationTypesDelegate
	{
		
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function LoadRecommendationDurationType(sessionID:String):void
		{
			service.showBusyCursor = true;
			service.url = service.url + "/" + sessionID;
			service.resultFormat = "e4x";
			service.send();	
			trace( "LoadrecommendationDurationTypeDelegate", service.url );
		}
		public function LoadAllRecommendationDurationTypesDelegate(responder:IResponder)
		{
			this.responder 		= responder;
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL + QIServiceMethods.LOAD_ALL_DURATION_TYPES;			
			service 			= new HTTPService(url);
			service.url 		= url;	
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
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