package com.gazuntite.input.delegate.visit.assessment.plan.followup
{
	import com.gazuntite.input.utils.QIConstants;
	import com.gazuntite.input.utils.QIServiceMethods;
	import com.gazuntite.common.util.QSConstants;
	
	import mx.rpc.IResponder;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadFollowUpInstructionAgeTypeDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		
		public function LoadLabOutOderMethodTypeData(sessonID:String):void
		{
			service.showBusyCursor = true;
			service.url = service.url + "/" + sessonID;
			service.resultFormat = "e4x";
			service.send();	
			trace( "LoadLaboutTestTypeDelegate", service.url );
		}
		
		public function LoadFollowUpInstructionAgeTypeDelegate(responder:IResponder)
		{
			this.responder 		= responder;
			var url:String 		= QIConstants.RESTFULL_SERVICE_BASE_URL + QIServiceMethods.LOAD_FOLLOWUP_INSTRUCTION_AGE_TYPE;			
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