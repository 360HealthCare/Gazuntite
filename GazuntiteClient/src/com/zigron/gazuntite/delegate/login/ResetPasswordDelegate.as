package com.zigron.gazuntite.delegate.login
{
	import com.zigron.gazuntite.utils.CommonServiceMethods;
	import com.zigron.gazuntite.utils.Constants;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class ResetPasswordDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		
		public function ResetPasswordDelegate(responder : IResponder)
		{
			this.responder 		= responder;
			var url:String 		= Constants.RESTFULL_SERVICE_BASE_URL +  CommonServiceMethods.RESET_USER_PASSWORD ;
			service 			= new HTTPService(url);
			service.url 		= url;
			service.method      = "POST";
			service.contentType = 'application/xml';
			
		}
		
		public function ResetPassword(email:String):void
		{
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
			
			service.url = service.url ;
			service.resultFormat = "e4x";
			var param:String = '<string>'+email+'</string>'
			service.send(param);
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