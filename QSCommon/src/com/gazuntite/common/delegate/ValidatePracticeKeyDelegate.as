package com.gazuntite.common.delegate
{
	import com.gazuntite.common.util.QSCommonServiceMethods;
	import com.gazuntite.common.util.QSConstants;
	
	import mx.managers.CursorManager;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class ValidatePracticeKeyDelegate
	{
		private var responder : IResponder;
		private var RestfulService : HTTPService;
		
		public function ValidatePracticeKeyDelegate(responder : IResponder)
		{
			this.responder 		= responder;
			var url:String 		= QSConstants.USER_MANAGER_RESTFULL_SERVICE_BASE_URL + QSCommonServiceMethods.VALIDATE_PRACTICE_KEY;
			RestfulService 			= new HTTPService(url);
			RestfulService.url 		= url;
			
			RestfulService.addEventListener(FaultEvent.FAULT,onFault);
			RestfulService.addEventListener(ResultEvent.RESULT,onResult);
			
		}
		
		public function isValidKey(practiceKey:String) : void 
		{
			RestfulService.url 		+= "/" + practiceKey;
			RestfulService.resultFormat = "e4x";			
			CursorManager.setBusyCursor();			
			RestfulService.send();
		}
		
		private function onResult(event:ResultEvent):void
		{
			CursorManager.removeBusyCursor();
			responder.result(event);
		}
		
		private function onFault(event:FaultEvent):void
		{
			CursorManager.removeBusyCursor();
			responder.fault(event);			
		}
	}
}