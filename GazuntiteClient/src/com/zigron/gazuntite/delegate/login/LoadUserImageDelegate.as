package com.zigron.gazuntite.delegate.login
{
	import com.zigron.gazuntite.utils.Constants;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoadUserImageDelegate
	{
		
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		
		public function LoadUserImageDelegate( responder : IResponder )
		{	
			this.responder 		= responder;
			var url:String 		= Constants.RESTFULL_USER_MANAGER_SERVICE_BASE_URL  + 'LoadUserImage'; 
			service 			= new HTTPService(url);
			service.url 		= url;
		}
		
		public function LoadLoggedInUserImage(userId:int, userTypeID:int) : void {
		
			service.url = service.url +'/' + userId +'/'+ userTypeID;
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
			service.resultFormat = "e4x";
			service.send();
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