package com.zigron.gazuntite.delegate.login
{
	import com.zigron.gazuntite.model.valueObjects.login.LoginRequestDTO;
	import com.zigron.gazuntite.utils.CommonServiceMethods;
	import com.zigron.gazuntite.utils.Constants;
	
	import flash.net.URLRequestMethod;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.managers.CursorManager;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	public class LoginDelegate
	{
		private var responder	:IResponder;
		private var service		:HTTPService;
		private var logger:ILogger = Log.getLogger("com.zigron.gazuntite.delegate.login");
		
		
		public function LoginDelegate(responder:IResponder)
		{
			this.responder 		= responder;
			var url:String 		= Constants.RESTFULL_SERVICE_BASE_URL + CommonServiceMethods.AUTHENTICATE_USER;
			service 			= new HTTPService(url);
			service.url 		= url;
			
			service.contentType =  "application/xml";//"Text/Xml";
			service.method		= URLRequestMethod.POST;
			
			service.addEventListener(FaultEvent.FAULT,onFault);
			service.addEventListener(ResultEvent.RESULT,onResult);
		}
		
		public function sendLoginRequest(request:LoginRequestDTO):void
		{
			var url:String 		= Constants.RESTFULL_SERVICE_BASE_URL + CommonServiceMethods.AUTHENTICATE_USER;
			service.url 		= url;
			service.resultFormat = "e4x";
			CursorManager.setBusyCursor();
			service.send( request.ToXML().toXMLString() );
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